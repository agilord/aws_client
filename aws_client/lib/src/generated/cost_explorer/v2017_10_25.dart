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

/// You can use the Cost Explorer API to programmatically query your cost and
/// usage data. You can query for aggregated data such as total monthly costs or
/// total daily usage. You can also query for granular data. This might include
/// the number of daily write operations for Amazon DynamoDB database tables in
/// your production environment.
///
/// Service Endpoint
///
/// The Cost Explorer API provides the following endpoint:
///
/// <ul>
/// <li>
/// <code>https://ce.us-east-1.amazonaws.com</code>
/// </li>
/// </ul>
/// For information about the costs that are associated with the Cost Explorer
/// API, see <a href="http://aws.amazon.com/aws-cost-management/pricing/">Amazon
/// Web Services Cost Management Pricing</a>.
class CostExplorer {
  final _s.JsonProtocol _protocol;
  CostExplorer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ce',
            signingName: 'ce',
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

  /// Creates a new cost anomaly detection monitor with the requested type and
  /// monitor specification.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [anomalyMonitor] :
  /// The cost anomaly detection monitor object that you want to create.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html">
  /// <code>AnomalyMonitor</code> </a>. You can use resource tags to control
  /// access to your <code>monitor</code> using IAM policies.
  ///
  /// Each tag consists of a key and a value, and each key must be unique for
  /// the resource. The following restrictions apply to resource tags:
  ///
  /// <ul>
  /// <li>
  /// Although the maximum number of array members is 200, you can assign a
  /// maximum of 50 user-tags to one resource. The remaining are reserved for
  /// Amazon Web Services use
  /// </li>
  /// <li>
  /// The maximum length of a key is 128 characters
  /// </li>
  /// <li>
  /// The maximum length of a value is 256 characters
  /// </li>
  /// <li>
  /// Keys and values can only contain alphanumeric characters, spaces, and any
  /// of the following: <code>_.:/=+@-</code>
  /// </li>
  /// <li>
  /// Keys and values are case sensitive
  /// </li>
  /// <li>
  /// Keys and values are trimmed for any leading or trailing whitespaces
  /// </li>
  /// <li>
  /// Don’t use <code>aws:</code> as a prefix for your keys. This prefix is
  /// reserved for Amazon Web Services use
  /// </li>
  /// </ul>
  Future<CreateAnomalyMonitorResponse> createAnomalyMonitor({
    required AnomalyMonitor anomalyMonitor,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.CreateAnomalyMonitor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AnomalyMonitor': anomalyMonitor,
        if (resourceTags != null) 'ResourceTags': resourceTags,
      },
    );

    return CreateAnomalyMonitorResponse.fromJson(jsonResponse.body);
  }

  /// Adds an alert subscription to a cost anomaly detection monitor. You can
  /// use each subscription to define subscribers with email or SNS
  /// notifications. Email subscribers can set an absolute or percentage
  /// threshold and a time frequency for receiving notifications.
  ///
  /// May throw [UnknownMonitorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [anomalySubscription] :
  /// The cost anomaly subscription object that you want to create.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html">
  /// <code>AnomalySubscription</code> </a>. You can use resource tags to
  /// control access to your <code>subscription</code> using IAM policies.
  ///
  /// Each tag consists of a key and a value, and each key must be unique for
  /// the resource. The following restrictions apply to resource tags:
  ///
  /// <ul>
  /// <li>
  /// Although the maximum number of array members is 200, you can assign a
  /// maximum of 50 user-tags to one resource. The remaining are reserved for
  /// Amazon Web Services use
  /// </li>
  /// <li>
  /// The maximum length of a key is 128 characters
  /// </li>
  /// <li>
  /// The maximum length of a value is 256 characters
  /// </li>
  /// <li>
  /// Keys and values can only contain alphanumeric characters, spaces, and any
  /// of the following: <code>_.:/=+@-</code>
  /// </li>
  /// <li>
  /// Keys and values are case sensitive
  /// </li>
  /// <li>
  /// Keys and values are trimmed for any leading or trailing whitespaces
  /// </li>
  /// <li>
  /// Don’t use <code>aws:</code> as a prefix for your keys. This prefix is
  /// reserved for Amazon Web Services use
  /// </li>
  /// </ul>
  Future<CreateAnomalySubscriptionResponse> createAnomalySubscription({
    required AnomalySubscription anomalySubscription,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.CreateAnomalySubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AnomalySubscription': anomalySubscription,
        if (resourceTags != null) 'ResourceTags': resourceTags,
      },
    );

    return CreateAnomalySubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Cost Category with the requested name and rules.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [rules] :
  /// The Cost Category rules used to categorize costs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule</a>.
  ///
  /// Parameter [effectiveStart] :
  /// The Cost Category's effective start date. It can only be a billing start
  /// date (first day of the month). If the date isn't provided, it's the first
  /// day of the current month. Dates can't be before the previous twelve
  /// months, or in the future.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategory.html">
  /// <code>CostCategory</code> </a>. You can use resource tags to control
  /// access to your <code>cost category</code> using IAM policies.
  ///
  /// Each tag consists of a key and a value, and each key must be unique for
  /// the resource. The following restrictions apply to resource tags:
  ///
  /// <ul>
  /// <li>
  /// Although the maximum number of array members is 200, you can assign a
  /// maximum of 50 user-tags to one resource. The remaining are reserved for
  /// Amazon Web Services use
  /// </li>
  /// <li>
  /// The maximum length of a key is 128 characters
  /// </li>
  /// <li>
  /// The maximum length of a value is 256 characters
  /// </li>
  /// <li>
  /// Keys and values can only contain alphanumeric characters, spaces, and any
  /// of the following: <code>_.:/=+@-</code>
  /// </li>
  /// <li>
  /// Keys and values are case sensitive
  /// </li>
  /// <li>
  /// Keys and values are trimmed for any leading or trailing whitespaces
  /// </li>
  /// <li>
  /// Don’t use <code>aws:</code> as a prefix for your keys. This prefix is
  /// reserved for Amazon Web Services use
  /// </li>
  /// </ul>
  ///
  /// Parameter [splitChargeRules] :
  /// The split charge rules used to allocate your charges between your Cost
  /// Category values.
  Future<CreateCostCategoryDefinitionResponse> createCostCategoryDefinition({
    required String name,
    required CostCategoryRuleVersion ruleVersion,
    required List<CostCategoryRule> rules,
    String? defaultValue,
    String? effectiveStart,
    List<ResourceTag>? resourceTags,
    List<CostCategorySplitChargeRule>? splitChargeRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.CreateCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RuleVersion': ruleVersion.toValue(),
        'Rules': rules,
        if (defaultValue != null) 'DefaultValue': defaultValue,
        if (effectiveStart != null) 'EffectiveStart': effectiveStart,
        if (resourceTags != null) 'ResourceTags': resourceTags,
        if (splitChargeRules != null) 'SplitChargeRules': splitChargeRules,
      },
    );

    return CreateCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a cost anomaly monitor.
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownMonitorException].
  ///
  /// Parameter [monitorArn] :
  /// The unique identifier of the cost anomaly monitor that you want to delete.
  Future<void> deleteAnomalyMonitor({
    required String monitorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DeleteAnomalyMonitor'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorArn': monitorArn,
      },
    );
  }

  /// Deletes a cost anomaly subscription.
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownSubscriptionException].
  ///
  /// Parameter [subscriptionArn] :
  /// The unique identifier of the cost anomaly subscription that you want to
  /// delete.
  Future<void> deleteAnomalySubscription({
    required String subscriptionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DeleteAnomalySubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubscriptionArn': subscriptionArn,
      },
    );
  }

  /// Deletes a Cost Category. Expenses from this month going forward will no
  /// longer be categorized with this Cost Category.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  Future<DeleteCostCategoryDefinitionResponse> deleteCostCategoryDefinition({
    required String costCategoryArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DeleteCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
      },
    );

    return DeleteCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name, Amazon Resource Name (ARN), rules, definition, and
  /// effective dates of a Cost Category that's defined in the account.
  ///
  /// You have the option to use <code>EffectiveOn</code> to return a Cost
  /// Category that's active on a specific date. If there's no
  /// <code>EffectiveOn</code> specified, you see a Cost Category that's
  /// effective on the current date. If Cost Category is still effective,
  /// <code>EffectiveEnd</code> is omitted in the response.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  ///
  /// Parameter [effectiveOn] :
  /// The date when the Cost Category was effective.
  Future<DescribeCostCategoryDefinitionResponse>
      describeCostCategoryDefinition({
    required String costCategoryArn,
    String? effectiveOn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DescribeCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
        if (effectiveOn != null) 'EffectiveOn': effectiveOn,
      },
    );

    return DescribeCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all of the cost anomalies detected on your account during the
  /// time period that's specified by the <code>DateInterval</code> object.
  /// Anomalies are available for up to 90 days.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [dateInterval] :
  /// Assigns the start and end dates for retrieving cost anomalies. The
  /// returned anomaly object will have an <code>AnomalyEndDate</code> in the
  /// specified time range.
  ///
  /// Parameter [feedback] :
  /// Filters anomaly results by the feedback field on the anomaly object.
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [monitorArn] :
  /// Retrieves all of the cost anomalies detected for a specific cost anomaly
  /// monitor Amazon Resource Name (ARN).
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [totalImpact] :
  /// Filters anomaly results by the total impact field on the anomaly object.
  /// For example, you can filter anomalies <code>GREATER_THAN 200.00</code> to
  /// retrieve anomalies, with an estimated dollar impact greater than 200.
  Future<GetAnomaliesResponse> getAnomalies({
    required AnomalyDateInterval dateInterval,
    AnomalyFeedbackType? feedback,
    int? maxResults,
    String? monitorArn,
    String? nextPageToken,
    TotalImpactFilter? totalImpact,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetAnomalies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DateInterval': dateInterval,
        if (feedback != null) 'Feedback': feedback.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (monitorArn != null) 'MonitorArn': monitorArn,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (totalImpact != null) 'TotalImpact': totalImpact,
      },
    );

    return GetAnomaliesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the cost anomaly monitor definitions for your account. You can
  /// filter using a list of cost anomaly monitor Amazon Resource Names (ARNs).
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownMonitorException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of entries that a paginated response contains.
  ///
  /// Parameter [monitorArnList] :
  /// A list of cost anomaly monitor ARNs.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetAnomalyMonitorsResponse> getAnomalyMonitors({
    int? maxResults,
    List<String>? monitorArnList,
    String? nextPageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetAnomalyMonitors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (monitorArnList != null) 'MonitorArnList': monitorArnList,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
      },
    );

    return GetAnomalyMonitorsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the cost anomaly subscription objects for your account. You can
  /// filter using a list of cost anomaly monitor Amazon Resource Names (ARNs).
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownSubscriptionException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [monitorArn] :
  /// Cost anomaly monitor ARNs.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [subscriptionArnList] :
  /// A list of cost anomaly subscription ARNs.
  Future<GetAnomalySubscriptionsResponse> getAnomalySubscriptions({
    int? maxResults,
    String? monitorArn,
    String? nextPageToken,
    List<String>? subscriptionArnList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetAnomalySubscriptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (monitorArn != null) 'MonitorArn': monitorArn,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (subscriptionArnList != null)
          'SubscriptionArnList': subscriptionArnList,
      },
    );

    return GetAnomalySubscriptionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves estimated usage records for hourly granularity or resource-level
  /// data at daily granularity.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [approximationDimension] :
  /// The service to evaluate for the usage records. You can choose
  /// resource-level data at daily granularity, or hourly granularity with or
  /// without resource-level data.
  ///
  /// Parameter [granularity] :
  /// How granular you want the data to be. You can enable data at hourly or
  /// daily granularity.
  ///
  /// Parameter [services] :
  /// The service metadata for the service or services you want to query. If not
  /// specified, all elements are returned.
  Future<GetApproximateUsageRecordsResponse> getApproximateUsageRecords({
    required ApproximationDimension approximationDimension,
    required Granularity granularity,
    List<String>? services,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetApproximateUsageRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApproximationDimension': approximationDimension.toValue(),
        'Granularity': granularity.toValue(),
        if (services != null) 'Services': services,
      },
    );

    return GetApproximateUsageRecordsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves cost and usage metrics for your account. You can specify which
  /// cost and usage-related metric that you want the request to return. For
  /// example, you can specify <code>BlendedCosts</code> or
  /// <code>UsageQuantity</code>. You can also filter and group your data by
  /// various dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a
  /// specific time range. For a complete list of valid dimensions, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a>
  /// operation. Management account in an organization in Organizations have
  /// access to all member accounts.
  ///
  /// For information about filter limitations, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-limits.html">Quotas
  /// and restrictions</a> in the <i>Billing and Cost Management User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [granularity] :
  /// Sets the Amazon Web Services cost granularity to <code>MONTHLY</code> or
  /// <code>DAILY</code>, or <code>HOURLY</code>. If <code>Granularity</code>
  /// isn't set, the response object doesn't include the
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>, or <code>HOURLY</code>.
  ///
  /// Parameter [metrics] :
  /// Which metrics are returned in the query. For more information about
  /// blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>,
  /// <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>,
  /// <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and
  /// <code>UsageQuantity</code>.
  /// <note>
  /// If you return the <code>UsageQuantity</code> metric, the service
  /// aggregates all usage numbers without taking into account the units. For
  /// example, if you aggregate <code>usageQuantity</code> across all of Amazon
  /// EC2, the results aren't meaningful because Amazon EC2 compute hours and
  /// data transfer are measured in different units (for example, hours and GB).
  /// To get more meaningful <code>UsageQuantity</code> metrics, filter by
  /// <code>UsageType</code> or <code>UsageTypeGroups</code>.
  /// </note>
  /// <code>Metrics</code> is required for <code>GetCostAndUsage</code>
  /// requests.
  ///
  /// Parameter [timePeriod] :
  /// Sets the start date and end date for retrieving Amazon Web Services costs.
  /// The start date is inclusive, but the end date is exclusive. For example,
  /// if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters Amazon Web Services costs by different dimensions. For example,
  /// you can specify <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and
  /// get the costs that are associated with that account's usage of that
  /// service. You can nest <code>Expression</code> objects to define any
  /// combination of dimension filters. For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>.
  ///
  /// Valid values for <code>MatchOptions</code> for <code>Dimensions</code> are
  /// <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.
  ///
  /// Valid values for <code>MatchOptions</code> for <code>CostCategories</code>
  /// and <code>Tags</code> are <code>EQUALS</code>, <code>ABSENT</code>, and
  /// <code>CASE_SENSITIVE</code>. Default values are <code>EQUALS</code> and
  /// <code>CASE_SENSITIVE</code>.
  ///
  /// Parameter [groupBy] :
  /// You can group Amazon Web Services costs using up to two different groups,
  /// either dimensions, tag keys, cost categories, or any two group by types.
  ///
  /// Valid values for the <code>DIMENSION</code> type are <code>AZ</code>,
  /// <code>INSTANCE_TYPE</code>, <code>LEGAL_ENTITY_NAME</code>,
  /// <code>INVOICING_ENTITY</code>, <code>LINKED_ACCOUNT</code>,
  /// <code>OPERATION</code>, <code>PLATFORM</code>, <code>PURCHASE_TYPE</code>,
  /// <code>SERVICE</code>, <code>TENANCY</code>, <code>RECORD_TYPE</code>, and
  /// <code>USAGE_TYPE</code>.
  ///
  /// When you group by the <code>TAG</code> type and include a valid tag key,
  /// you get all tag values, including empty strings.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetCostAndUsageResponse> getCostAndUsage({
    required Granularity granularity,
    required List<String> metrics,
    required DateInterval timePeriod,
    Expression? filter,
    List<GroupDefinition>? groupBy,
    String? nextPageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostAndUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Granularity': granularity.toValue(),
        'Metrics': metrics,
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (groupBy != null) 'GroupBy': groupBy,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
      },
    );

    return GetCostAndUsageResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves cost and usage metrics with resources for your account. You can
  /// specify which cost and usage-related metric, such as
  /// <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the
  /// request to return. You can also filter and group your data by various
  /// dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific
  /// time range. For a complete list of valid dimensions, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a>
  /// operation. Management account in an organization in Organizations have
  /// access to all member accounts.
  ///
  /// Hourly granularity is only available for EC2-Instances (Elastic Compute
  /// Cloud) resource-level data. All other resource-level data is available at
  /// daily granularity.
  /// <note>
  /// This is an opt-in only feature. You can enable this feature from the Cost
  /// Explorer Settings page. For information about how to access the Settings
  /// page, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html">Controlling
  /// Access for Cost Explorer</a> in the <i>Billing and Cost Management User
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [DataUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [filter] :
  /// Filters Amazon Web Services costs by different dimensions. For example,
  /// you can specify <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and
  /// get the costs that are associated with that account's usage of that
  /// service. You can nest <code>Expression</code> objects to define any
  /// combination of dimension filters. For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>.
  ///
  /// The <code>GetCostAndUsageWithResources</code> operation requires that you
  /// either group by or filter by a <code>ResourceId</code>. It requires the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// <code>"SERVICE = Amazon Elastic Compute Cloud - Compute"</code> in the
  /// filter.
  ///
  /// Valid values for <code>MatchOptions</code> for <code>Dimensions</code> are
  /// <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.
  ///
  /// Valid values for <code>MatchOptions</code> for <code>CostCategories</code>
  /// and <code>Tags</code> are <code>EQUALS</code>, <code>ABSENT</code>, and
  /// <code>CASE_SENSITIVE</code>. Default values are <code>EQUALS</code> and
  /// <code>CASE_SENSITIVE</code>.
  ///
  /// Parameter [granularity] :
  /// Sets the Amazon Web Services cost granularity to <code>MONTHLY</code>,
  /// <code>DAILY</code>, or <code>HOURLY</code>. If <code>Granularity</code>
  /// isn't set, the response object doesn't include the
  /// <code>Granularity</code>, <code>MONTHLY</code>, <code>DAILY</code>, or
  /// <code>HOURLY</code>.
  ///
  /// Parameter [timePeriod] :
  /// Sets the start and end dates for retrieving Amazon Web Services costs. The
  /// range must be within the last 14 days (the start date cannot be earlier
  /// than 14 days ago). The start date is inclusive, but the end date is
  /// exclusive. For example, if <code>start</code> is <code>2017-01-01</code>
  /// and <code>end</code> is <code>2017-05-01</code>, then the cost and usage
  /// data is retrieved from <code>2017-01-01</code> up to and including
  /// <code>2017-04-30</code> but not including <code>2017-05-01</code>.
  ///
  /// Parameter [groupBy] :
  /// You can group Amazon Web Services costs using up to two different groups:
  /// <code>DIMENSION</code>, <code>TAG</code>, <code>COST_CATEGORY</code>.
  ///
  /// Parameter [metrics] :
  /// Which metrics are returned in the query. For more information about
  /// blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>,
  /// <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>,
  /// <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and
  /// <code>UsageQuantity</code>.
  /// <note>
  /// If you return the <code>UsageQuantity</code> metric, the service
  /// aggregates all usage numbers without taking the units into account. For
  /// example, if you aggregate <code>usageQuantity</code> across all of Amazon
  /// EC2, the results aren't meaningful because Amazon EC2 compute hours and
  /// data transfer are measured in different units (for example, hour or GB).
  /// To get more meaningful <code>UsageQuantity</code> metrics, filter by
  /// <code>UsageType</code> or <code>UsageTypeGroups</code>.
  /// </note>
  /// <code>Metrics</code> is required for
  /// <code>GetCostAndUsageWithResources</code> requests.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetCostAndUsageWithResourcesResponse> getCostAndUsageWithResources({
    required Expression filter,
    required Granularity granularity,
    required DateInterval timePeriod,
    List<GroupDefinition>? groupBy,
    List<String>? metrics,
    String? nextPageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostAndUsageWithResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filter': filter,
        'Granularity': granularity.toValue(),
        'TimePeriod': timePeriod,
        if (groupBy != null) 'GroupBy': groupBy,
        if (metrics != null) 'Metrics': metrics,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
      },
    );

    return GetCostAndUsageWithResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of Cost Category names and values incurred cost.
  /// <note>
  /// If some Cost Category names and values are not associated with any cost,
  /// they will not be returned by this API.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [maxResults] :
  /// This field is only used when the <code>SortBy</code> value is provided in
  /// the request.
  ///
  /// The maximum number of objects that are returned for this request. If
  /// <code>MaxResults</code> isn't specified with the <code>SortBy</code>
  /// value, the request returns 1000 results as the default value for this
  /// parameter.
  ///
  /// For <code>GetCostCategories</code>, MaxResults has an upper quota of 1000.
  ///
  /// Parameter [nextPageToken] :
  /// If the number of objects that are still available for retrieval exceeds
  /// the quota, Amazon Web Services returns a NextPageToken value in the
  /// response. To retrieve the next batch of objects, provide the NextPageToken
  /// from the previous call in your next request.
  ///
  /// Parameter [searchString] :
  /// The value that you want to search the filter values for.
  ///
  /// If you don't specify a <code>CostCategoryName</code>,
  /// <code>SearchString</code> is used to filter Cost Category names that match
  /// the <code>SearchString</code> pattern. If you specify a
  /// <code>CostCategoryName</code>, <code>SearchString</code> is used to filter
  /// Cost Category values that match the <code>SearchString</code> pattern.
  ///
  /// Parameter [sortBy] :
  /// The value that you sort the data by.
  ///
  /// The key represents the cost and usage metrics. The following values are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// <code>BlendedCost</code>
  /// </li>
  /// <li>
  /// <code>UnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>AmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetAmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetUnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>UsageQuantity</code>
  /// </li>
  /// <li>
  /// <code>NormalizedUsageAmount</code>
  /// </li>
  /// </ul>
  /// The supported key values for the <code>SortOrder</code> value are
  /// <code>ASCENDING</code> and <code>DESCENDING</code>.
  ///
  /// When you use the <code>SortBy</code> value, the <code>NextPageToken</code>
  /// and <code>SearchString</code> key values aren't supported.
  Future<GetCostCategoriesResponse> getCostCategories({
    required DateInterval timePeriod,
    String? costCategoryName,
    Expression? filter,
    int? maxResults,
    String? nextPageToken,
    String? searchString,
    List<SortDefinition>? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostCategories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (costCategoryName != null) 'CostCategoryName': costCategoryName,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (searchString != null) 'SearchString': searchString,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetCostCategoriesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will spend over the forecast time period that you select, based on your
  /// past costs.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [granularity] :
  /// How granular you want the forecast to be. You can get 3 months of
  /// <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code>
  /// forecasts.
  ///
  /// The <code>GetCostForecast</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [metric] :
  /// Which metric Cost Explorer uses to create your forecast. For more
  /// information about blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values for a <code>GetCostForecast</code> call are the following:
  ///
  /// <ul>
  /// <li>
  /// AMORTIZED_COST
  /// </li>
  /// <li>
  /// BLENDED_COST
  /// </li>
  /// <li>
  /// NET_AMORTIZED_COST
  /// </li>
  /// <li>
  /// NET_UNBLENDED_COST
  /// </li>
  /// <li>
  /// UNBLENDED_COST
  /// </li>
  /// </ul>
  ///
  /// Parameter [timePeriod] :
  /// The period of time that you want the forecast to cover. The start date
  /// must be equal to or no later than the current date to avoid a validation
  /// error.
  ///
  /// Parameter [filter] :
  /// The filters that you want to use to filter your forecast. The
  /// <code>GetCostForecast</code> API supports filtering by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>AZ</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>LINKED_ACCOUNT_NAME</code>
  /// </li>
  /// <li>
  /// <code>OPERATION</code>
  /// </li>
  /// <li>
  /// <code>PURCHASE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>USAGE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>USAGE_TYPE_GROUP</code>
  /// </li>
  /// <li>
  /// <code>RECORD_TYPE</code>
  /// </li>
  /// <li>
  /// <code>OPERATING_SYSTEM</code>
  /// </li>
  /// <li>
  /// <code>TENANCY</code>
  /// </li>
  /// <li>
  /// <code>SCOPE</code>
  /// </li>
  /// <li>
  /// <code>PLATFORM</code>
  /// </li>
  /// <li>
  /// <code>SUBSCRIPTION_ID</code>
  /// </li>
  /// <li>
  /// <code>LEGAL_ENTITY_NAME</code>
  /// </li>
  /// <li>
  /// <code>DEPLOYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>DATABASE_ENGINE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// <li>
  /// <code>BILLING_ENTITY</code>
  /// </li>
  /// <li>
  /// <code>RESERVATION_ID</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [predictionIntervalLevel] :
  /// Cost Explorer always returns the mean forecast as a single point. You can
  /// request a prediction interval around the mean by specifying a confidence
  /// level. The higher the confidence level, the more confident Cost Explorer
  /// is about the actual value falling in the prediction interval. Higher
  /// confidence levels result in wider prediction intervals.
  Future<GetCostForecastResponse> getCostForecast({
    required Granularity granularity,
    required Metric metric,
    required DateInterval timePeriod,
    Expression? filter,
    int? predictionIntervalLevel,
  }) async {
    _s.validateNumRange(
      'predictionIntervalLevel',
      predictionIntervalLevel,
      51,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Granularity': granularity.toValue(),
        'Metric': metric.toValue(),
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (predictionIntervalLevel != null)
          'PredictionIntervalLevel': predictionIntervalLevel,
      },
    );

    return GetCostForecastResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all available filter values for a specified filter over a period
  /// of time. You can search the dimension values for an arbitrary string.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [dimension] :
  /// The name of the dimension. Each <code>Dimension</code> is available for a
  /// different <code>Context</code>. For more information, see
  /// <code>Context</code>. <code>LINK_ACCOUNT_NAME</code> and
  /// <code>SERVICE_CODE</code> can only be used in <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/AAPI_CostCategoryRule.html">CostCategoryRule</a>.
  ///
  /// Parameter [timePeriod] :
  /// The start date and end date for retrieving the dimension values. The start
  /// date is inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [context] :
  /// The context for the call to <code>GetDimensionValues</code>. This can be
  /// <code>RESERVATIONS</code> or <code>COST_AND_USAGE</code>. The default
  /// value is <code>COST_AND_USAGE</code>. If the context is set to
  /// <code>RESERVATIONS</code>, the resulting dimension values can be used in
  /// the <code>GetReservationUtilization</code> operation. If the context is
  /// set to <code>COST_AND_USAGE</code>, the resulting dimension values can be
  /// used in the <code>GetCostAndUsage</code> operation.
  ///
  /// If you set the context to <code>COST_AND_USAGE</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// BILLING_ENTITY - The Amazon Web Services seller that your account is with.
  /// Possible values are the following:
  ///
  /// - Amazon Web Services(Amazon Web Services): The entity that sells Amazon
  /// Web Services.
  ///
  /// - AISPL (Amazon Internet Services Pvt. Ltd.): The local Indian entity
  /// that's an acting reseller for Amazon Web Services in India.
  ///
  /// - Amazon Web Services Marketplace: The entity that supports the sale of
  /// solutions that are built on Amazon Web Services by third-party software
  /// providers.
  /// </li>
  /// <li>
  /// CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are
  /// Windows or Linux.
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are <code>SingleAZ</code> and
  /// <code>MultiAZ</code>.
  /// </li>
  /// <li>
  /// DATABASE_ENGINE - The Amazon Relational Database Service database.
  /// Examples are Aurora or MySQL.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE_FAMILY - A family of instance types optimized to fit
  /// different use cases. Examples are <code>Compute Optimized</code> (for
  /// example, <code>C4</code>, <code>C5</code>, <code>C6g</code>, and
  /// <code>C7g</code>), <code>Memory Optimization</code> (for example,
  /// <code>R4</code>, <code>R5n</code>, <code>R5b</code>, and
  /// <code>R6g</code>).
  /// </li>
  /// <li>
  /// INVOICING_ENTITY - The name of the entity that issues the Amazon Web
  /// Services invoice.
  /// </li>
  /// <li>
  /// LEGAL_ENTITY_NAME - The name of the organization that sells you Amazon Web
  /// Services services, such as Amazon Web Services.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the Amazon Web
  /// Services ID of the member account.
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// OPERATION - The action performed. Examples include
  /// <code>RunInstance</code> and <code>CreateBucket</code>.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// PURCHASE_TYPE - The reservation type of the purchase that this usage is
  /// related to. Examples include On-Demand Instances and Standard Reserved
  /// Instances.
  /// </li>
  /// <li>
  /// RESERVATION_ID - The unique identifier for an Amazon Web Services
  /// Reservation Instance.
  /// </li>
  /// <li>
  /// SAVINGS_PLAN_ARN - The unique identifier for your Savings Plans.
  /// </li>
  /// <li>
  /// SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute).
  /// </li>
  /// <li>
  /// SERVICE - The Amazon Web Services service such as Amazon DynamoDB.
  /// </li>
  /// <li>
  /// TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  /// </li>
  /// <li>
  /// USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The
  /// response for the <code>GetDimensionValues</code> operation includes a unit
  /// attribute. Examples include GB and Hrs.
  /// </li>
  /// <li>
  /// USAGE_TYPE_GROUP - The grouping of common usage types. An example is
  /// Amazon EC2: CloudWatch – Alarms. The response for this operation includes
  /// a unit attribute.
  /// </li>
  /// <li>
  /// REGION - The Amazon Web Services Region.
  /// </li>
  /// <li>
  /// RECORD_TYPE - The different types of charges such as Reserved Instance
  /// (RI) fees, usage costs, tax refunds, and credits.
  /// </li>
  /// <li>
  /// RESOURCE_ID - The unique identifier of the resource. ResourceId is an
  /// opt-in feature only available for last 14 days for EC2-Compute Service.
  /// </li>
  /// </ul>
  /// If you set the context to <code>RESERVATIONS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are
  /// Windows or Linux.
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are <code>SingleAZ</code> and
  /// <code>MultiAZ</code>.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the Amazon Web
  /// Services ID of the member account.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// REGION - The Amazon Web Services Region.
  /// </li>
  /// <li>
  /// SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values
  /// are regional or a single Availability Zone.
  /// </li>
  /// <li>
  /// TAG (Coverage only) - The tags that are associated with a Reserved
  /// Instance (RI).
  /// </li>
  /// <li>
  /// TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  /// </li>
  /// </ul>
  /// If you set the context to <code>SAVINGS_PLANS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)
  /// </li>
  /// <li>
  /// PAYMENT_OPTION - The payment option for the given Savings Plans (for
  /// example, All Upfront)
  /// </li>
  /// <li>
  /// REGION - The Amazon Web Services Region.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE_FAMILY - The family of instances (For example,
  /// <code>m5</code>)
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the Amazon Web
  /// Services ID of the member account.
  /// </li>
  /// <li>
  /// SAVINGS_PLAN_ARN - The unique identifier for your Savings Plans.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// This field is only used when SortBy is provided in the request. The
  /// maximum number of objects that are returned for this request. If
  /// MaxResults isn't specified with SortBy, the request returns 1000 results
  /// as the default value for this parameter.
  ///
  /// For <code>GetDimensionValues</code>, MaxResults has an upper limit of
  /// 1000.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [searchString] :
  /// The value that you want to search the filter values for.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The key represents cost and usage metrics. The following values are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// <code>BlendedCost</code>
  /// </li>
  /// <li>
  /// <code>UnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>AmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetAmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetUnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>UsageQuantity</code>
  /// </li>
  /// <li>
  /// <code>NormalizedUsageAmount</code>
  /// </li>
  /// </ul>
  /// The supported values for the <code>SortOrder</code> key are
  /// <code>ASCENDING</code> or <code>DESCENDING</code>.
  ///
  /// When you specify a <code>SortBy</code> paramater, the context must be
  /// <code>COST_AND_USAGE</code>. Further, when using <code>SortBy</code>,
  /// <code>NextPageToken</code> and <code>SearchString</code> aren't supported.
  Future<GetDimensionValuesResponse> getDimensionValues({
    required Dimension dimension,
    required DateInterval timePeriod,
    Context? context,
    Expression? filter,
    int? maxResults,
    String? nextPageToken,
    String? searchString,
    List<SortDefinition>? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetDimensionValues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Dimension': dimension.toValue(),
        'TimePeriod': timePeriod,
        if (context != null) 'Context': context.toValue(),
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (searchString != null) 'SearchString': searchString,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetDimensionValuesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the reservation coverage for your account, which you can use to
  /// see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache,
  /// Amazon Relational Database Service, or Amazon Redshift usage is covered by
  /// a reservation. An organization's management account can see the coverage
  /// of the associated member accounts. This supports dimensions, Cost
  /// Categories, and nested expressions. For any time period, you can filter
  /// data about reservation usage by the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// TAG
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// To determine valid values for a dimension, use the
  /// <code>GetDimensionValues</code> operation.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates of the period that you want to retrieve data about
  /// reservation coverage for. You can retrieve data for a maximum of 13
  /// months: the last 12 months and the current month. The start date is
  /// inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters utilization data by dimensions. You can filter by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// TAG
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// <code>GetReservationCoverage</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension. You can nest only one level deep. If there are
  /// multiple values for a dimension, they are OR'd together.
  ///
  /// If you don't provide a <code>SERVICE</code> filter, Cost Explorer defaults
  /// to EC2.
  ///
  /// Cost category is also supported.
  ///
  /// Parameter [granularity] :
  /// The granularity of the Amazon Web Services cost data for the reservation.
  /// Valid values are <code>MONTHLY</code> and <code>DAILY</code>.
  ///
  /// If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If
  /// <code>Granularity</code> isn't set, the response object doesn't include
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>.
  ///
  /// The <code>GetReservationCoverage</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// You can group the data by the following attributes:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// INVOICING_ENTITY
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you returned for this request. If more
  /// objects are available, in the response, Amazon Web Services provides a
  /// NextPageToken value that you can use in a subsequent call to get the next
  /// batch of objects.
  ///
  /// Parameter [metrics] :
  /// The measurement that you want your reservation coverage reported in.
  ///
  /// Valid values are <code>Hour</code>, <code>Unit</code>, and
  /// <code>Cost</code>. You can use multiple values in a request.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [sortBy] :
  /// The value by which you want to sort the data.
  ///
  /// The following values are supported for <code>Key</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>OnDemandCost</code>
  /// </li>
  /// <li>
  /// <code>CoverageHoursPercentage</code>
  /// </li>
  /// <li>
  /// <code>OnDemandHours</code>
  /// </li>
  /// <li>
  /// <code>ReservedHours</code>
  /// </li>
  /// <li>
  /// <code>TotalRunningHours</code>
  /// </li>
  /// <li>
  /// <code>CoverageNormalizedUnitsPercentage</code>
  /// </li>
  /// <li>
  /// <code>OnDemandNormalizedUnits</code>
  /// </li>
  /// <li>
  /// <code>ReservedNormalizedUnits</code>
  /// </li>
  /// <li>
  /// <code>TotalRunningNormalizedUnits</code>
  /// </li>
  /// <li>
  /// <code>Time</code>
  /// </li>
  /// </ul>
  /// Supported values for <code>SortOrder</code> are <code>ASCENDING</code> or
  /// <code>DESCENDING</code>.
  Future<GetReservationCoverageResponse> getReservationCoverage({
    required DateInterval timePeriod,
    Expression? filter,
    Granularity? granularity,
    List<GroupDefinition>? groupBy,
    int? maxResults,
    List<String>? metrics,
    String? nextPageToken,
    SortDefinition? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetReservationCoverage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (granularity != null) 'Granularity': granularity.toValue(),
        if (groupBy != null) 'GroupBy': groupBy,
        if (maxResults != null) 'MaxResults': maxResults,
        if (metrics != null) 'Metrics': metrics,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetReservationCoverageResponse.fromJson(jsonResponse.body);
  }

  /// Gets recommendations for reservation purchases. These recommendations
  /// might help you to reduce your costs. Reservations provide a discounted
  /// hourly rate (up to 75%) compared to On-Demand pricing.
  ///
  /// Amazon Web Services generates your recommendations by identifying your
  /// On-Demand usage during a specific time period and collecting your usage
  /// into categories that are eligible for a reservation. After Amazon Web
  /// Services has these categories, it simulates every combination of
  /// reservations in each category of usage to identify the best number of each
  /// type of Reserved Instance (RI) to purchase to maximize your estimated
  /// savings.
  ///
  /// For example, Amazon Web Services automatically aggregates your Amazon EC2
  /// Linux, shared tenancy, and c4 family usage in the US West (Oregon) Region
  /// and recommends that you buy size-flexible regional reservations to apply
  /// to the c4 family usage. Amazon Web Services recommends the smallest size
  /// instance in an instance family. This makes it easier to purchase a
  /// size-flexible Reserved Instance (RI). Amazon Web Services also shows the
  /// equal number of normalized units. This way, you can purchase any instance
  /// size that you want. For this example, your RI recommendation is for
  /// <code>c4.large</code> because that is the smallest size instance in the c4
  /// instance family.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [service] :
  /// The specific service that you want recommendations for.
  ///
  /// Parameter [accountId] :
  /// The account ID that's associated with the recommendation.
  ///
  /// Parameter [accountScope] :
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the management account and
  /// member accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual member
  /// accounts only.
  ///
  /// Parameter [lookbackPeriodInDays] :
  /// The number of previous days that you want Amazon Web Services to consider
  /// when it calculates your recommendations.
  ///
  /// Parameter [nextPageToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  ///
  /// Parameter [paymentOption] :
  /// The reservation purchase option that you want recommendations for.
  ///
  /// Parameter [serviceSpecification] :
  /// The hardware specifications for the service instances that you want
  /// recommendations for, such as standard or convertible Amazon EC2 instances.
  ///
  /// Parameter [termInYears] :
  /// The reservation term that you want recommendations for.
  Future<GetReservationPurchaseRecommendationResponse>
      getReservationPurchaseRecommendation({
    required String service,
    String? accountId,
    AccountScope? accountScope,
    Expression? filter,
    LookbackPeriodInDays? lookbackPeriodInDays,
    String? nextPageToken,
    int? pageSize,
    PaymentOption? paymentOption,
    ServiceSpecification? serviceSpecification,
    TermInYears? termInYears,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetReservationPurchaseRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Service': service,
        if (accountId != null) 'AccountId': accountId,
        if (accountScope != null) 'AccountScope': accountScope.toValue(),
        if (filter != null) 'Filter': filter,
        if (lookbackPeriodInDays != null)
          'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (pageSize != null) 'PageSize': pageSize,
        if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
        if (serviceSpecification != null)
          'ServiceSpecification': serviceSpecification,
        if (termInYears != null) 'TermInYears': termInYears.toValue(),
      },
    );

    return GetReservationPurchaseRecommendationResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the reservation utilization for your account. Management account
  /// in an organization have access to member accounts. You can filter data by
  /// dimensions in a time period. You can use <code>GetDimensionValues</code>
  /// to determine the possible dimension values. Currently, you can group only
  /// by <code>SUBSCRIPTION_ID</code>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// Sets the start and end dates for retrieving Reserved Instance (RI)
  /// utilization. The start date is inclusive, but the end date is exclusive.
  /// For example, if <code>start</code> is <code>2017-01-01</code> and
  /// <code>end</code> is <code>2017-05-01</code>, then the cost and usage data
  /// is retrieved from <code>2017-01-01</code> up to and including
  /// <code>2017-04-30</code> but not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters utilization data by dimensions. You can filter by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// SCOPE
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// <code>GetReservationUtilization</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension, and nesting is supported up to only one level deep.
  /// If there are multiple values for a dimension, they are OR'd together.
  ///
  /// Parameter [granularity] :
  /// If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If
  /// <code>Granularity</code> isn't set, the response object doesn't include
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>. If both <code>GroupBy</code> and
  /// <code>Granularity</code> aren't set,
  /// <code>GetReservationUtilization</code> defaults to <code>DAILY</code>.
  ///
  /// The <code>GetReservationUtilization</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// Groups only by <code>SUBSCRIPTION_ID</code>. Metadata is included.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you returned for this request. If more
  /// objects are available, in the response, Amazon Web Services provides a
  /// NextPageToken value that you can use in a subsequent call to get the next
  /// batch of objects.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The following values are supported for <code>Key</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>UtilizationPercentage</code>
  /// </li>
  /// <li>
  /// <code>UtilizationPercentageInUnits</code>
  /// </li>
  /// <li>
  /// <code>PurchasedHours</code>
  /// </li>
  /// <li>
  /// <code>PurchasedUnits</code>
  /// </li>
  /// <li>
  /// <code>TotalActualHours</code>
  /// </li>
  /// <li>
  /// <code>TotalActualUnits</code>
  /// </li>
  /// <li>
  /// <code>UnusedHours</code>
  /// </li>
  /// <li>
  /// <code>UnusedUnits</code>
  /// </li>
  /// <li>
  /// <code>OnDemandCostOfRIHoursUsed</code>
  /// </li>
  /// <li>
  /// <code>NetRISavings</code>
  /// </li>
  /// <li>
  /// <code>TotalPotentialRISavings</code>
  /// </li>
  /// <li>
  /// <code>AmortizedUpfrontFee</code>
  /// </li>
  /// <li>
  /// <code>AmortizedRecurringFee</code>
  /// </li>
  /// <li>
  /// <code>TotalAmortizedFee</code>
  /// </li>
  /// <li>
  /// <code>RICostForUnusedHours</code>
  /// </li>
  /// <li>
  /// <code>RealizedSavings</code>
  /// </li>
  /// <li>
  /// <code>UnrealizedSavings</code>
  /// </li>
  /// </ul>
  /// The supported values for <code>SortOrder</code> are <code>ASCENDING</code>
  /// and <code>DESCENDING</code>.
  Future<GetReservationUtilizationResponse> getReservationUtilization({
    required DateInterval timePeriod,
    Expression? filter,
    Granularity? granularity,
    List<GroupDefinition>? groupBy,
    int? maxResults,
    String? nextPageToken,
    SortDefinition? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetReservationUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (granularity != null) 'Granularity': granularity.toValue(),
        if (groupBy != null) 'GroupBy': groupBy,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetReservationUtilizationResponse.fromJson(jsonResponse.body);
  }

  /// Creates recommendations that help you save cost by identifying idle and
  /// underutilized Amazon EC2 instances.
  ///
  /// Recommendations are generated to either downsize or terminate instances,
  /// along with providing savings detail and metrics. For more information
  /// about calculation and function, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html">Optimizing
  /// Your Cost with Rightsizing Recommendations</a> in the <i>Billing and Cost
  /// Management User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [service] :
  /// The specific service that you want recommendations for. The only valid
  /// value for <code>GetRightsizingRecommendation</code> is
  /// "<code>AmazonEC2</code>".
  ///
  /// Parameter [configuration] :
  /// You can use Configuration to customize recommendations across two
  /// attributes. You can choose to view recommendations for instances within
  /// the same instance families or across different instance families. You can
  /// also choose to view your estimated savings that are associated with
  /// recommendations with consideration of existing Savings Plans or RI
  /// benefits, or neither.
  ///
  /// Parameter [nextPageToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  Future<GetRightsizingRecommendationResponse> getRightsizingRecommendation({
    required String service,
    RightsizingRecommendationConfiguration? configuration,
    Expression? filter,
    String? nextPageToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetRightsizingRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Service': service,
        if (configuration != null) 'Configuration': configuration,
        if (filter != null) 'Filter': filter,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return GetRightsizingRecommendationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for a Savings Plan recommendation. These details
  /// include the hourly data-points that construct the cost, coverage, and
  /// utilization charts.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [recommendationDetailId] :
  /// The ID that is associated with the Savings Plan recommendation.
  Future<GetSavingsPlanPurchaseRecommendationDetailsResponse>
      getSavingsPlanPurchaseRecommendationDetails({
    required String recommendationDetailId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetSavingsPlanPurchaseRecommendationDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RecommendationDetailId': recommendationDetailId,
      },
    );

    return GetSavingsPlanPurchaseRecommendationDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the Savings Plans covered for your account. This enables you to
  /// see how much of your cost is covered by a Savings Plan. An organization’s
  /// management account can see the coverage of the associated member accounts.
  /// This supports dimensions, Cost Categories, and nested expressions. For any
  /// time period, you can filter data for Savings Plans usage with the
  /// following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_FAMILY</code>
  /// </li>
  /// </ul>
  /// To determine valid values for a dimension, use the
  /// <code>GetDimensionValues</code> operation.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans coverage data by dimensions. You can filter data for
  /// Savings Plans usage with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansCoverage</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension. If there are multiple values for a dimension, they
  /// are OR'd together.
  ///
  /// Cost category is also supported.
  ///
  /// Parameter [granularity] :
  /// The granularity of the Amazon Web Services cost data for your Savings
  /// Plans. <code>Granularity</code> can't be set if <code>GroupBy</code> is
  /// set.
  ///
  /// The <code>GetSavingsPlansCoverage</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// You can group the data using the attributes <code>INSTANCE_FAMILY</code>,
  /// <code>REGION</code>, or <code>SERVICE</code>.
  ///
  /// Parameter [maxResults] :
  /// The number of items to be returned in a response. The default is
  /// <code>20</code>, with a minimum value of <code>1</code>.
  ///
  /// Parameter [metrics] :
  /// The measurement that you want your Savings Plans coverage reported in. The
  /// only valid value is <code>SpendCoveredBySavingsPlans</code>.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The following values are supported for <code>Key</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>SpendCoveredBySavingsPlan</code>
  /// </li>
  /// <li>
  /// <code>OnDemandCost</code>
  /// </li>
  /// <li>
  /// <code>CoveragePercentage</code>
  /// </li>
  /// <li>
  /// <code>TotalCost</code>
  /// </li>
  /// <li>
  /// <code>InstanceFamily</code>
  /// </li>
  /// <li>
  /// <code>Region</code>
  /// </li>
  /// <li>
  /// <code>Service</code>
  /// </li>
  /// </ul>
  /// The supported values for <code>SortOrder</code> are <code>ASCENDING</code>
  /// and <code>DESCENDING</code>.
  Future<GetSavingsPlansCoverageResponse> getSavingsPlansCoverage({
    required DateInterval timePeriod,
    Expression? filter,
    Granularity? granularity,
    List<GroupDefinition>? groupBy,
    int? maxResults,
    List<String>? metrics,
    String? nextToken,
    SortDefinition? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetSavingsPlansCoverage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (granularity != null) 'Granularity': granularity.toValue(),
        if (groupBy != null) 'GroupBy': groupBy,
        if (maxResults != null) 'MaxResults': maxResults,
        if (metrics != null) 'Metrics': metrics,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetSavingsPlansCoverageResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the Savings Plans recommendations for your account. First use
  /// <code>StartSavingsPlansPurchaseRecommendationGeneration</code> to generate
  /// a new set of recommendations, and then use
  /// <code>GetSavingsPlansPurchaseRecommendation</code> to retrieve them.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [lookbackPeriodInDays] :
  /// The lookback period that's used to generate the recommendation.
  ///
  /// Parameter [paymentOption] :
  /// The payment option that's used to generate these recommendations.
  ///
  /// Parameter [savingsPlansType] :
  /// The Savings Plans recommendation type that's requested.
  ///
  /// Parameter [termInYears] :
  /// The savings plan recommendation term that's used to generate these
  /// recommendations.
  ///
  /// Parameter [accountScope] :
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the management account and
  /// member accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual member
  /// accounts only.
  ///
  /// Parameter [filter] :
  /// You can filter your recommendations by Account ID with the
  /// <code>LINKED_ACCOUNT</code> dimension. To filter your recommendations by
  /// Account ID, specify <code>Key</code> as <code>LINKED_ACCOUNT</code> and
  /// <code>Value</code> as the comma-separated Acount ID(s) that you want to
  /// see Savings Plans purchase recommendations for.
  ///
  /// For GetSavingsPlansPurchaseRecommendation, the <code>Filter</code> doesn't
  /// include <code>CostCategories</code> or <code>Tags</code>. It only includes
  /// <code>Dimensions</code>. With <code>Dimensions</code>, <code>Key</code>
  /// must be <code>LINKED_ACCOUNT</code> and <code>Value</code> can be a single
  /// Account ID or multiple comma-separated Account IDs that you want to see
  /// Savings Plans Purchase Recommendations for. <code>AND</code> and
  /// <code>OR</code> operators are not supported.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  Future<GetSavingsPlansPurchaseRecommendationResponse>
      getSavingsPlansPurchaseRecommendation({
    required LookbackPeriodInDays lookbackPeriodInDays,
    required PaymentOption paymentOption,
    required SupportedSavingsPlansType savingsPlansType,
    required TermInYears termInYears,
    AccountScope? accountScope,
    Expression? filter,
    String? nextPageToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetSavingsPlansPurchaseRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
        'PaymentOption': paymentOption.toValue(),
        'SavingsPlansType': savingsPlansType.toValue(),
        'TermInYears': termInYears.toValue(),
        if (accountScope != null) 'AccountScope': accountScope.toValue(),
        if (filter != null) 'Filter': filter,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return GetSavingsPlansPurchaseRecommendationResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the Savings Plans utilization for your account across date
  /// ranges with daily or monthly granularity. Management account in an
  /// organization have access to member accounts. You can use
  /// <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine
  /// the possible dimension values.
  /// <note>
  /// You can't group by any dimension values for
  /// <code>GetSavingsPlansUtilization</code>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans utilization coverage data for active Savings Plans
  /// dimensions. You can filter data with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLANS_TYPE</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>PAYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansUtilization</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension.
  ///
  /// Parameter [granularity] :
  /// The granularity of the Amazon Web Services utillization data for your
  /// Savings Plans.
  ///
  /// The <code>GetSavingsPlansUtilization</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The following values are supported for <code>Key</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>UtilizationPercentage</code>
  /// </li>
  /// <li>
  /// <code>TotalCommitment</code>
  /// </li>
  /// <li>
  /// <code>UsedCommitment</code>
  /// </li>
  /// <li>
  /// <code>UnusedCommitment</code>
  /// </li>
  /// <li>
  /// <code>NetSavings</code>
  /// </li>
  /// </ul>
  /// The supported values for <code>SortOrder</code> are <code>ASCENDING</code>
  /// and <code>DESCENDING</code>.
  Future<GetSavingsPlansUtilizationResponse> getSavingsPlansUtilization({
    required DateInterval timePeriod,
    Expression? filter,
    Granularity? granularity,
    SortDefinition? sortBy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetSavingsPlansUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (granularity != null) 'Granularity': granularity.toValue(),
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetSavingsPlansUtilizationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves attribute data along with aggregate utilization and savings data
  /// for a given time period. This doesn't support granular or grouped data
  /// (daily/monthly) in response. You can't retrieve data by dates in a single
  /// response similar to <code>GetSavingsPlanUtilization</code>, but you have
  /// the option to make multiple calls to
  /// <code>GetSavingsPlanUtilizationDetails</code> by providing individual
  /// dates. You can use <code>GetDimensionValues</code> in
  /// <code>SAVINGS_PLANS</code> to determine the possible dimension values.
  /// <note>
  /// <code>GetSavingsPlanUtilizationDetails</code> internally groups data by
  /// <code>SavingsPlansArn</code>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [dataType] :
  /// The data type.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans utilization coverage data for active Savings Plans
  /// dimensions. You can filter data with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>PAYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansUtilizationDetails</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension.
  ///
  /// Parameter [maxResults] :
  /// The number of items to be returned in a response. The default is
  /// <code>20</code>, with a minimum value of <code>1</code>.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The following values are supported for <code>Key</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>UtilizationPercentage</code>
  /// </li>
  /// <li>
  /// <code>TotalCommitment</code>
  /// </li>
  /// <li>
  /// <code>UsedCommitment</code>
  /// </li>
  /// <li>
  /// <code>UnusedCommitment</code>
  /// </li>
  /// <li>
  /// <code>NetSavings</code>
  /// </li>
  /// <li>
  /// <code>AmortizedRecurringCommitment</code>
  /// </li>
  /// <li>
  /// <code>AmortizedUpfrontCommitment</code>
  /// </li>
  /// </ul>
  /// The supported values for <code>SortOrder</code> are <code>ASCENDING</code>
  /// and <code>DESCENDING</code>.
  Future<GetSavingsPlansUtilizationDetailsResponse>
      getSavingsPlansUtilizationDetails({
    required DateInterval timePeriod,
    List<SavingsPlansDataType>? dataType,
    Expression? filter,
    int? maxResults,
    String? nextToken,
    SortDefinition? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetSavingsPlansUtilizationDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (dataType != null)
          'DataType': dataType.map((e) => e.toValue()).toList(),
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy,
      },
    );

    return GetSavingsPlansUtilizationDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Queries for available tag keys and tag values for a specified period. You
  /// can search the tag values for an arbitrary string.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates for retrieving the dimension values. The start
  /// date is inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [maxResults] :
  /// This field is only used when SortBy is provided in the request. The
  /// maximum number of objects that are returned for this request. If
  /// MaxResults isn't specified with SortBy, the request returns 1000 results
  /// as the default value for this parameter.
  ///
  /// For <code>GetTags</code>, MaxResults has an upper quota of 1000.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [searchString] :
  /// The value that you want to search for.
  ///
  /// Parameter [sortBy] :
  /// The value that you want to sort the data by.
  ///
  /// The key represents cost and usage metrics. The following values are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// <code>BlendedCost</code>
  /// </li>
  /// <li>
  /// <code>UnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>AmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetAmortizedCost</code>
  /// </li>
  /// <li>
  /// <code>NetUnblendedCost</code>
  /// </li>
  /// <li>
  /// <code>UsageQuantity</code>
  /// </li>
  /// <li>
  /// <code>NormalizedUsageAmount</code>
  /// </li>
  /// </ul>
  /// The supported values for <code>SortOrder</code> are <code>ASCENDING</code>
  /// and <code>DESCENDING</code>.
  ///
  /// When you use <code>SortBy</code>, <code>NextPageToken</code> and
  /// <code>SearchString</code> aren't supported.
  ///
  /// Parameter [tagKey] :
  /// The key of the tag that you want to return values for.
  Future<GetTagsResponse> getTags({
    required DateInterval timePeriod,
    Expression? filter,
    int? maxResults,
    String? nextPageToken,
    String? searchString,
    List<SortDefinition>? sortBy,
    String? tagKey,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (searchString != null) 'SearchString': searchString,
        if (sortBy != null) 'SortBy': sortBy,
        if (tagKey != null) 'TagKey': tagKey,
      },
    );

    return GetTagsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will use over the forecast time period that you select, based on your past
  /// usage.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [UnresolvableUsageUnitException].
  ///
  /// Parameter [granularity] :
  /// How granular you want the forecast to be. You can get 3 months of
  /// <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code>
  /// forecasts.
  ///
  /// The <code>GetUsageForecast</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [metric] :
  /// Which metric Cost Explorer uses to create your forecast.
  ///
  /// Valid values for a <code>GetUsageForecast</code> call are the following:
  ///
  /// <ul>
  /// <li>
  /// USAGE_QUANTITY
  /// </li>
  /// <li>
  /// NORMALIZED_USAGE_AMOUNT
  /// </li>
  /// </ul>
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates of the period that you want to retrieve usage
  /// forecast for. The start date is included in the period, but the end date
  /// isn't included in the period. For example, if <code>start</code> is
  /// <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>,
  /// then the cost and usage data is retrieved from <code>2017-01-01</code> up
  /// to and including <code>2017-04-30</code> but not including
  /// <code>2017-05-01</code>. The start date must be equal to or later than the
  /// current date to avoid a validation error.
  ///
  /// Parameter [filter] :
  /// The filters that you want to use to filter your forecast. The
  /// <code>GetUsageForecast</code> API supports filtering by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>AZ</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>LINKED_ACCOUNT_NAME</code>
  /// </li>
  /// <li>
  /// <code>OPERATION</code>
  /// </li>
  /// <li>
  /// <code>PURCHASE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>USAGE_TYPE</code>
  /// </li>
  /// <li>
  /// <code>USAGE_TYPE_GROUP</code>
  /// </li>
  /// <li>
  /// <code>RECORD_TYPE</code>
  /// </li>
  /// <li>
  /// <code>OPERATING_SYSTEM</code>
  /// </li>
  /// <li>
  /// <code>TENANCY</code>
  /// </li>
  /// <li>
  /// <code>SCOPE</code>
  /// </li>
  /// <li>
  /// <code>PLATFORM</code>
  /// </li>
  /// <li>
  /// <code>SUBSCRIPTION_ID</code>
  /// </li>
  /// <li>
  /// <code>LEGAL_ENTITY_NAME</code>
  /// </li>
  /// <li>
  /// <code>DEPLOYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>DATABASE_ENGINE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// <li>
  /// <code>BILLING_ENTITY</code>
  /// </li>
  /// <li>
  /// <code>RESERVATION_ID</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [predictionIntervalLevel] :
  /// Amazon Web Services Cost Explorer always returns the mean forecast as a
  /// single point. You can request a prediction interval around the mean by
  /// specifying a confidence level. The higher the confidence level, the more
  /// confident Cost Explorer is about the actual value falling in the
  /// prediction interval. Higher confidence levels result in wider prediction
  /// intervals.
  Future<GetUsageForecastResponse> getUsageForecast({
    required Granularity granularity,
    required Metric metric,
    required DateInterval timePeriod,
    Expression? filter,
    int? predictionIntervalLevel,
  }) async {
    _s.validateNumRange(
      'predictionIntervalLevel',
      predictionIntervalLevel,
      51,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetUsageForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Granularity': granularity.toValue(),
        'Metric': metric.toValue(),
        'TimePeriod': timePeriod,
        if (filter != null) 'Filter': filter,
        if (predictionIntervalLevel != null)
          'PredictionIntervalLevel': predictionIntervalLevel,
      },
    );

    return GetUsageForecastResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of your historical cost allocation tag backfill requests.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for this request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<ListCostAllocationTagBackfillHistoryResponse>
      listCostAllocationTagBackfillHistory({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.ListCostAllocationTagBackfillHistory'
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

    return ListCostAllocationTagBackfillHistoryResponse.fromJson(
        jsonResponse.body);
  }

  /// Get a list of cost allocation tags. All inputs in the API are optional and
  /// serve as filters. By default, all cost allocation tags are returned.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for this request. By
  /// default, the request returns 100 results.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [status] :
  /// The status of cost allocation tag keys that are returned for this request.
  ///
  /// Parameter [tagKeys] :
  /// The list of cost allocation tag keys that are returned for this request.
  ///
  /// Parameter [type] :
  /// The type of <code>CostAllocationTag</code> object that are returned for
  /// this request. The <code>AWSGenerated</code> type tags are tags that Amazon
  /// Web Services defines and applies to support Amazon Web Services resources
  /// for cost allocation purposes. The <code>UserDefined</code> type tags are
  /// tags that you define, create, and apply to resources.
  Future<ListCostAllocationTagsResponse> listCostAllocationTags({
    int? maxResults,
    String? nextToken,
    CostAllocationTagStatus? status,
    List<String>? tagKeys,
    CostAllocationTagType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.ListCostAllocationTags'
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
        if (status != null) 'Status': status.toValue(),
        if (tagKeys != null) 'TagKeys': tagKeys,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return ListCostAllocationTagsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name, Amazon Resource Name (ARN), <code>NumberOfRules</code>
  /// and effective dates of all Cost Categories defined in the account. You
  /// have the option to use <code>EffectiveOn</code> to return a list of Cost
  /// Categories that were active on a specific date. If there is no
  /// <code>EffectiveOn</code> specified, you’ll see Cost Categories that are
  /// effective on the current date. If Cost Category is still effective,
  /// <code>EffectiveEnd</code> is omitted in the response.
  /// <code>ListCostCategoryDefinitions</code> supports pagination. The request
  /// can have a <code>MaxResults</code> range up to 100.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [effectiveOn] :
  /// The date when the Cost Category was effective.
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<ListCostCategoryDefinitionsResponse> listCostCategoryDefinitions({
    String? effectiveOn,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.ListCostCategoryDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (effectiveOn != null) 'EffectiveOn': effectiveOn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCostCategoryDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of your historical recommendation generations within the
  /// past 30 days.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [generationStatus] :
  /// The status of the recommendation generation.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  ///
  /// Parameter [recommendationIds] :
  /// The IDs for each specific recommendation.
  Future<ListSavingsPlansPurchaseRecommendationGenerationResponse>
      listSavingsPlansPurchaseRecommendationGeneration({
    GenerationStatus? generationStatus,
    String? nextPageToken,
    int? pageSize,
    List<String>? recommendationIds,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.ListSavingsPlansPurchaseRecommendationGeneration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (generationStatus != null)
          'GenerationStatus': generationStatus.toValue(),
        if (nextPageToken != null) 'NextPageToken': nextPageToken,
        if (pageSize != null) 'PageSize': pageSize,
        if (recommendationIds != null) 'RecommendationIds': recommendationIds,
      },
    );

    return ListSavingsPlansPurchaseRecommendationGenerationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of resource tags associated with the resource specified by
  /// the Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For a list of supported
  /// resources, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html">ResourceTag</a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.ListTagsForResource'
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

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the feedback property of a given cost anomaly.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [anomalyId] :
  /// A cost anomaly ID.
  ///
  /// Parameter [feedback] :
  /// Describes whether the cost anomaly was a planned activity or you
  /// considered it an anomaly.
  Future<ProvideAnomalyFeedbackResponse> provideAnomalyFeedback({
    required String anomalyId,
    required AnomalyFeedbackType feedback,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.ProvideAnomalyFeedback'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AnomalyId': anomalyId,
        'Feedback': feedback.toValue(),
      },
    );

    return ProvideAnomalyFeedbackResponse.fromJson(jsonResponse.body);
  }

  /// Request a cost allocation tag backfill. This will backfill the activation
  /// status (either <code>active</code> or <code>inactive</code>) for all tag
  /// keys from <code>para:BackfillFrom</code> up to the when this request is
  /// made.
  ///
  /// You can request a backfill once every 24 hours.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BackfillLimitExceededException].
  ///
  /// Parameter [backfillFrom] :
  /// The date you want the backfill to start from. The date can only be a first
  /// day of the month (a billing start date). Dates can't precede the previous
  /// twelve months, or in the future.
  Future<StartCostAllocationTagBackfillResponse>
      startCostAllocationTagBackfill({
    required String backfillFrom,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.StartCostAllocationTagBackfill'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackfillFrom': backfillFrom,
      },
    );

    return StartCostAllocationTagBackfillResponse.fromJson(jsonResponse.body);
  }

  /// Requests a Savings Plans recommendation generation. This enables you to
  /// calculate a fresh set of Savings Plans recommendations that takes your
  /// latest usage data and current Savings Plans inventory into account. You
  /// can refresh Savings Plans recommendations up to three times daily for a
  /// consolidated billing family.
  /// <note>
  /// <code>StartSavingsPlansPurchaseRecommendationGeneration</code> has no
  /// request syntax because no input parameters are needed to support this
  /// operation.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [GenerationExistsException].
  /// May throw [DataUnavailableException].
  Future<StartSavingsPlansPurchaseRecommendationGenerationResponse>
      startSavingsPlansPurchaseRecommendationGeneration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.StartSavingsPlansPurchaseRecommendationGeneration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return StartSavingsPlansPurchaseRecommendationGenerationResponse.fromJson(
        jsonResponse.body);
  }

  /// An API operation for adding one or more tags (key-value pairs) to a
  /// resource.
  ///
  /// You can use the <code>TagResource</code> operation with a resource that
  /// already has tags. If you specify a new tag key for the resource, this tag
  /// is appended to the list of tags associated with the resource. If you
  /// specify a tag key that is already associated with the resource, the new
  /// tag value you specify replaces the previous value for that tag.
  ///
  /// Although the maximum number of array members is 200, user-tag maximum is
  /// 50. The remaining are reserved for Amazon Web Services use.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For a list of supported
  /// resources, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html">ResourceTag</a>.
  ///
  /// Parameter [resourceTags] :
  /// A list of tag key-value pairs to be added to the resource.
  ///
  /// Each tag consists of a key and a value, and each key must be unique for
  /// the resource. The following restrictions apply to resource tags:
  ///
  /// <ul>
  /// <li>
  /// Although the maximum number of array members is 200, you can assign a
  /// maximum of 50 user-tags to one resource. The remaining are reserved for
  /// Amazon Web Services use
  /// </li>
  /// <li>
  /// The maximum length of a key is 128 characters
  /// </li>
  /// <li>
  /// The maximum length of a value is 256 characters
  /// </li>
  /// <li>
  /// Keys and values can only contain alphanumeric characters, spaces, and any
  /// of the following: <code>_.:/=+@-</code>
  /// </li>
  /// <li>
  /// Keys and values are case sensitive
  /// </li>
  /// <li>
  /// Keys and values are trimmed for any leading or trailing whitespaces
  /// </li>
  /// <li>
  /// Don’t use <code>aws:</code> as a prefix for your keys. This prefix is
  /// reserved for Amazon Web Services use
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTags': resourceTags,
      },
    );
  }

  /// Removes one or more tags from a resource. Specify only tag keys in your
  /// request. Don't specify the value.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For a list of supported
  /// resources, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html">ResourceTag</a>.
  ///
  /// Parameter [resourceTagKeys] :
  /// A list of tag keys associated with tags that need to be removed from the
  /// resource. If you specify a tag key that doesn't exist, it's ignored.
  /// Although the maximum number of array members is 200, user-tag maximum is
  /// 50. The remaining are reserved for Amazon Web Services use.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// Updates an existing cost anomaly monitor. The changes made are applied
  /// going forward, and doesn't change anomalies detected in the past.
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownMonitorException].
  ///
  /// Parameter [monitorArn] :
  /// Cost anomaly monitor Amazon Resource Names (ARNs).
  ///
  /// Parameter [monitorName] :
  /// The new name for the cost anomaly monitor.
  Future<UpdateAnomalyMonitorResponse> updateAnomalyMonitor({
    required String monitorArn,
    String? monitorName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UpdateAnomalyMonitor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitorArn': monitorArn,
        if (monitorName != null) 'MonitorName': monitorName,
      },
    );

    return UpdateAnomalyMonitorResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing cost anomaly subscription. Specify the fields that you
  /// want to update. Omitted fields are unchanged.
  /// <note>
  /// The JSON below describes the generic construct for each type. See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_UpdateAnomalySubscription.html#API_UpdateAnomalySubscription_RequestParameters">Request
  /// Parameters</a> for possible values as they apply to
  /// <code>AnomalySubscription</code>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [UnknownMonitorException].
  /// May throw [UnknownSubscriptionException].
  ///
  /// Parameter [subscriptionArn] :
  /// A cost anomaly subscription Amazon Resource Name (ARN).
  ///
  /// Parameter [frequency] :
  /// The update to the frequency value that subscribers receive notifications.
  ///
  /// Parameter [monitorArnList] :
  /// A list of cost anomaly monitor ARNs.
  ///
  /// Parameter [subscribers] :
  /// The update to the subscriber list.
  ///
  /// Parameter [subscriptionName] :
  /// The new name of the subscription.
  ///
  /// Parameter [threshold] :
  /// (deprecated)
  ///
  /// The update to the threshold value for receiving notifications.
  ///
  /// This field has been deprecated. To update a threshold, use
  /// ThresholdExpression. Continued use of Threshold will be treated as
  /// shorthand syntax for a ThresholdExpression.
  ///
  /// You can specify either Threshold or ThresholdExpression, but not both.
  ///
  /// Parameter [thresholdExpression] :
  /// The update to the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object used to specify the anomalies that you want to generate alerts for.
  /// This supports dimensions and nested expressions. The supported dimensions
  /// are <code>ANOMALY_TOTAL_IMPACT_ABSOLUTE</code> and
  /// <code>ANOMALY_TOTAL_IMPACT_PERCENTAGE</code>, corresponding to an
  /// anomaly’s TotalImpact and TotalImpactPercentage, respectively (see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html">Impact</a>
  /// for more details). The supported nested expression types are
  /// <code>AND</code> and <code>OR</code>. The match option
  /// <code>GREATER_THAN_OR_EQUAL</code> is required. Values must be numbers
  /// between 0 and 10,000,000,000 in string format.
  ///
  /// You can specify either Threshold or ThresholdExpression, but not both.
  ///
  /// The following are examples of valid ThresholdExpressions:
  ///
  /// <ul>
  /// <li>
  /// Absolute threshold: <code>{ "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL"
  /// ], "Values": [ "100" ] } }</code>
  /// </li>
  /// <li>
  /// Percentage threshold: <code>{ "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } }</code>
  /// </li>
  /// <li>
  /// <code>AND</code> two thresholds together: <code>{ "And": [ { "Dimensions":
  /// { "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } }, { "Dimensions": {
  /// "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] }</code>
  /// </li>
  /// <li>
  /// <code>OR</code> two thresholds together: <code>{ "Or": [ { "Dimensions": {
  /// "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } }, { "Dimensions": {
  /// "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] }</code>
  /// </li>
  /// </ul>
  Future<UpdateAnomalySubscriptionResponse> updateAnomalySubscription({
    required String subscriptionArn,
    AnomalySubscriptionFrequency? frequency,
    List<String>? monitorArnList,
    List<Subscriber>? subscribers,
    String? subscriptionName,
    double? threshold,
    Expression? thresholdExpression,
  }) async {
    _s.validateNumRange(
      'threshold',
      threshold,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UpdateAnomalySubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubscriptionArn': subscriptionArn,
        if (frequency != null) 'Frequency': frequency.toValue(),
        if (monitorArnList != null) 'MonitorArnList': monitorArnList,
        if (subscribers != null) 'Subscribers': subscribers,
        if (subscriptionName != null) 'SubscriptionName': subscriptionName,
        if (threshold != null) 'Threshold': threshold,
        if (thresholdExpression != null)
          'ThresholdExpression': thresholdExpression,
      },
    );

    return UpdateAnomalySubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Updates status for cost allocation tags in bulk, with maximum batch size
  /// of 20. If the tag status that's updated is the same as the existing tag
  /// status, the request doesn't fail. Instead, it doesn't have any effect on
  /// the tag status (for example, activating the active tag).
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costAllocationTagsStatus] :
  /// The list of <code>CostAllocationTagStatusEntry</code> objects that are
  /// used to update cost allocation tags status for this request.
  Future<UpdateCostAllocationTagsStatusResponse>
      updateCostAllocationTagsStatus({
    required List<CostAllocationTagStatusEntry> costAllocationTagsStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UpdateCostAllocationTagsStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostAllocationTagsStatus': costAllocationTagsStatus,
      },
    );

    return UpdateCostAllocationTagsStatusResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing Cost Category. Changes made to the Cost Category rules
  /// will be used to categorize the current month’s expenses and future
  /// expenses. This won’t change categorization for the previous months.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  ///
  /// Parameter [rules] :
  /// The <code>Expression</code> object used to categorize costs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule
  /// </a>.
  ///
  /// Parameter [effectiveStart] :
  /// The Cost Category's effective start date. It can only be a billing start
  /// date (first day of the month). If the date isn't provided, it's the first
  /// day of the current month. Dates can't be before the previous twelve
  /// months, or in the future.
  ///
  /// Parameter [splitChargeRules] :
  /// The split charge rules used to allocate your charges between your Cost
  /// Category values.
  Future<UpdateCostCategoryDefinitionResponse> updateCostCategoryDefinition({
    required String costCategoryArn,
    required CostCategoryRuleVersion ruleVersion,
    required List<CostCategoryRule> rules,
    String? defaultValue,
    String? effectiveStart,
    List<CostCategorySplitChargeRule>? splitChargeRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UpdateCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
        'RuleVersion': ruleVersion.toValue(),
        'Rules': rules,
        if (defaultValue != null) 'DefaultValue': defaultValue,
        if (effectiveStart != null) 'EffectiveStart': effectiveStart,
        if (splitChargeRules != null) 'SplitChargeRules': splitChargeRules,
      },
    );

    return UpdateCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }
}

enum AccountScope {
  payer,
  linked,
}

extension AccountScopeValueExtension on AccountScope {
  String toValue() {
    switch (this) {
      case AccountScope.payer:
        return 'PAYER';
      case AccountScope.linked:
        return 'LINKED';
    }
  }
}

extension AccountScopeFromString on String {
  AccountScope toAccountScope() {
    switch (this) {
      case 'PAYER':
        return AccountScope.payer;
      case 'LINKED':
        return AccountScope.linked;
    }
    throw Exception('$this is not known in enum AccountScope');
  }
}

/// An unusual cost pattern. This consists of the detailed metadata and the
/// current status of the anomaly object.
class Anomaly {
  /// The unique identifier for the anomaly.
  final String anomalyId;

  /// The latest and maximum score for the anomaly.
  final AnomalyScore anomalyScore;

  /// The dollar impact for the anomaly.
  final Impact impact;

  /// The Amazon Resource Name (ARN) for the cost monitor that generated this
  /// anomaly.
  final String monitorArn;

  /// The last day the anomaly is detected.
  final String? anomalyEndDate;

  /// The first day the anomaly is detected.
  final String? anomalyStartDate;

  /// The dimension for the anomaly (for example, an Amazon Web Service in a
  /// service monitor).
  final String? dimensionValue;

  /// The feedback value.
  final AnomalyFeedbackType? feedback;

  /// The list of identified root causes for the anomaly.
  final List<RootCause>? rootCauses;

  Anomaly({
    required this.anomalyId,
    required this.anomalyScore,
    required this.impact,
    required this.monitorArn,
    this.anomalyEndDate,
    this.anomalyStartDate,
    this.dimensionValue,
    this.feedback,
    this.rootCauses,
  });

  factory Anomaly.fromJson(Map<String, dynamic> json) {
    return Anomaly(
      anomalyId: json['AnomalyId'] as String,
      anomalyScore:
          AnomalyScore.fromJson(json['AnomalyScore'] as Map<String, dynamic>),
      impact: Impact.fromJson(json['Impact'] as Map<String, dynamic>),
      monitorArn: json['MonitorArn'] as String,
      anomalyEndDate: json['AnomalyEndDate'] as String?,
      anomalyStartDate: json['AnomalyStartDate'] as String?,
      dimensionValue: json['DimensionValue'] as String?,
      feedback: (json['Feedback'] as String?)?.toAnomalyFeedbackType(),
      rootCauses: (json['RootCauses'] as List?)
          ?.whereNotNull()
          .map((e) => RootCause.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyId = this.anomalyId;
    final anomalyScore = this.anomalyScore;
    final impact = this.impact;
    final monitorArn = this.monitorArn;
    final anomalyEndDate = this.anomalyEndDate;
    final anomalyStartDate = this.anomalyStartDate;
    final dimensionValue = this.dimensionValue;
    final feedback = this.feedback;
    final rootCauses = this.rootCauses;
    return {
      'AnomalyId': anomalyId,
      'AnomalyScore': anomalyScore,
      'Impact': impact,
      'MonitorArn': monitorArn,
      if (anomalyEndDate != null) 'AnomalyEndDate': anomalyEndDate,
      if (anomalyStartDate != null) 'AnomalyStartDate': anomalyStartDate,
      if (dimensionValue != null) 'DimensionValue': dimensionValue,
      if (feedback != null) 'Feedback': feedback.toValue(),
      if (rootCauses != null) 'RootCauses': rootCauses,
    };
  }
}

/// The time period for an anomaly.
class AnomalyDateInterval {
  /// The first date an anomaly was observed.
  final String startDate;

  /// The last date an anomaly was observed.
  final String? endDate;

  AnomalyDateInterval({
    required this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() {
    final startDate = this.startDate;
    final endDate = this.endDate;
    return {
      'StartDate': startDate,
      if (endDate != null) 'EndDate': endDate,
    };
  }
}

enum AnomalyFeedbackType {
  yes,
  no,
  plannedActivity,
}

extension AnomalyFeedbackTypeValueExtension on AnomalyFeedbackType {
  String toValue() {
    switch (this) {
      case AnomalyFeedbackType.yes:
        return 'YES';
      case AnomalyFeedbackType.no:
        return 'NO';
      case AnomalyFeedbackType.plannedActivity:
        return 'PLANNED_ACTIVITY';
    }
  }
}

extension AnomalyFeedbackTypeFromString on String {
  AnomalyFeedbackType toAnomalyFeedbackType() {
    switch (this) {
      case 'YES':
        return AnomalyFeedbackType.yes;
      case 'NO':
        return AnomalyFeedbackType.no;
      case 'PLANNED_ACTIVITY':
        return AnomalyFeedbackType.plannedActivity;
    }
    throw Exception('$this is not known in enum AnomalyFeedbackType');
  }
}

/// This object continuously inspects your account's cost data for anomalies.
/// It's based on <code>MonitorType</code> and
/// <code>MonitorSpecification</code>. The content consists of detailed metadata
/// and the current status of the monitor object.
class AnomalyMonitor {
  /// The name of the monitor.
  final String monitorName;

  /// The possible type values.
  final MonitorType monitorType;

  /// The date when the monitor was created.
  final String? creationDate;

  /// The value for evaluated dimensions.
  final int? dimensionalValueCount;

  /// The date when the monitor last evaluated for anomalies.
  final String? lastEvaluatedDate;

  /// The date when the monitor was last updated.
  final String? lastUpdatedDate;

  /// The Amazon Resource Name (ARN) value.
  final String? monitorArn;

  /// The dimensions to evaluate.
  final MonitorDimension? monitorDimension;
  final Expression? monitorSpecification;

  AnomalyMonitor({
    required this.monitorName,
    required this.monitorType,
    this.creationDate,
    this.dimensionalValueCount,
    this.lastEvaluatedDate,
    this.lastUpdatedDate,
    this.monitorArn,
    this.monitorDimension,
    this.monitorSpecification,
  });

  factory AnomalyMonitor.fromJson(Map<String, dynamic> json) {
    return AnomalyMonitor(
      monitorName: json['MonitorName'] as String,
      monitorType: (json['MonitorType'] as String).toMonitorType(),
      creationDate: json['CreationDate'] as String?,
      dimensionalValueCount: json['DimensionalValueCount'] as int?,
      lastEvaluatedDate: json['LastEvaluatedDate'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      monitorArn: json['MonitorArn'] as String?,
      monitorDimension:
          (json['MonitorDimension'] as String?)?.toMonitorDimension(),
      monitorSpecification: json['MonitorSpecification'] != null
          ? Expression.fromJson(
              json['MonitorSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final monitorName = this.monitorName;
    final monitorType = this.monitorType;
    final creationDate = this.creationDate;
    final dimensionalValueCount = this.dimensionalValueCount;
    final lastEvaluatedDate = this.lastEvaluatedDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final monitorArn = this.monitorArn;
    final monitorDimension = this.monitorDimension;
    final monitorSpecification = this.monitorSpecification;
    return {
      'MonitorName': monitorName,
      'MonitorType': monitorType.toValue(),
      if (creationDate != null) 'CreationDate': creationDate,
      if (dimensionalValueCount != null)
        'DimensionalValueCount': dimensionalValueCount,
      if (lastEvaluatedDate != null) 'LastEvaluatedDate': lastEvaluatedDate,
      if (lastUpdatedDate != null) 'LastUpdatedDate': lastUpdatedDate,
      if (monitorArn != null) 'MonitorArn': monitorArn,
      if (monitorDimension != null)
        'MonitorDimension': monitorDimension.toValue(),
      if (monitorSpecification != null)
        'MonitorSpecification': monitorSpecification,
    };
  }
}

/// Quantifies the anomaly. The higher score means that it's more anomalous.
class AnomalyScore {
  /// The last observed score.
  final double currentScore;

  /// The maximum score that's observed during the
  /// <code>AnomalyDateInterval</code>.
  final double maxScore;

  AnomalyScore({
    required this.currentScore,
    required this.maxScore,
  });

  factory AnomalyScore.fromJson(Map<String, dynamic> json) {
    return AnomalyScore(
      currentScore: json['CurrentScore'] as double,
      maxScore: json['MaxScore'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final currentScore = this.currentScore;
    final maxScore = this.maxScore;
    return {
      'CurrentScore': currentScore,
      'MaxScore': maxScore,
    };
  }
}

/// An <code>AnomalySubscription</code> resource (also referred to as an alert
/// subscription) sends notifications about specific anomalies that meet an
/// alerting criteria defined by you.
///
/// You can specify the frequency of the alerts and the subscribers to notify.
///
/// Anomaly subscriptions can be associated with one or more <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html">
/// <code>AnomalyMonitor</code> </a> resources, and they only send notifications
/// about anomalies detected by those associated monitors. You can also
/// configure a threshold to further control which anomalies are included in the
/// notifications.
///
/// Anomalies that don’t exceed the chosen threshold and therefore don’t trigger
/// notifications from an anomaly subscription will still be available on the
/// console and from the <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetAnomalies.html">
/// <code>GetAnomalies</code> </a> API.
class AnomalySubscription {
  /// The frequency that anomaly notifications are sent. Notifications are sent
  /// either over email (for DAILY and WEEKLY frequencies) or SNS (for IMMEDIATE
  /// frequency). For more information, see <a
  /// href="https://docs.aws.amazon.com/cost-management/latest/userguide/ad-SNS.html">Creating
  /// an Amazon SNS topic for anomaly notifications</a>.
  final AnomalySubscriptionFrequency frequency;

  /// A list of cost anomaly monitors.
  final List<String> monitorArnList;

  /// A list of subscribers to notify.
  final List<Subscriber> subscribers;

  /// The name for the subscription.
  final String subscriptionName;

  /// Your unique account identifier.
  final String? accountId;

  /// The <code>AnomalySubscription</code> Amazon Resource Name (ARN).
  final String? subscriptionArn;

  /// (deprecated)
  ///
  /// An absolute dollar value that must be exceeded by the anomaly's total impact
  /// (see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html">Impact</a>
  /// for more details) for an anomaly notification to be generated.
  ///
  /// This field has been deprecated. To specify a threshold, use
  /// ThresholdExpression. Continued use of Threshold will be treated as shorthand
  /// syntax for a ThresholdExpression.
  ///
  /// One of Threshold or ThresholdExpression is required for this resource. You
  /// cannot specify both.
  final double? threshold;

  /// An <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object used to specify the anomalies that you want to generate alerts for.
  /// This supports dimensions and nested expressions. The supported dimensions
  /// are <code>ANOMALY_TOTAL_IMPACT_ABSOLUTE</code> and
  /// <code>ANOMALY_TOTAL_IMPACT_PERCENTAGE</code>, corresponding to an anomaly’s
  /// TotalImpact and TotalImpactPercentage, respectively (see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html">Impact</a>
  /// for more details). The supported nested expression types are
  /// <code>AND</code> and <code>OR</code>. The match option
  /// <code>GREATER_THAN_OR_EQUAL</code> is required. Values must be numbers
  /// between 0 and 10,000,000,000 in string format.
  ///
  /// One of Threshold or ThresholdExpression is required for this resource. You
  /// cannot specify both.
  ///
  /// The following are examples of valid ThresholdExpressions:
  ///
  /// <ul>
  /// <li>
  /// Absolute threshold: <code>{ "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL"
  /// ], "Values": [ "100" ] } }</code>
  /// </li>
  /// <li>
  /// Percentage threshold: <code>{ "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL"
  /// ], "Values": [ "100" ] } }</code>
  /// </li>
  /// <li>
  /// <code>AND</code> two thresholds together: <code>{ "And": [ { "Dimensions": {
  /// "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } }, { "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL"
  /// ], "Values": [ "100" ] } } ] }</code>
  /// </li>
  /// <li>
  /// <code>OR</code> two thresholds together: <code>{ "Or": [ { "Dimensions": {
  /// "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [
  /// "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } }, { "Dimensions": { "Key":
  /// "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL"
  /// ], "Values": [ "100" ] } } ] }</code>
  /// </li>
  /// </ul>
  final Expression? thresholdExpression;

  AnomalySubscription({
    required this.frequency,
    required this.monitorArnList,
    required this.subscribers,
    required this.subscriptionName,
    this.accountId,
    this.subscriptionArn,
    this.threshold,
    this.thresholdExpression,
  });

  factory AnomalySubscription.fromJson(Map<String, dynamic> json) {
    return AnomalySubscription(
      frequency: (json['Frequency'] as String).toAnomalySubscriptionFrequency(),
      monitorArnList: (json['MonitorArnList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subscribers: (json['Subscribers'] as List)
          .whereNotNull()
          .map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionName: json['SubscriptionName'] as String,
      accountId: json['AccountId'] as String?,
      subscriptionArn: json['SubscriptionArn'] as String?,
      threshold: json['Threshold'] as double?,
      thresholdExpression: json['ThresholdExpression'] != null
          ? Expression.fromJson(
              json['ThresholdExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final frequency = this.frequency;
    final monitorArnList = this.monitorArnList;
    final subscribers = this.subscribers;
    final subscriptionName = this.subscriptionName;
    final accountId = this.accountId;
    final subscriptionArn = this.subscriptionArn;
    final threshold = this.threshold;
    final thresholdExpression = this.thresholdExpression;
    return {
      'Frequency': frequency.toValue(),
      'MonitorArnList': monitorArnList,
      'Subscribers': subscribers,
      'SubscriptionName': subscriptionName,
      if (accountId != null) 'AccountId': accountId,
      if (subscriptionArn != null) 'SubscriptionArn': subscriptionArn,
      if (threshold != null) 'Threshold': threshold,
      if (thresholdExpression != null)
        'ThresholdExpression': thresholdExpression,
    };
  }
}

enum AnomalySubscriptionFrequency {
  daily,
  immediate,
  weekly,
}

extension AnomalySubscriptionFrequencyValueExtension
    on AnomalySubscriptionFrequency {
  String toValue() {
    switch (this) {
      case AnomalySubscriptionFrequency.daily:
        return 'DAILY';
      case AnomalySubscriptionFrequency.immediate:
        return 'IMMEDIATE';
      case AnomalySubscriptionFrequency.weekly:
        return 'WEEKLY';
    }
  }
}

extension AnomalySubscriptionFrequencyFromString on String {
  AnomalySubscriptionFrequency toAnomalySubscriptionFrequency() {
    switch (this) {
      case 'DAILY':
        return AnomalySubscriptionFrequency.daily;
      case 'IMMEDIATE':
        return AnomalySubscriptionFrequency.immediate;
      case 'WEEKLY':
        return AnomalySubscriptionFrequency.weekly;
    }
    throw Exception('$this is not known in enum AnomalySubscriptionFrequency');
  }
}

enum ApproximationDimension {
  service,
  resource,
}

extension ApproximationDimensionValueExtension on ApproximationDimension {
  String toValue() {
    switch (this) {
      case ApproximationDimension.service:
        return 'SERVICE';
      case ApproximationDimension.resource:
        return 'RESOURCE';
    }
  }
}

extension ApproximationDimensionFromString on String {
  ApproximationDimension toApproximationDimension() {
    switch (this) {
      case 'SERVICE':
        return ApproximationDimension.service;
      case 'RESOURCE':
        return ApproximationDimension.resource;
    }
    throw Exception('$this is not known in enum ApproximationDimension');
  }
}

enum Context {
  costAndUsage,
  reservations,
  savingsPlans,
}

extension ContextValueExtension on Context {
  String toValue() {
    switch (this) {
      case Context.costAndUsage:
        return 'COST_AND_USAGE';
      case Context.reservations:
        return 'RESERVATIONS';
      case Context.savingsPlans:
        return 'SAVINGS_PLANS';
    }
  }
}

extension ContextFromString on String {
  Context toContext() {
    switch (this) {
      case 'COST_AND_USAGE':
        return Context.costAndUsage;
      case 'RESERVATIONS':
        return Context.reservations;
      case 'SAVINGS_PLANS':
        return Context.savingsPlans;
    }
    throw Exception('$this is not known in enum Context');
  }
}

/// The cost allocation tag structure. This includes detailed metadata for the
/// <code>CostAllocationTag</code> object.
class CostAllocationTag {
  /// The status of a cost allocation tag.
  final CostAllocationTagStatus status;

  /// The key for the cost allocation tag.
  final String tagKey;

  /// The type of cost allocation tag. You can use <code>AWSGenerated</code> or
  /// <code>UserDefined</code> type tags. <code>AWSGenerated</code> type tags are
  /// tags that Amazon Web Services defines and applies to support Amazon Web
  /// Services resources for cost allocation purposes. <code>UserDefined</code>
  /// type tags are tags that you define, create, and apply to resources.
  final CostAllocationTagType type;

  /// The last date that the tag was either activated or deactivated.
  final String? lastUpdatedDate;

  /// The last month that the tag was used on an Amazon Web Services resource.
  final String? lastUsedDate;

  CostAllocationTag({
    required this.status,
    required this.tagKey,
    required this.type,
    this.lastUpdatedDate,
    this.lastUsedDate,
  });

  factory CostAllocationTag.fromJson(Map<String, dynamic> json) {
    return CostAllocationTag(
      status: (json['Status'] as String).toCostAllocationTagStatus(),
      tagKey: json['TagKey'] as String,
      type: (json['Type'] as String).toCostAllocationTagType(),
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      lastUsedDate: json['LastUsedDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final tagKey = this.tagKey;
    final type = this.type;
    final lastUpdatedDate = this.lastUpdatedDate;
    final lastUsedDate = this.lastUsedDate;
    return {
      'Status': status.toValue(),
      'TagKey': tagKey,
      'Type': type.toValue(),
      if (lastUpdatedDate != null) 'LastUpdatedDate': lastUpdatedDate,
      if (lastUsedDate != null) 'LastUsedDate': lastUsedDate,
    };
  }
}

/// The cost allocation tag backfill request structure that contains metadata
/// and details of a certain backfill.
class CostAllocationTagBackfillRequest {
  /// The date the backfill starts from.
  final String? backfillFrom;

  /// The status of the cost allocation tag backfill request.
  final CostAllocationTagBackfillStatus? backfillStatus;

  /// The backfill completion time.
  final String? completedAt;

  /// The time when the backfill status was last updated.
  final String? lastUpdatedAt;

  /// The time when the backfill was requested.
  final String? requestedAt;

  CostAllocationTagBackfillRequest({
    this.backfillFrom,
    this.backfillStatus,
    this.completedAt,
    this.lastUpdatedAt,
    this.requestedAt,
  });

  factory CostAllocationTagBackfillRequest.fromJson(Map<String, dynamic> json) {
    return CostAllocationTagBackfillRequest(
      backfillFrom: json['BackfillFrom'] as String?,
      backfillStatus: (json['BackfillStatus'] as String?)
          ?.toCostAllocationTagBackfillStatus(),
      completedAt: json['CompletedAt'] as String?,
      lastUpdatedAt: json['LastUpdatedAt'] as String?,
      requestedAt: json['RequestedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backfillFrom = this.backfillFrom;
    final backfillStatus = this.backfillStatus;
    final completedAt = this.completedAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final requestedAt = this.requestedAt;
    return {
      if (backfillFrom != null) 'BackfillFrom': backfillFrom,
      if (backfillStatus != null) 'BackfillStatus': backfillStatus.toValue(),
      if (completedAt != null) 'CompletedAt': completedAt,
      if (lastUpdatedAt != null) 'LastUpdatedAt': lastUpdatedAt,
      if (requestedAt != null) 'RequestedAt': requestedAt,
    };
  }
}

enum CostAllocationTagBackfillStatus {
  succeeded,
  processing,
  failed,
}

extension CostAllocationTagBackfillStatusValueExtension
    on CostAllocationTagBackfillStatus {
  String toValue() {
    switch (this) {
      case CostAllocationTagBackfillStatus.succeeded:
        return 'SUCCEEDED';
      case CostAllocationTagBackfillStatus.processing:
        return 'PROCESSING';
      case CostAllocationTagBackfillStatus.failed:
        return 'FAILED';
    }
  }
}

extension CostAllocationTagBackfillStatusFromString on String {
  CostAllocationTagBackfillStatus toCostAllocationTagBackfillStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return CostAllocationTagBackfillStatus.succeeded;
      case 'PROCESSING':
        return CostAllocationTagBackfillStatus.processing;
      case 'FAILED':
        return CostAllocationTagBackfillStatus.failed;
    }
    throw Exception(
        '$this is not known in enum CostAllocationTagBackfillStatus');
  }
}

enum CostAllocationTagStatus {
  active,
  inactive,
}

extension CostAllocationTagStatusValueExtension on CostAllocationTagStatus {
  String toValue() {
    switch (this) {
      case CostAllocationTagStatus.active:
        return 'Active';
      case CostAllocationTagStatus.inactive:
        return 'Inactive';
    }
  }
}

extension CostAllocationTagStatusFromString on String {
  CostAllocationTagStatus toCostAllocationTagStatus() {
    switch (this) {
      case 'Active':
        return CostAllocationTagStatus.active;
      case 'Inactive':
        return CostAllocationTagStatus.inactive;
    }
    throw Exception('$this is not known in enum CostAllocationTagStatus');
  }
}

/// The cost allocation tag status. The status of a key can either be active or
/// inactive.
class CostAllocationTagStatusEntry {
  /// The status of a cost allocation tag.
  final CostAllocationTagStatus status;

  /// The key for the cost allocation tag.
  final String tagKey;

  CostAllocationTagStatusEntry({
    required this.status,
    required this.tagKey,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final tagKey = this.tagKey;
    return {
      'Status': status.toValue(),
      'TagKey': tagKey,
    };
  }
}

enum CostAllocationTagType {
  awsGenerated,
  userDefined,
}

extension CostAllocationTagTypeValueExtension on CostAllocationTagType {
  String toValue() {
    switch (this) {
      case CostAllocationTagType.awsGenerated:
        return 'AWSGenerated';
      case CostAllocationTagType.userDefined:
        return 'UserDefined';
    }
  }
}

extension CostAllocationTagTypeFromString on String {
  CostAllocationTagType toCostAllocationTagType() {
    switch (this) {
      case 'AWSGenerated':
        return CostAllocationTagType.awsGenerated;
      case 'UserDefined':
        return CostAllocationTagType.userDefined;
    }
    throw Exception('$this is not known in enum CostAllocationTagType');
  }
}

/// The structure of Cost Categories. This includes detailed metadata and the
/// set of rules for the <code>CostCategory</code> object.
class CostCategory {
  /// The unique identifier for your Cost Category.
  final String costCategoryArn;

  /// The effective start date of your Cost Category.
  final String effectiveStart;
  final String name;
  final CostCategoryRuleVersion ruleVersion;

  /// The rules are processed in order. If there are multiple rules that match the
  /// line item, then the first rule to match is used to determine that Cost
  /// Category value.
  final List<CostCategoryRule> rules;
  final String? defaultValue;

  /// The effective end date of your Cost Category.
  final String? effectiveEnd;

  /// The list of processing statuses for Cost Management products for a specific
  /// cost category.
  final List<CostCategoryProcessingStatus>? processingStatus;

  /// The split charge rules that are used to allocate your charges between your
  /// Cost Category values.
  final List<CostCategorySplitChargeRule>? splitChargeRules;

  CostCategory({
    required this.costCategoryArn,
    required this.effectiveStart,
    required this.name,
    required this.ruleVersion,
    required this.rules,
    this.defaultValue,
    this.effectiveEnd,
    this.processingStatus,
    this.splitChargeRules,
  });

  factory CostCategory.fromJson(Map<String, dynamic> json) {
    return CostCategory(
      costCategoryArn: json['CostCategoryArn'] as String,
      effectiveStart: json['EffectiveStart'] as String,
      name: json['Name'] as String,
      ruleVersion: (json['RuleVersion'] as String).toCostCategoryRuleVersion(),
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => CostCategoryRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultValue: json['DefaultValue'] as String?,
      effectiveEnd: json['EffectiveEnd'] as String?,
      processingStatus: (json['ProcessingStatus'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CostCategoryProcessingStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      splitChargeRules: (json['SplitChargeRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CostCategorySplitChargeRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryArn = this.costCategoryArn;
    final effectiveStart = this.effectiveStart;
    final name = this.name;
    final ruleVersion = this.ruleVersion;
    final rules = this.rules;
    final defaultValue = this.defaultValue;
    final effectiveEnd = this.effectiveEnd;
    final processingStatus = this.processingStatus;
    final splitChargeRules = this.splitChargeRules;
    return {
      'CostCategoryArn': costCategoryArn,
      'EffectiveStart': effectiveStart,
      'Name': name,
      'RuleVersion': ruleVersion.toValue(),
      'Rules': rules,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (effectiveEnd != null) 'EffectiveEnd': effectiveEnd,
      if (processingStatus != null) 'ProcessingStatus': processingStatus,
      if (splitChargeRules != null) 'SplitChargeRules': splitChargeRules,
    };
  }
}

/// When you create or update a cost category, you can define the
/// <code>CostCategoryRule</code> rule type as <code>INHERITED_VALUE</code>.
/// This rule type adds the flexibility to define a rule that dynamically
/// inherits the cost category value from the dimension value that's defined by
/// <code>CostCategoryInheritedValueDimension</code>. For example, suppose that
/// you want to dynamically group costs that are based on the value of a
/// specific tag key. First, choose an inherited value rule type, and then
/// choose the tag dimension and specify the tag key to use.
class CostCategoryInheritedValueDimension {
  /// The key to extract cost category values.
  final String? dimensionKey;

  /// The name of the dimension that's used to group costs.
  ///
  /// If you specify <code>LINKED_ACCOUNT_NAME</code>, the cost category value is
  /// based on account name. If you specify <code>TAG</code>, the cost category
  /// value is based on the value of the specified tag key.
  final CostCategoryInheritedValueDimensionName? dimensionName;

  CostCategoryInheritedValueDimension({
    this.dimensionKey,
    this.dimensionName,
  });

  factory CostCategoryInheritedValueDimension.fromJson(
      Map<String, dynamic> json) {
    return CostCategoryInheritedValueDimension(
      dimensionKey: json['DimensionKey'] as String?,
      dimensionName: (json['DimensionName'] as String?)
          ?.toCostCategoryInheritedValueDimensionName(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final dimensionName = this.dimensionName;
    return {
      if (dimensionKey != null) 'DimensionKey': dimensionKey,
      if (dimensionName != null) 'DimensionName': dimensionName.toValue(),
    };
  }
}

enum CostCategoryInheritedValueDimensionName {
  linkedAccountName,
  tag,
}

extension CostCategoryInheritedValueDimensionNameValueExtension
    on CostCategoryInheritedValueDimensionName {
  String toValue() {
    switch (this) {
      case CostCategoryInheritedValueDimensionName.linkedAccountName:
        return 'LINKED_ACCOUNT_NAME';
      case CostCategoryInheritedValueDimensionName.tag:
        return 'TAG';
    }
  }
}

extension CostCategoryInheritedValueDimensionNameFromString on String {
  CostCategoryInheritedValueDimensionName
      toCostCategoryInheritedValueDimensionName() {
    switch (this) {
      case 'LINKED_ACCOUNT_NAME':
        return CostCategoryInheritedValueDimensionName.linkedAccountName;
      case 'TAG':
        return CostCategoryInheritedValueDimensionName.tag;
    }
    throw Exception(
        '$this is not known in enum CostCategoryInheritedValueDimensionName');
  }
}

/// The list of processing statuses for Cost Management products for a specific
/// cost category.
class CostCategoryProcessingStatus {
  /// The Cost Management product name of the applied status.
  final CostCategoryStatusComponent? component;

  /// The process status for a specific cost category.
  final CostCategoryStatus? status;

  CostCategoryProcessingStatus({
    this.component,
    this.status,
  });

  factory CostCategoryProcessingStatus.fromJson(Map<String, dynamic> json) {
    return CostCategoryProcessingStatus(
      component:
          (json['Component'] as String?)?.toCostCategoryStatusComponent(),
      status: (json['Status'] as String?)?.toCostCategoryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    final status = this.status;
    return {
      if (component != null) 'Component': component.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A reference to a Cost Category containing only enough information to
/// identify the Cost Category.
///
/// You can use this information to retrieve the full Cost Category information
/// using <code>DescribeCostCategory</code>.
class CostCategoryReference {
  /// The unique identifier for your Cost Category.
  final String? costCategoryArn;
  final String? defaultValue;

  /// The Cost Category's effective end date.
  final String? effectiveEnd;

  /// The Cost Category's effective start date.
  final String? effectiveStart;
  final String? name;

  /// The number of rules that are associated with a specific Cost Category.
  final int? numberOfRules;

  /// The list of processing statuses for Cost Management products for a specific
  /// cost category.
  final List<CostCategoryProcessingStatus>? processingStatus;

  /// A list of unique cost category values in a specific cost category.
  final List<String>? values;

  CostCategoryReference({
    this.costCategoryArn,
    this.defaultValue,
    this.effectiveEnd,
    this.effectiveStart,
    this.name,
    this.numberOfRules,
    this.processingStatus,
    this.values,
  });

  factory CostCategoryReference.fromJson(Map<String, dynamic> json) {
    return CostCategoryReference(
      costCategoryArn: json['CostCategoryArn'] as String?,
      defaultValue: json['DefaultValue'] as String?,
      effectiveEnd: json['EffectiveEnd'] as String?,
      effectiveStart: json['EffectiveStart'] as String?,
      name: json['Name'] as String?,
      numberOfRules: json['NumberOfRules'] as int?,
      processingStatus: (json['ProcessingStatus'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CostCategoryProcessingStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryArn = this.costCategoryArn;
    final defaultValue = this.defaultValue;
    final effectiveEnd = this.effectiveEnd;
    final effectiveStart = this.effectiveStart;
    final name = this.name;
    final numberOfRules = this.numberOfRules;
    final processingStatus = this.processingStatus;
    final values = this.values;
    return {
      if (costCategoryArn != null) 'CostCategoryArn': costCategoryArn,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (effectiveEnd != null) 'EffectiveEnd': effectiveEnd,
      if (effectiveStart != null) 'EffectiveStart': effectiveStart,
      if (name != null) 'Name': name,
      if (numberOfRules != null) 'NumberOfRules': numberOfRules,
      if (processingStatus != null) 'ProcessingStatus': processingStatus,
      if (values != null) 'Values': values,
    };
  }
}

/// Rules are processed in order. If there are multiple rules that match the
/// line item, then the first rule to match is used to determine that Cost
/// Category value.
class CostCategoryRule {
  /// The value the line item is categorized as if the line item contains the
  /// matched dimension.
  final CostCategoryInheritedValueDimension? inheritedValue;

  /// An <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object used to categorize costs. This supports dimensions, tags, and nested
  /// expressions. Currently the only dimensions supported are
  /// <code>LINKED_ACCOUNT</code>, <code>SERVICE_CODE</code>,
  /// <code>RECORD_TYPE</code>, <code>LINKED_ACCOUNT_NAME</code>,
  /// <code>REGION</code>, and <code>USAGE_TYPE</code>.
  ///
  /// <code>RECORD_TYPE</code> is a dimension used for Cost Explorer APIs, and is
  /// also supported for Cost Category expressions. This dimension uses different
  /// terms, depending on whether you're using the console or API/JSON editor. For
  /// a detailed comparison, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html#cost-categories-terms">Term
  /// Comparisons</a> in the <i>Billing and Cost Management User Guide</i>.
  final Expression? rule;

  /// You can define the <code>CostCategoryRule</code> rule type as either
  /// <code>REGULAR</code> or <code>INHERITED_VALUE</code>. The
  /// <code>INHERITED_VALUE</code> rule type adds the flexibility to define a rule
  /// that dynamically inherits the cost category value. This value is from the
  /// dimension value that's defined by
  /// <code>CostCategoryInheritedValueDimension</code>. For example, suppose that
  /// you want to costs to be dynamically grouped based on the value of a specific
  /// tag key. First, choose an inherited value rule type, and then choose the tag
  /// dimension and specify the tag key to use.
  final CostCategoryRuleType? type;
  final String? value;

  CostCategoryRule({
    this.inheritedValue,
    this.rule,
    this.type,
    this.value,
  });

  factory CostCategoryRule.fromJson(Map<String, dynamic> json) {
    return CostCategoryRule(
      inheritedValue: json['InheritedValue'] != null
          ? CostCategoryInheritedValueDimension.fromJson(
              json['InheritedValue'] as Map<String, dynamic>)
          : null,
      rule: json['Rule'] != null
          ? Expression.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toCostCategoryRuleType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inheritedValue = this.inheritedValue;
    final rule = this.rule;
    final type = this.type;
    final value = this.value;
    return {
      if (inheritedValue != null) 'InheritedValue': inheritedValue,
      if (rule != null) 'Rule': rule,
      if (type != null) 'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum CostCategoryRuleType {
  regular,
  inheritedValue,
}

extension CostCategoryRuleTypeValueExtension on CostCategoryRuleType {
  String toValue() {
    switch (this) {
      case CostCategoryRuleType.regular:
        return 'REGULAR';
      case CostCategoryRuleType.inheritedValue:
        return 'INHERITED_VALUE';
    }
  }
}

extension CostCategoryRuleTypeFromString on String {
  CostCategoryRuleType toCostCategoryRuleType() {
    switch (this) {
      case 'REGULAR':
        return CostCategoryRuleType.regular;
      case 'INHERITED_VALUE':
        return CostCategoryRuleType.inheritedValue;
    }
    throw Exception('$this is not known in enum CostCategoryRuleType');
  }
}

/// The rule schema version in this particular Cost Category.
enum CostCategoryRuleVersion {
  costCategoryExpressionV1,
}

extension CostCategoryRuleVersionValueExtension on CostCategoryRuleVersion {
  String toValue() {
    switch (this) {
      case CostCategoryRuleVersion.costCategoryExpressionV1:
        return 'CostCategoryExpression.v1';
    }
  }
}

extension CostCategoryRuleVersionFromString on String {
  CostCategoryRuleVersion toCostCategoryRuleVersion() {
    switch (this) {
      case 'CostCategoryExpression.v1':
        return CostCategoryRuleVersion.costCategoryExpressionV1;
    }
    throw Exception('$this is not known in enum CostCategoryRuleVersion');
  }
}

enum CostCategorySplitChargeMethod {
  fixed,
  proportional,
  even,
}

extension CostCategorySplitChargeMethodValueExtension
    on CostCategorySplitChargeMethod {
  String toValue() {
    switch (this) {
      case CostCategorySplitChargeMethod.fixed:
        return 'FIXED';
      case CostCategorySplitChargeMethod.proportional:
        return 'PROPORTIONAL';
      case CostCategorySplitChargeMethod.even:
        return 'EVEN';
    }
  }
}

extension CostCategorySplitChargeMethodFromString on String {
  CostCategorySplitChargeMethod toCostCategorySplitChargeMethod() {
    switch (this) {
      case 'FIXED':
        return CostCategorySplitChargeMethod.fixed;
      case 'PROPORTIONAL':
        return CostCategorySplitChargeMethod.proportional;
      case 'EVEN':
        return CostCategorySplitChargeMethod.even;
    }
    throw Exception('$this is not known in enum CostCategorySplitChargeMethod');
  }
}

/// Use the split charge rule to split the cost of one Cost Category value
/// across several other target values.
class CostCategorySplitChargeRule {
  /// The method that's used to define how to split your source costs across your
  /// targets.
  ///
  /// <code>Proportional</code> - Allocates charges across your targets based on
  /// the proportional weighted cost of each target.
  ///
  /// <code>Fixed</code> - Allocates charges across your targets based on your
  /// defined allocation percentage.
  ///
  /// &gt;<code>Even</code> - Allocates costs evenly across all targets.
  final CostCategorySplitChargeMethod method;

  /// The Cost Category value that you want to split. That value can't be used as
  /// a source or a target in other split charge rules. To indicate uncategorized
  /// costs, you can use an empty string as the source.
  final String source;

  /// The Cost Category values that you want to split costs across. These values
  /// can't be used as a source in other split charge rules.
  final List<String> targets;

  /// The parameters for a split charge method. This is only required for the
  /// <code>FIXED</code> method.
  final List<CostCategorySplitChargeRuleParameter>? parameters;

  CostCategorySplitChargeRule({
    required this.method,
    required this.source,
    required this.targets,
    this.parameters,
  });

  factory CostCategorySplitChargeRule.fromJson(Map<String, dynamic> json) {
    return CostCategorySplitChargeRule(
      method: (json['Method'] as String).toCostCategorySplitChargeMethod(),
      source: json['Source'] as String,
      targets: (json['Targets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => CostCategorySplitChargeRuleParameter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final method = this.method;
    final source = this.source;
    final targets = this.targets;
    final parameters = this.parameters;
    return {
      'Method': method.toValue(),
      'Source': source,
      'Targets': targets,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// The parameters for a split charge method.
class CostCategorySplitChargeRuleParameter {
  /// The parameter type.
  final CostCategorySplitChargeRuleParameterType type;

  /// The parameter values.
  final List<String> values;

  CostCategorySplitChargeRuleParameter({
    required this.type,
    required this.values,
  });

  factory CostCategorySplitChargeRuleParameter.fromJson(
      Map<String, dynamic> json) {
    return CostCategorySplitChargeRuleParameter(
      type:
          (json['Type'] as String).toCostCategorySplitChargeRuleParameterType(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final values = this.values;
    return {
      'Type': type.toValue(),
      'Values': values,
    };
  }
}

enum CostCategorySplitChargeRuleParameterType {
  allocationPercentages,
}

extension CostCategorySplitChargeRuleParameterTypeValueExtension
    on CostCategorySplitChargeRuleParameterType {
  String toValue() {
    switch (this) {
      case CostCategorySplitChargeRuleParameterType.allocationPercentages:
        return 'ALLOCATION_PERCENTAGES';
    }
  }
}

extension CostCategorySplitChargeRuleParameterTypeFromString on String {
  CostCategorySplitChargeRuleParameterType
      toCostCategorySplitChargeRuleParameterType() {
    switch (this) {
      case 'ALLOCATION_PERCENTAGES':
        return CostCategorySplitChargeRuleParameterType.allocationPercentages;
    }
    throw Exception(
        '$this is not known in enum CostCategorySplitChargeRuleParameterType');
  }
}

enum CostCategoryStatus {
  processing,
  applied,
}

extension CostCategoryStatusValueExtension on CostCategoryStatus {
  String toValue() {
    switch (this) {
      case CostCategoryStatus.processing:
        return 'PROCESSING';
      case CostCategoryStatus.applied:
        return 'APPLIED';
    }
  }
}

extension CostCategoryStatusFromString on String {
  CostCategoryStatus toCostCategoryStatus() {
    switch (this) {
      case 'PROCESSING':
        return CostCategoryStatus.processing;
      case 'APPLIED':
        return CostCategoryStatus.applied;
    }
    throw Exception('$this is not known in enum CostCategoryStatus');
  }
}

enum CostCategoryStatusComponent {
  costExplorer,
}

extension CostCategoryStatusComponentValueExtension
    on CostCategoryStatusComponent {
  String toValue() {
    switch (this) {
      case CostCategoryStatusComponent.costExplorer:
        return 'COST_EXPLORER';
    }
  }
}

extension CostCategoryStatusComponentFromString on String {
  CostCategoryStatusComponent toCostCategoryStatusComponent() {
    switch (this) {
      case 'COST_EXPLORER':
        return CostCategoryStatusComponent.costExplorer;
    }
    throw Exception('$this is not known in enum CostCategoryStatusComponent');
  }
}

/// The Cost Categories values used for filtering the costs.
///
/// If <code>Values</code> and <code>Key</code> are not specified, the
/// <code>ABSENT</code> <code>MatchOption</code> is applied to all Cost
/// Categories. That is, it filters on resources that aren't mapped to any Cost
/// Categories.
///
/// If <code>Values</code> is provided and <code>Key</code> isn't specified, the
/// <code>ABSENT</code> <code>MatchOption</code> is applied to the Cost
/// Categories <code>Key</code> only. That is, it filters on resources without
/// the given Cost Categories key.
class CostCategoryValues {
  final String? key;

  /// The match options that you can use to filter your results. MatchOptions is
  /// only applicable for actions related to cost category. The default values for
  /// <code>MatchOptions</code> is <code>EQUALS</code> and
  /// <code>CASE_SENSITIVE</code>.
  final List<MatchOption>? matchOptions;

  /// The specific value of the Cost Category.
  final List<String>? values;

  CostCategoryValues({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory CostCategoryValues.fromJson(Map<String, dynamic> json) {
    return CostCategoryValues(
      key: json['Key'] as String?,
      matchOptions: (json['MatchOptions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMatchOption())
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (matchOptions != null)
        'MatchOptions': matchOptions.map((e) => e.toValue()).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// The amount of instance usage that a reservation covered.
class Coverage {
  /// The amount of cost that the reservation covered.
  final CoverageCost? coverageCost;

  /// The amount of instance usage that the reservation covered, in hours.
  final CoverageHours? coverageHours;

  /// The amount of instance usage that the reservation covered, in normalized
  /// units.
  final CoverageNormalizedUnits? coverageNormalizedUnits;

  Coverage({
    this.coverageCost,
    this.coverageHours,
    this.coverageNormalizedUnits,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) {
    return Coverage(
      coverageCost: json['CoverageCost'] != null
          ? CoverageCost.fromJson(json['CoverageCost'] as Map<String, dynamic>)
          : null,
      coverageHours: json['CoverageHours'] != null
          ? CoverageHours.fromJson(
              json['CoverageHours'] as Map<String, dynamic>)
          : null,
      coverageNormalizedUnits: json['CoverageNormalizedUnits'] != null
          ? CoverageNormalizedUnits.fromJson(
              json['CoverageNormalizedUnits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coverageCost = this.coverageCost;
    final coverageHours = this.coverageHours;
    final coverageNormalizedUnits = this.coverageNormalizedUnits;
    return {
      if (coverageCost != null) 'CoverageCost': coverageCost,
      if (coverageHours != null) 'CoverageHours': coverageHours,
      if (coverageNormalizedUnits != null)
        'CoverageNormalizedUnits': coverageNormalizedUnits,
    };
  }
}

/// Reservation coverage for a specified period, in hours.
class CoverageByTime {
  /// The groups of instances that the reservation covered.
  final List<ReservationCoverageGroup>? groups;

  /// The period that this coverage was used over.
  final DateInterval? timePeriod;

  /// The total reservation coverage, in hours.
  final Coverage? total;

  CoverageByTime({
    this.groups,
    this.timePeriod,
    this.total,
  });

  factory CoverageByTime.fromJson(Map<String, dynamic> json) {
    return CoverageByTime(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReservationCoverageGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timePeriod: json['TimePeriod'] != null
          ? DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
      total: json['Total'] != null
          ? Coverage.fromJson(json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final timePeriod = this.timePeriod;
    final total = this.total;
    return {
      if (groups != null) 'Groups': groups,
      if (timePeriod != null) 'TimePeriod': timePeriod,
      if (total != null) 'Total': total,
    };
  }
}

/// How much it costs to run an instance.
class CoverageCost {
  /// How much an On-Demand Instance costs.
  final String? onDemandCost;

  CoverageCost({
    this.onDemandCost,
  });

  factory CoverageCost.fromJson(Map<String, dynamic> json) {
    return CoverageCost(
      onDemandCost: json['OnDemandCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final onDemandCost = this.onDemandCost;
    return {
      if (onDemandCost != null) 'OnDemandCost': onDemandCost,
    };
  }
}

/// How long a running instance either used a reservation or was On-Demand.
class CoverageHours {
  /// The percentage of instance hours that a reservation covered.
  final String? coverageHoursPercentage;

  /// The number of instance running hours that On-Demand Instances covered.
  final String? onDemandHours;

  /// The number of instance running hours that reservations covered.
  final String? reservedHours;

  /// The total instance usage, in hours.
  final String? totalRunningHours;

  CoverageHours({
    this.coverageHoursPercentage,
    this.onDemandHours,
    this.reservedHours,
    this.totalRunningHours,
  });

  factory CoverageHours.fromJson(Map<String, dynamic> json) {
    return CoverageHours(
      coverageHoursPercentage: json['CoverageHoursPercentage'] as String?,
      onDemandHours: json['OnDemandHours'] as String?,
      reservedHours: json['ReservedHours'] as String?,
      totalRunningHours: json['TotalRunningHours'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coverageHoursPercentage = this.coverageHoursPercentage;
    final onDemandHours = this.onDemandHours;
    final reservedHours = this.reservedHours;
    final totalRunningHours = this.totalRunningHours;
    return {
      if (coverageHoursPercentage != null)
        'CoverageHoursPercentage': coverageHoursPercentage,
      if (onDemandHours != null) 'OnDemandHours': onDemandHours,
      if (reservedHours != null) 'ReservedHours': reservedHours,
      if (totalRunningHours != null) 'TotalRunningHours': totalRunningHours,
    };
  }
}

/// The amount of instance usage, in normalized units. You can use normalized
/// units to see your EC2 usage for multiple sizes of instances in a uniform
/// way. For example, suppose that you run an xlarge instance and a 2xlarge
/// instance. If you run both instances for the same amount of time, the 2xlarge
/// instance uses twice as much of your reservation as the xlarge instance, even
/// though both instances show only one instance-hour. When you use normalized
/// units instead of instance-hours, the xlarge instance used 8 normalized
/// units, and the 2xlarge instance used 16 normalized units.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying
/// Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for
/// Linux Instances</i>.
class CoverageNormalizedUnits {
  /// The percentage of your used instance normalized units that a reservation
  /// covers.
  final String? coverageNormalizedUnitsPercentage;

  /// The number of normalized units that are covered by On-Demand Instances
  /// instead of a reservation.
  final String? onDemandNormalizedUnits;

  /// The number of normalized units that a reservation covers.
  final String? reservedNormalizedUnits;

  /// The total number of normalized units that you used.
  final String? totalRunningNormalizedUnits;

  CoverageNormalizedUnits({
    this.coverageNormalizedUnitsPercentage,
    this.onDemandNormalizedUnits,
    this.reservedNormalizedUnits,
    this.totalRunningNormalizedUnits,
  });

  factory CoverageNormalizedUnits.fromJson(Map<String, dynamic> json) {
    return CoverageNormalizedUnits(
      coverageNormalizedUnitsPercentage:
          json['CoverageNormalizedUnitsPercentage'] as String?,
      onDemandNormalizedUnits: json['OnDemandNormalizedUnits'] as String?,
      reservedNormalizedUnits: json['ReservedNormalizedUnits'] as String?,
      totalRunningNormalizedUnits:
          json['TotalRunningNormalizedUnits'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coverageNormalizedUnitsPercentage =
        this.coverageNormalizedUnitsPercentage;
    final onDemandNormalizedUnits = this.onDemandNormalizedUnits;
    final reservedNormalizedUnits = this.reservedNormalizedUnits;
    final totalRunningNormalizedUnits = this.totalRunningNormalizedUnits;
    return {
      if (coverageNormalizedUnitsPercentage != null)
        'CoverageNormalizedUnitsPercentage': coverageNormalizedUnitsPercentage,
      if (onDemandNormalizedUnits != null)
        'OnDemandNormalizedUnits': onDemandNormalizedUnits,
      if (reservedNormalizedUnits != null)
        'ReservedNormalizedUnits': reservedNormalizedUnits,
      if (totalRunningNormalizedUnits != null)
        'TotalRunningNormalizedUnits': totalRunningNormalizedUnits,
    };
  }
}

class CreateAnomalyMonitorResponse {
  /// The unique identifier of your newly created cost anomaly detection monitor.
  final String monitorArn;

  CreateAnomalyMonitorResponse({
    required this.monitorArn,
  });

  factory CreateAnomalyMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnomalyMonitorResponse(
      monitorArn: json['MonitorArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    return {
      'MonitorArn': monitorArn,
    };
  }
}

class CreateAnomalySubscriptionResponse {
  /// The unique identifier of your newly created cost anomaly subscription.
  final String subscriptionArn;

  CreateAnomalySubscriptionResponse({
    required this.subscriptionArn,
  });

  factory CreateAnomalySubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAnomalySubscriptionResponse(
      subscriptionArn: json['SubscriptionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionArn = this.subscriptionArn;
    return {
      'SubscriptionArn': subscriptionArn,
    };
  }
}

class CreateCostCategoryDefinitionResponse {
  /// The unique identifier for your newly created Cost Category.
  final String? costCategoryArn;

  /// The Cost Category's effective start date. It can only be a billing start
  /// date (first day of the month).
  final String? effectiveStart;

  CreateCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveStart,
  });

  factory CreateCostCategoryDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCostCategoryDefinitionResponse(
      costCategoryArn: json['CostCategoryArn'] as String?,
      effectiveStart: json['EffectiveStart'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryArn = this.costCategoryArn;
    final effectiveStart = this.effectiveStart;
    return {
      if (costCategoryArn != null) 'CostCategoryArn': costCategoryArn,
      if (effectiveStart != null) 'EffectiveStart': effectiveStart,
    };
  }
}

/// Context about the current instance.
class CurrentInstance {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  final String? currencyCode;

  /// The name that you given an instance. This field shows as blank if you
  /// haven't given the instance a name.
  final String? instanceName;

  /// The current On-Demand cost of operating this instance on a monthly basis.
  final String? monthlyCost;

  /// The number of hours during the lookback period that's billed at On-Demand
  /// rates.
  final String? onDemandHoursInLookbackPeriod;

  /// The number of hours during the lookback period that's covered by
  /// reservations.
  final String? reservationCoveredHoursInLookbackPeriod;

  /// Details about the resource and utilization.
  final ResourceDetails? resourceDetails;

  /// Resource ID of the current instance.
  final String? resourceId;

  /// Utilization information of the current instance during the lookback period.
  final ResourceUtilization? resourceUtilization;

  /// The number of hours during the lookback period that's covered by Savings
  /// Plans.
  final String? savingsPlansCoveredHoursInLookbackPeriod;

  /// Cost allocation resource tags that are applied to the instance.
  final List<TagValues>? tags;

  /// The total number of hours that the instance ran during the lookback period.
  final String? totalRunningHoursInLookbackPeriod;

  CurrentInstance({
    this.currencyCode,
    this.instanceName,
    this.monthlyCost,
    this.onDemandHoursInLookbackPeriod,
    this.reservationCoveredHoursInLookbackPeriod,
    this.resourceDetails,
    this.resourceId,
    this.resourceUtilization,
    this.savingsPlansCoveredHoursInLookbackPeriod,
    this.tags,
    this.totalRunningHoursInLookbackPeriod,
  });

  factory CurrentInstance.fromJson(Map<String, dynamic> json) {
    return CurrentInstance(
      currencyCode: json['CurrencyCode'] as String?,
      instanceName: json['InstanceName'] as String?,
      monthlyCost: json['MonthlyCost'] as String?,
      onDemandHoursInLookbackPeriod:
          json['OnDemandHoursInLookbackPeriod'] as String?,
      reservationCoveredHoursInLookbackPeriod:
          json['ReservationCoveredHoursInLookbackPeriod'] as String?,
      resourceDetails: json['ResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['ResourceDetails'] as Map<String, dynamic>)
          : null,
      resourceId: json['ResourceId'] as String?,
      resourceUtilization: json['ResourceUtilization'] != null
          ? ResourceUtilization.fromJson(
              json['ResourceUtilization'] as Map<String, dynamic>)
          : null,
      savingsPlansCoveredHoursInLookbackPeriod:
          json['SavingsPlansCoveredHoursInLookbackPeriod'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRunningHoursInLookbackPeriod:
          json['TotalRunningHoursInLookbackPeriod'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final instanceName = this.instanceName;
    final monthlyCost = this.monthlyCost;
    final onDemandHoursInLookbackPeriod = this.onDemandHoursInLookbackPeriod;
    final reservationCoveredHoursInLookbackPeriod =
        this.reservationCoveredHoursInLookbackPeriod;
    final resourceDetails = this.resourceDetails;
    final resourceId = this.resourceId;
    final resourceUtilization = this.resourceUtilization;
    final savingsPlansCoveredHoursInLookbackPeriod =
        this.savingsPlansCoveredHoursInLookbackPeriod;
    final tags = this.tags;
    final totalRunningHoursInLookbackPeriod =
        this.totalRunningHoursInLookbackPeriod;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (instanceName != null) 'InstanceName': instanceName,
      if (monthlyCost != null) 'MonthlyCost': monthlyCost,
      if (onDemandHoursInLookbackPeriod != null)
        'OnDemandHoursInLookbackPeriod': onDemandHoursInLookbackPeriod,
      if (reservationCoveredHoursInLookbackPeriod != null)
        'ReservationCoveredHoursInLookbackPeriod':
            reservationCoveredHoursInLookbackPeriod,
      if (resourceDetails != null) 'ResourceDetails': resourceDetails,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceUtilization != null)
        'ResourceUtilization': resourceUtilization,
      if (savingsPlansCoveredHoursInLookbackPeriod != null)
        'SavingsPlansCoveredHoursInLookbackPeriod':
            savingsPlansCoveredHoursInLookbackPeriod,
      if (tags != null) 'Tags': tags,
      if (totalRunningHoursInLookbackPeriod != null)
        'TotalRunningHoursInLookbackPeriod': totalRunningHoursInLookbackPeriod,
    };
  }
}

/// The time period of the request.
class DateInterval {
  /// The end of the time period. The end date is exclusive. For example, if
  /// <code>end</code> is <code>2017-05-01</code>, Amazon Web Services retrieves
  /// cost and usage data from the start date up to, but not including,
  /// <code>2017-05-01</code>.
  final String end;

  /// The beginning of the time period. The start date is inclusive. For example,
  /// if <code>start</code> is <code>2017-01-01</code>, Amazon Web Services
  /// retrieves cost and usage data starting at <code>2017-01-01</code> up to the
  /// end date. The start date must be equal to or no later than the current date
  /// to avoid a validation error.
  final String start;

  DateInterval({
    required this.end,
    required this.start,
  });

  factory DateInterval.fromJson(Map<String, dynamic> json) {
    return DateInterval(
      end: json['End'] as String,
      start: json['Start'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'End': end,
      'Start': start,
    };
  }
}

class DeleteAnomalyMonitorResponse {
  DeleteAnomalyMonitorResponse();

  factory DeleteAnomalyMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAnomalyMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAnomalySubscriptionResponse {
  DeleteAnomalySubscriptionResponse();

  factory DeleteAnomalySubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAnomalySubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCostCategoryDefinitionResponse {
  /// The unique identifier for your Cost Category.
  final String? costCategoryArn;

  /// The effective end date of the Cost Category as a result of deleting it. No
  /// costs after this date is categorized by the deleted Cost Category.
  final String? effectiveEnd;

  DeleteCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveEnd,
  });

  factory DeleteCostCategoryDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCostCategoryDefinitionResponse(
      costCategoryArn: json['CostCategoryArn'] as String?,
      effectiveEnd: json['EffectiveEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryArn = this.costCategoryArn;
    final effectiveEnd = this.effectiveEnd;
    return {
      if (costCategoryArn != null) 'CostCategoryArn': costCategoryArn,
      if (effectiveEnd != null) 'EffectiveEnd': effectiveEnd,
    };
  }
}

class DescribeCostCategoryDefinitionResponse {
  final CostCategory? costCategory;

  DescribeCostCategoryDefinitionResponse({
    this.costCategory,
  });

  factory DescribeCostCategoryDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCostCategoryDefinitionResponse(
      costCategory: json['CostCategory'] != null
          ? CostCategory.fromJson(json['CostCategory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategory = this.costCategory;
    return {
      if (costCategory != null) 'CostCategory': costCategory,
    };
  }
}

enum Dimension {
  az,
  instanceType,
  linkedAccount,
  linkedAccountName,
  operation,
  purchaseType,
  region,
  service,
  serviceCode,
  usageType,
  usageTypeGroup,
  recordType,
  operatingSystem,
  tenancy,
  scope,
  platform,
  subscriptionId,
  legalEntityName,
  deploymentOption,
  databaseEngine,
  cacheEngine,
  instanceTypeFamily,
  billingEntity,
  reservationId,
  resourceId,
  rightsizingType,
  savingsPlansType,
  savingsPlanArn,
  paymentOption,
  agreementEndDateTimeAfter,
  agreementEndDateTimeBefore,
  invoicingEntity,
  anomalyTotalImpactAbsolute,
  anomalyTotalImpactPercentage,
}

extension DimensionValueExtension on Dimension {
  String toValue() {
    switch (this) {
      case Dimension.az:
        return 'AZ';
      case Dimension.instanceType:
        return 'INSTANCE_TYPE';
      case Dimension.linkedAccount:
        return 'LINKED_ACCOUNT';
      case Dimension.linkedAccountName:
        return 'LINKED_ACCOUNT_NAME';
      case Dimension.operation:
        return 'OPERATION';
      case Dimension.purchaseType:
        return 'PURCHASE_TYPE';
      case Dimension.region:
        return 'REGION';
      case Dimension.service:
        return 'SERVICE';
      case Dimension.serviceCode:
        return 'SERVICE_CODE';
      case Dimension.usageType:
        return 'USAGE_TYPE';
      case Dimension.usageTypeGroup:
        return 'USAGE_TYPE_GROUP';
      case Dimension.recordType:
        return 'RECORD_TYPE';
      case Dimension.operatingSystem:
        return 'OPERATING_SYSTEM';
      case Dimension.tenancy:
        return 'TENANCY';
      case Dimension.scope:
        return 'SCOPE';
      case Dimension.platform:
        return 'PLATFORM';
      case Dimension.subscriptionId:
        return 'SUBSCRIPTION_ID';
      case Dimension.legalEntityName:
        return 'LEGAL_ENTITY_NAME';
      case Dimension.deploymentOption:
        return 'DEPLOYMENT_OPTION';
      case Dimension.databaseEngine:
        return 'DATABASE_ENGINE';
      case Dimension.cacheEngine:
        return 'CACHE_ENGINE';
      case Dimension.instanceTypeFamily:
        return 'INSTANCE_TYPE_FAMILY';
      case Dimension.billingEntity:
        return 'BILLING_ENTITY';
      case Dimension.reservationId:
        return 'RESERVATION_ID';
      case Dimension.resourceId:
        return 'RESOURCE_ID';
      case Dimension.rightsizingType:
        return 'RIGHTSIZING_TYPE';
      case Dimension.savingsPlansType:
        return 'SAVINGS_PLANS_TYPE';
      case Dimension.savingsPlanArn:
        return 'SAVINGS_PLAN_ARN';
      case Dimension.paymentOption:
        return 'PAYMENT_OPTION';
      case Dimension.agreementEndDateTimeAfter:
        return 'AGREEMENT_END_DATE_TIME_AFTER';
      case Dimension.agreementEndDateTimeBefore:
        return 'AGREEMENT_END_DATE_TIME_BEFORE';
      case Dimension.invoicingEntity:
        return 'INVOICING_ENTITY';
      case Dimension.anomalyTotalImpactAbsolute:
        return 'ANOMALY_TOTAL_IMPACT_ABSOLUTE';
      case Dimension.anomalyTotalImpactPercentage:
        return 'ANOMALY_TOTAL_IMPACT_PERCENTAGE';
    }
  }
}

extension DimensionFromString on String {
  Dimension toDimension() {
    switch (this) {
      case 'AZ':
        return Dimension.az;
      case 'INSTANCE_TYPE':
        return Dimension.instanceType;
      case 'LINKED_ACCOUNT':
        return Dimension.linkedAccount;
      case 'LINKED_ACCOUNT_NAME':
        return Dimension.linkedAccountName;
      case 'OPERATION':
        return Dimension.operation;
      case 'PURCHASE_TYPE':
        return Dimension.purchaseType;
      case 'REGION':
        return Dimension.region;
      case 'SERVICE':
        return Dimension.service;
      case 'SERVICE_CODE':
        return Dimension.serviceCode;
      case 'USAGE_TYPE':
        return Dimension.usageType;
      case 'USAGE_TYPE_GROUP':
        return Dimension.usageTypeGroup;
      case 'RECORD_TYPE':
        return Dimension.recordType;
      case 'OPERATING_SYSTEM':
        return Dimension.operatingSystem;
      case 'TENANCY':
        return Dimension.tenancy;
      case 'SCOPE':
        return Dimension.scope;
      case 'PLATFORM':
        return Dimension.platform;
      case 'SUBSCRIPTION_ID':
        return Dimension.subscriptionId;
      case 'LEGAL_ENTITY_NAME':
        return Dimension.legalEntityName;
      case 'DEPLOYMENT_OPTION':
        return Dimension.deploymentOption;
      case 'DATABASE_ENGINE':
        return Dimension.databaseEngine;
      case 'CACHE_ENGINE':
        return Dimension.cacheEngine;
      case 'INSTANCE_TYPE_FAMILY':
        return Dimension.instanceTypeFamily;
      case 'BILLING_ENTITY':
        return Dimension.billingEntity;
      case 'RESERVATION_ID':
        return Dimension.reservationId;
      case 'RESOURCE_ID':
        return Dimension.resourceId;
      case 'RIGHTSIZING_TYPE':
        return Dimension.rightsizingType;
      case 'SAVINGS_PLANS_TYPE':
        return Dimension.savingsPlansType;
      case 'SAVINGS_PLAN_ARN':
        return Dimension.savingsPlanArn;
      case 'PAYMENT_OPTION':
        return Dimension.paymentOption;
      case 'AGREEMENT_END_DATE_TIME_AFTER':
        return Dimension.agreementEndDateTimeAfter;
      case 'AGREEMENT_END_DATE_TIME_BEFORE':
        return Dimension.agreementEndDateTimeBefore;
      case 'INVOICING_ENTITY':
        return Dimension.invoicingEntity;
      case 'ANOMALY_TOTAL_IMPACT_ABSOLUTE':
        return Dimension.anomalyTotalImpactAbsolute;
      case 'ANOMALY_TOTAL_IMPACT_PERCENTAGE':
        return Dimension.anomalyTotalImpactPercentage;
    }
    throw Exception('$this is not known in enum Dimension');
  }
}

/// The metadata that you can use to filter and group your results. You can use
/// <code>GetDimensionValues</code> to find specific values.
class DimensionValues {
  /// The names of the metadata types that you can use to filter and group your
  /// results. For example, <code>AZ</code> returns a list of Availability Zones.
  ///
  /// Not all dimensions are supported in each API. Refer to the documentation for
  /// each specific API to see what is supported.
  ///
  /// <code>LINK_ACCOUNT_NAME</code> and <code>SERVICE_CODE</code> can only be
  /// used in <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule</a>.
  ///
  /// <code>ANOMALY_TOTAL_IMPACT_ABSOLUTE</code> and
  /// <code>ANOMALY_TOTAL_IMPACT_PERCENTAGE</code> can only be used in <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html">AnomalySubscriptions</a>.
  final Dimension? key;

  /// The match options that you can use to filter your results.
  ///
  /// <code>MatchOptions</code> is only applicable for actions related to Cost
  /// Category and Anomaly Subscriptions. Refer to the documentation for each
  /// specific API to see what is supported.
  ///
  /// The default values for <code>MatchOptions</code> are <code>EQUALS</code> and
  /// <code>CASE_SENSITIVE</code>.
  final List<MatchOption>? matchOptions;

  /// The metadata values that you can use to filter and group your results. You
  /// can use <code>GetDimensionValues</code> to find specific values.
  final List<String>? values;

  DimensionValues({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory DimensionValues.fromJson(Map<String, dynamic> json) {
    return DimensionValues(
      key: (json['Key'] as String?)?.toDimension(),
      matchOptions: (json['MatchOptions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMatchOption())
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'Key': key.toValue(),
      if (matchOptions != null)
        'MatchOptions': matchOptions.map((e) => e.toValue()).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// The metadata of a specific type that you can use to filter and group your
/// results. You can use <code>GetDimensionValues</code> to find specific
/// values.
class DimensionValuesWithAttributes {
  /// The attribute that applies to a specific <code>Dimension</code>.
  final Map<String, String>? attributes;

  /// The value of a dimension with a specific attribute.
  final String? value;

  DimensionValuesWithAttributes({
    this.attributes,
    this.value,
  });

  factory DimensionValuesWithAttributes.fromJson(Map<String, dynamic> json) {
    return DimensionValuesWithAttributes(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final value = this.value;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (value != null) 'Value': value,
    };
  }
}

/// The field that contains a list of disk (local storage) metrics that are
/// associated with the current instance.
class DiskResourceUtilization {
  /// The maximum read throughput operations per second.
  final String? diskReadBytesPerSecond;

  /// The maximum number of read operations per second.
  final String? diskReadOpsPerSecond;

  /// The maximum write throughput operations per second.
  final String? diskWriteBytesPerSecond;

  /// The maximum number of write operations per second.
  final String? diskWriteOpsPerSecond;

  DiskResourceUtilization({
    this.diskReadBytesPerSecond,
    this.diskReadOpsPerSecond,
    this.diskWriteBytesPerSecond,
    this.diskWriteOpsPerSecond,
  });

  factory DiskResourceUtilization.fromJson(Map<String, dynamic> json) {
    return DiskResourceUtilization(
      diskReadBytesPerSecond: json['DiskReadBytesPerSecond'] as String?,
      diskReadOpsPerSecond: json['DiskReadOpsPerSecond'] as String?,
      diskWriteBytesPerSecond: json['DiskWriteBytesPerSecond'] as String?,
      diskWriteOpsPerSecond: json['DiskWriteOpsPerSecond'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskReadBytesPerSecond = this.diskReadBytesPerSecond;
    final diskReadOpsPerSecond = this.diskReadOpsPerSecond;
    final diskWriteBytesPerSecond = this.diskWriteBytesPerSecond;
    final diskWriteOpsPerSecond = this.diskWriteOpsPerSecond;
    return {
      if (diskReadBytesPerSecond != null)
        'DiskReadBytesPerSecond': diskReadBytesPerSecond,
      if (diskReadOpsPerSecond != null)
        'DiskReadOpsPerSecond': diskReadOpsPerSecond,
      if (diskWriteBytesPerSecond != null)
        'DiskWriteBytesPerSecond': diskWriteBytesPerSecond,
      if (diskWriteOpsPerSecond != null)
        'DiskWriteOpsPerSecond': diskWriteOpsPerSecond,
    };
  }
}

/// The EBS field that contains a list of EBS metrics that are associated with
/// the current instance.
class EBSResourceUtilization {
  /// The maximum size of read operations per second
  final String? ebsReadBytesPerSecond;

  /// The maximum number of read operations per second.
  final String? ebsReadOpsPerSecond;

  /// The maximum size of write operations per second.
  final String? ebsWriteBytesPerSecond;

  /// The maximum number of write operations per second.
  final String? ebsWriteOpsPerSecond;

  EBSResourceUtilization({
    this.ebsReadBytesPerSecond,
    this.ebsReadOpsPerSecond,
    this.ebsWriteBytesPerSecond,
    this.ebsWriteOpsPerSecond,
  });

  factory EBSResourceUtilization.fromJson(Map<String, dynamic> json) {
    return EBSResourceUtilization(
      ebsReadBytesPerSecond: json['EbsReadBytesPerSecond'] as String?,
      ebsReadOpsPerSecond: json['EbsReadOpsPerSecond'] as String?,
      ebsWriteBytesPerSecond: json['EbsWriteBytesPerSecond'] as String?,
      ebsWriteOpsPerSecond: json['EbsWriteOpsPerSecond'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsReadBytesPerSecond = this.ebsReadBytesPerSecond;
    final ebsReadOpsPerSecond = this.ebsReadOpsPerSecond;
    final ebsWriteBytesPerSecond = this.ebsWriteBytesPerSecond;
    final ebsWriteOpsPerSecond = this.ebsWriteOpsPerSecond;
    return {
      if (ebsReadBytesPerSecond != null)
        'EbsReadBytesPerSecond': ebsReadBytesPerSecond,
      if (ebsReadOpsPerSecond != null)
        'EbsReadOpsPerSecond': ebsReadOpsPerSecond,
      if (ebsWriteBytesPerSecond != null)
        'EbsWriteBytesPerSecond': ebsWriteBytesPerSecond,
      if (ebsWriteOpsPerSecond != null)
        'EbsWriteOpsPerSecond': ebsWriteOpsPerSecond,
    };
  }
}

/// Details about the Amazon EC2 reservations that Amazon Web Services
/// recommends that you purchase.
class EC2InstanceDetails {
  /// The Availability Zone of the recommended reservation.
  final String? availabilityZone;

  /// Determines whether the recommendation is for a current-generation instance.
  final bool? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? family;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// The platform of the recommended reservation. The platform is the specific
  /// combination of operating system, license model, and software on an instance.
  final String? platform;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  /// Determines whether the recommended reservation is dedicated or shared.
  final String? tenancy;

  EC2InstanceDetails({
    this.availabilityZone,
    this.currentGeneration,
    this.family,
    this.instanceType,
    this.platform,
    this.region,
    this.sizeFlexEligible,
    this.tenancy,
  });

  factory EC2InstanceDetails.fromJson(Map<String, dynamic> json) {
    return EC2InstanceDetails(
      availabilityZone: json['AvailabilityZone'] as String?,
      currentGeneration: json['CurrentGeneration'] as bool?,
      family: json['Family'] as String?,
      instanceType: json['InstanceType'] as String?,
      platform: json['Platform'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
      tenancy: json['Tenancy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final currentGeneration = this.currentGeneration;
    final family = this.family;
    final instanceType = this.instanceType;
    final platform = this.platform;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    final tenancy = this.tenancy;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (family != null) 'Family': family,
      if (instanceType != null) 'InstanceType': instanceType,
      if (platform != null) 'Platform': platform,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
      if (tenancy != null) 'Tenancy': tenancy,
    };
  }
}

/// Details on the Amazon EC2 Resource.
class EC2ResourceDetails {
  /// The hourly public On-Demand rate for the instance type.
  final String? hourlyOnDemandRate;

  /// The type of Amazon Web Services instance.
  final String? instanceType;

  /// The memory capacity of the Amazon Web Services instance.
  final String? memory;

  /// The network performance capacity of the Amazon Web Services instance.
  final String? networkPerformance;

  /// The platform of the Amazon Web Services instance. The platform is the
  /// specific combination of operating system, license model, and software on an
  /// instance.
  final String? platform;

  /// The Amazon Web Services Region of the instance.
  final String? region;

  /// The SKU of the product.
  final String? sku;

  /// The disk storage of the Amazon Web Services instance. This doesn't include
  /// EBS storage.
  final String? storage;

  /// The number of VCPU cores in the Amazon Web Services instance type.
  final String? vcpu;

  EC2ResourceDetails({
    this.hourlyOnDemandRate,
    this.instanceType,
    this.memory,
    this.networkPerformance,
    this.platform,
    this.region,
    this.sku,
    this.storage,
    this.vcpu,
  });

  factory EC2ResourceDetails.fromJson(Map<String, dynamic> json) {
    return EC2ResourceDetails(
      hourlyOnDemandRate: json['HourlyOnDemandRate'] as String?,
      instanceType: json['InstanceType'] as String?,
      memory: json['Memory'] as String?,
      networkPerformance: json['NetworkPerformance'] as String?,
      platform: json['Platform'] as String?,
      region: json['Region'] as String?,
      sku: json['Sku'] as String?,
      storage: json['Storage'] as String?,
      vcpu: json['Vcpu'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hourlyOnDemandRate = this.hourlyOnDemandRate;
    final instanceType = this.instanceType;
    final memory = this.memory;
    final networkPerformance = this.networkPerformance;
    final platform = this.platform;
    final region = this.region;
    final sku = this.sku;
    final storage = this.storage;
    final vcpu = this.vcpu;
    return {
      if (hourlyOnDemandRate != null) 'HourlyOnDemandRate': hourlyOnDemandRate,
      if (instanceType != null) 'InstanceType': instanceType,
      if (memory != null) 'Memory': memory,
      if (networkPerformance != null) 'NetworkPerformance': networkPerformance,
      if (platform != null) 'Platform': platform,
      if (region != null) 'Region': region,
      if (sku != null) 'Sku': sku,
      if (storage != null) 'Storage': storage,
      if (vcpu != null) 'Vcpu': vcpu,
    };
  }
}

/// Utilization metrics for the instance.
class EC2ResourceUtilization {
  /// The field that contains a list of disk (local storage) metrics that are
  /// associated with the current instance.
  final DiskResourceUtilization? diskResourceUtilization;

  /// The EBS field that contains a list of EBS metrics that are associated with
  /// the current instance.
  final EBSResourceUtilization? eBSResourceUtilization;

  /// The maximum observed or expected CPU utilization of the instance.
  final String? maxCpuUtilizationPercentage;

  /// The maximum observed or expected memory utilization of the instance.
  final String? maxMemoryUtilizationPercentage;

  /// The maximum observed or expected storage utilization of the instance. This
  /// doesn't include EBS storage.
  final String? maxStorageUtilizationPercentage;

  /// The network field that contains a list of network metrics that are
  /// associated with the current instance.
  final NetworkResourceUtilization? networkResourceUtilization;

  EC2ResourceUtilization({
    this.diskResourceUtilization,
    this.eBSResourceUtilization,
    this.maxCpuUtilizationPercentage,
    this.maxMemoryUtilizationPercentage,
    this.maxStorageUtilizationPercentage,
    this.networkResourceUtilization,
  });

  factory EC2ResourceUtilization.fromJson(Map<String, dynamic> json) {
    return EC2ResourceUtilization(
      diskResourceUtilization: json['DiskResourceUtilization'] != null
          ? DiskResourceUtilization.fromJson(
              json['DiskResourceUtilization'] as Map<String, dynamic>)
          : null,
      eBSResourceUtilization: json['EBSResourceUtilization'] != null
          ? EBSResourceUtilization.fromJson(
              json['EBSResourceUtilization'] as Map<String, dynamic>)
          : null,
      maxCpuUtilizationPercentage:
          json['MaxCpuUtilizationPercentage'] as String?,
      maxMemoryUtilizationPercentage:
          json['MaxMemoryUtilizationPercentage'] as String?,
      maxStorageUtilizationPercentage:
          json['MaxStorageUtilizationPercentage'] as String?,
      networkResourceUtilization: json['NetworkResourceUtilization'] != null
          ? NetworkResourceUtilization.fromJson(
              json['NetworkResourceUtilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final diskResourceUtilization = this.diskResourceUtilization;
    final eBSResourceUtilization = this.eBSResourceUtilization;
    final maxCpuUtilizationPercentage = this.maxCpuUtilizationPercentage;
    final maxMemoryUtilizationPercentage = this.maxMemoryUtilizationPercentage;
    final maxStorageUtilizationPercentage =
        this.maxStorageUtilizationPercentage;
    final networkResourceUtilization = this.networkResourceUtilization;
    return {
      if (diskResourceUtilization != null)
        'DiskResourceUtilization': diskResourceUtilization,
      if (eBSResourceUtilization != null)
        'EBSResourceUtilization': eBSResourceUtilization,
      if (maxCpuUtilizationPercentage != null)
        'MaxCpuUtilizationPercentage': maxCpuUtilizationPercentage,
      if (maxMemoryUtilizationPercentage != null)
        'MaxMemoryUtilizationPercentage': maxMemoryUtilizationPercentage,
      if (maxStorageUtilizationPercentage != null)
        'MaxStorageUtilizationPercentage': maxStorageUtilizationPercentage,
      if (networkResourceUtilization != null)
        'NetworkResourceUtilization': networkResourceUtilization,
    };
  }
}

/// The Amazon EC2 hardware specifications that you want Amazon Web Services to
/// provide recommendations for.
class EC2Specification {
  /// Indicates whether you want a recommendation for standard or convertible
  /// reservations.
  final OfferingClass? offeringClass;

  EC2Specification({
    this.offeringClass,
  });

  factory EC2Specification.fromJson(Map<String, dynamic> json) {
    return EC2Specification(
      offeringClass: (json['OfferingClass'] as String?)?.toOfferingClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final offeringClass = this.offeringClass;
    return {
      if (offeringClass != null) 'OfferingClass': offeringClass.toValue(),
    };
  }
}

/// Details about the Amazon OpenSearch Service reservations that Amazon Web
/// Services recommends that you purchase.
class ESInstanceDetails {
  /// Determines whether the recommendation is for a current-generation instance.
  final bool? currentGeneration;

  /// The class of instance that Amazon Web Services recommends.
  final String? instanceClass;

  /// The size of instance that Amazon Web Services recommends.
  final String? instanceSize;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  ESInstanceDetails({
    this.currentGeneration,
    this.instanceClass,
    this.instanceSize,
    this.region,
    this.sizeFlexEligible,
  });

  factory ESInstanceDetails.fromJson(Map<String, dynamic> json) {
    return ESInstanceDetails(
      currentGeneration: json['CurrentGeneration'] as bool?,
      instanceClass: json['InstanceClass'] as String?,
      instanceSize: json['InstanceSize'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentGeneration = this.currentGeneration;
    final instanceClass = this.instanceClass;
    final instanceSize = this.instanceSize;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    return {
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (instanceClass != null) 'InstanceClass': instanceClass,
      if (instanceSize != null) 'InstanceSize': instanceSize,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
    };
  }
}

/// Details about the Amazon ElastiCache reservations that Amazon Web Services
/// recommends that you purchase.
class ElastiCacheInstanceDetails {
  /// Determines whether the recommendation is for a current generation instance.
  final bool? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? family;

  /// The type of node that Amazon Web Services recommends.
  final String? nodeType;

  /// The description of the recommended reservation.
  final String? productDescription;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  ElastiCacheInstanceDetails({
    this.currentGeneration,
    this.family,
    this.nodeType,
    this.productDescription,
    this.region,
    this.sizeFlexEligible,
  });

  factory ElastiCacheInstanceDetails.fromJson(Map<String, dynamic> json) {
    return ElastiCacheInstanceDetails(
      currentGeneration: json['CurrentGeneration'] as bool?,
      family: json['Family'] as String?,
      nodeType: json['NodeType'] as String?,
      productDescription: json['ProductDescription'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentGeneration = this.currentGeneration;
    final family = this.family;
    final nodeType = this.nodeType;
    final productDescription = this.productDescription;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    return {
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (family != null) 'Family': family,
      if (nodeType != null) 'NodeType': nodeType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
    };
  }
}

/// Use <code>Expression</code> to filter in various Cost Explorer APIs.
///
/// Not all <code>Expression</code> types are supported in each API. Refer to
/// the documentation for each specific API to see what is supported.
///
/// There are two patterns:
///
/// <ul>
/// <li>
/// Simple dimension values.
///
/// <ul>
/// <li>
/// There are three types of simple dimension values:
/// <code>CostCategories</code>, <code>Tags</code>, and <code>Dimensions</code>.
///
/// <ul>
/// <li>
/// Specify the <code>CostCategories</code> field to define a filter that acts
/// on Cost Categories.
/// </li>
/// <li>
/// Specify the <code>Tags</code> field to define a filter that acts on Cost
/// Allocation Tags.
/// </li>
/// <li>
/// Specify the <code>Dimensions</code> field to define a filter that acts on
/// the <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_DimensionValues.html">
/// <code>DimensionValues</code> </a>.
/// </li>
/// </ul> </li>
/// <li>
/// For each filter type, you can set the dimension name and values for the
/// filters that you plan to use.
///
/// <ul>
/// <li>
/// For example, you can filter for <code>REGION==us-east-1 OR
/// REGION==us-west-1</code>. For <code>GetRightsizingRecommendation</code>, the
/// Region is a full name (for example, <code>REGION==US East (N.
/// Virginia)</code>.
/// </li>
/// <li>
/// The corresponding <code>Expression</code> for this example is as follows:
/// <code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1",
/// "us-west-1" ] } }</code>
/// </li>
/// <li>
/// As shown in the previous example, lists of dimension values are combined
/// with <code>OR</code> when applying the filter.
/// </li>
/// </ul> </li>
/// <li>
/// You can also set different match options to further control how the filter
/// behaves. Not all APIs support match options. Refer to the documentation for
/// each specific API to see what is supported.
///
/// <ul>
/// <li>
/// For example, you can filter for linked account names that start with "a".
/// </li>
/// <li>
/// The corresponding <code>Expression</code> for this example is as follows:
/// <code>{ "Dimensions": { "Key": "LINKED_ACCOUNT_NAME", "MatchOptions": [
/// "STARTS_WITH" ], "Values": [ "a" ] } }</code>
/// </li>
/// </ul> </li>
/// </ul> </li>
/// <li>
/// Compound <code>Expression</code> types with logical operations.
///
/// <ul>
/// <li>
/// You can use multiple <code>Expression</code> types and the logical operators
/// <code>AND/OR/NOT</code> to create a list of one or more
/// <code>Expression</code> objects. By doing this, you can filter by more
/// advanced options.
/// </li>
/// <li>
/// For example, you can filter by <code>((REGION == us-east-1 OR REGION ==
/// us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE != DataTransfer)</code>.
/// </li>
/// <li>
/// The corresponding <code>Expression</code> for this example is as follows:
/// <code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [
/// "us-east-1", "us-west-1" ] }}, {"Tags": { "Key": "TagName", "Values":
/// ["Value1"] } } ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values":
/// ["DataTransfer"] }}} ] } </code>
/// </li>
/// </ul> <note>
/// Because each <code>Expression</code> can have only one operator, the service
/// returns an error if more than one is specified. The following example shows
/// an <code>Expression</code> object that creates an error: <code> { "And": [
/// ... ], "Dimensions": { "Key": "USAGE_TYPE", "Values": [ "DataTransfer" ] } }
/// </code>
///
/// The following is an example of the corresponding error message:
/// <code>"Expression has more than one roots. Only one root operator is allowed
/// for each expression: And, Or, Not, Dimensions, Tags, CostCategories"</code>
/// </note> </li>
/// </ul> <note>
/// For the <code>GetRightsizingRecommendation</code> action, a combination of
/// OR and NOT isn't supported. OR isn't supported between different dimensions,
/// or dimensions and tags. NOT operators aren't supported. Dimensions are also
/// limited to <code>LINKED_ACCOUNT</code>, <code>REGION</code>, or
/// <code>RIGHTSIZING_TYPE</code>.
///
/// For the <code>GetReservationPurchaseRecommendation</code> action, only NOT
/// is supported. AND and OR aren't supported. Dimensions are limited to
/// <code>LINKED_ACCOUNT</code>.
/// </note>
class Expression {
  /// Return results that match both <code>Dimension</code> objects.
  final List<Expression>? and;

  /// The filter that's based on <code>CostCategory</code> values.
  final CostCategoryValues? costCategories;

  /// The specific <code>Dimension</code> to use for <code>Expression</code>.
  final DimensionValues? dimensions;

  /// Return results that don't match a <code>Dimension</code> object.
  final Expression? not;

  /// Return results that match either <code>Dimension</code> object.
  final List<Expression>? or;

  /// The specific <code>Tag</code> to use for <code>Expression</code>.
  final TagValues? tags;

  Expression({
    this.and,
    this.costCategories,
    this.dimensions,
    this.not,
    this.or,
    this.tags,
  });

  factory Expression.fromJson(Map<String, dynamic> json) {
    return Expression(
      and: (json['And'] as List?)
          ?.whereNotNull()
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      costCategories: json['CostCategories'] != null
          ? CostCategoryValues.fromJson(
              json['CostCategories'] as Map<String, dynamic>)
          : null,
      dimensions: json['Dimensions'] != null
          ? DimensionValues.fromJson(json['Dimensions'] as Map<String, dynamic>)
          : null,
      not: json['Not'] != null
          ? Expression.fromJson(json['Not'] as Map<String, dynamic>)
          : null,
      or: (json['Or'] as List?)
          ?.whereNotNull()
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: json['Tags'] != null
          ? TagValues.fromJson(json['Tags'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final costCategories = this.costCategories;
    final dimensions = this.dimensions;
    final not = this.not;
    final or = this.or;
    final tags = this.tags;
    return {
      if (and != null) 'And': and,
      if (costCategories != null) 'CostCategories': costCategories,
      if (dimensions != null) 'Dimensions': dimensions,
      if (not != null) 'Not': not,
      if (or != null) 'Or': or,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum FindingReasonCode {
  cpuOverProvisioned,
  cpuUnderProvisioned,
  memoryOverProvisioned,
  memoryUnderProvisioned,
  ebsThroughputOverProvisioned,
  ebsThroughputUnderProvisioned,
  ebsIopsOverProvisioned,
  ebsIopsUnderProvisioned,
  networkBandwidthOverProvisioned,
  networkBandwidthUnderProvisioned,
  networkPpsOverProvisioned,
  networkPpsUnderProvisioned,
  diskIopsOverProvisioned,
  diskIopsUnderProvisioned,
  diskThroughputOverProvisioned,
  diskThroughputUnderProvisioned,
}

extension FindingReasonCodeValueExtension on FindingReasonCode {
  String toValue() {
    switch (this) {
      case FindingReasonCode.cpuOverProvisioned:
        return 'CPU_OVER_PROVISIONED';
      case FindingReasonCode.cpuUnderProvisioned:
        return 'CPU_UNDER_PROVISIONED';
      case FindingReasonCode.memoryOverProvisioned:
        return 'MEMORY_OVER_PROVISIONED';
      case FindingReasonCode.memoryUnderProvisioned:
        return 'MEMORY_UNDER_PROVISIONED';
      case FindingReasonCode.ebsThroughputOverProvisioned:
        return 'EBS_THROUGHPUT_OVER_PROVISIONED';
      case FindingReasonCode.ebsThroughputUnderProvisioned:
        return 'EBS_THROUGHPUT_UNDER_PROVISIONED';
      case FindingReasonCode.ebsIopsOverProvisioned:
        return 'EBS_IOPS_OVER_PROVISIONED';
      case FindingReasonCode.ebsIopsUnderProvisioned:
        return 'EBS_IOPS_UNDER_PROVISIONED';
      case FindingReasonCode.networkBandwidthOverProvisioned:
        return 'NETWORK_BANDWIDTH_OVER_PROVISIONED';
      case FindingReasonCode.networkBandwidthUnderProvisioned:
        return 'NETWORK_BANDWIDTH_UNDER_PROVISIONED';
      case FindingReasonCode.networkPpsOverProvisioned:
        return 'NETWORK_PPS_OVER_PROVISIONED';
      case FindingReasonCode.networkPpsUnderProvisioned:
        return 'NETWORK_PPS_UNDER_PROVISIONED';
      case FindingReasonCode.diskIopsOverProvisioned:
        return 'DISK_IOPS_OVER_PROVISIONED';
      case FindingReasonCode.diskIopsUnderProvisioned:
        return 'DISK_IOPS_UNDER_PROVISIONED';
      case FindingReasonCode.diskThroughputOverProvisioned:
        return 'DISK_THROUGHPUT_OVER_PROVISIONED';
      case FindingReasonCode.diskThroughputUnderProvisioned:
        return 'DISK_THROUGHPUT_UNDER_PROVISIONED';
    }
  }
}

extension FindingReasonCodeFromString on String {
  FindingReasonCode toFindingReasonCode() {
    switch (this) {
      case 'CPU_OVER_PROVISIONED':
        return FindingReasonCode.cpuOverProvisioned;
      case 'CPU_UNDER_PROVISIONED':
        return FindingReasonCode.cpuUnderProvisioned;
      case 'MEMORY_OVER_PROVISIONED':
        return FindingReasonCode.memoryOverProvisioned;
      case 'MEMORY_UNDER_PROVISIONED':
        return FindingReasonCode.memoryUnderProvisioned;
      case 'EBS_THROUGHPUT_OVER_PROVISIONED':
        return FindingReasonCode.ebsThroughputOverProvisioned;
      case 'EBS_THROUGHPUT_UNDER_PROVISIONED':
        return FindingReasonCode.ebsThroughputUnderProvisioned;
      case 'EBS_IOPS_OVER_PROVISIONED':
        return FindingReasonCode.ebsIopsOverProvisioned;
      case 'EBS_IOPS_UNDER_PROVISIONED':
        return FindingReasonCode.ebsIopsUnderProvisioned;
      case 'NETWORK_BANDWIDTH_OVER_PROVISIONED':
        return FindingReasonCode.networkBandwidthOverProvisioned;
      case 'NETWORK_BANDWIDTH_UNDER_PROVISIONED':
        return FindingReasonCode.networkBandwidthUnderProvisioned;
      case 'NETWORK_PPS_OVER_PROVISIONED':
        return FindingReasonCode.networkPpsOverProvisioned;
      case 'NETWORK_PPS_UNDER_PROVISIONED':
        return FindingReasonCode.networkPpsUnderProvisioned;
      case 'DISK_IOPS_OVER_PROVISIONED':
        return FindingReasonCode.diskIopsOverProvisioned;
      case 'DISK_IOPS_UNDER_PROVISIONED':
        return FindingReasonCode.diskIopsUnderProvisioned;
      case 'DISK_THROUGHPUT_OVER_PROVISIONED':
        return FindingReasonCode.diskThroughputOverProvisioned;
      case 'DISK_THROUGHPUT_UNDER_PROVISIONED':
        return FindingReasonCode.diskThroughputUnderProvisioned;
    }
    throw Exception('$this is not known in enum FindingReasonCode');
  }
}

/// The forecast that's created for your query.
class ForecastResult {
  /// The mean value of the forecast.
  final String? meanValue;

  /// The lower limit for the prediction interval.
  final String? predictionIntervalLowerBound;

  /// The upper limit for the prediction interval.
  final String? predictionIntervalUpperBound;

  /// The period of time that the forecast covers.
  final DateInterval? timePeriod;

  ForecastResult({
    this.meanValue,
    this.predictionIntervalLowerBound,
    this.predictionIntervalUpperBound,
    this.timePeriod,
  });

  factory ForecastResult.fromJson(Map<String, dynamic> json) {
    return ForecastResult(
      meanValue: json['MeanValue'] as String?,
      predictionIntervalLowerBound:
          json['PredictionIntervalLowerBound'] as String?,
      predictionIntervalUpperBound:
          json['PredictionIntervalUpperBound'] as String?,
      timePeriod: json['TimePeriod'] != null
          ? DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meanValue = this.meanValue;
    final predictionIntervalLowerBound = this.predictionIntervalLowerBound;
    final predictionIntervalUpperBound = this.predictionIntervalUpperBound;
    final timePeriod = this.timePeriod;
    return {
      if (meanValue != null) 'MeanValue': meanValue,
      if (predictionIntervalLowerBound != null)
        'PredictionIntervalLowerBound': predictionIntervalLowerBound,
      if (predictionIntervalUpperBound != null)
        'PredictionIntervalUpperBound': predictionIntervalUpperBound,
      if (timePeriod != null) 'TimePeriod': timePeriod,
    };
  }
}

enum GenerationStatus {
  succeeded,
  processing,
  failed,
}

extension GenerationStatusValueExtension on GenerationStatus {
  String toValue() {
    switch (this) {
      case GenerationStatus.succeeded:
        return 'SUCCEEDED';
      case GenerationStatus.processing:
        return 'PROCESSING';
      case GenerationStatus.failed:
        return 'FAILED';
    }
  }
}

extension GenerationStatusFromString on String {
  GenerationStatus toGenerationStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return GenerationStatus.succeeded;
      case 'PROCESSING':
        return GenerationStatus.processing;
      case 'FAILED':
        return GenerationStatus.failed;
    }
    throw Exception('$this is not known in enum GenerationStatus');
  }
}

/// The summary of the Savings Plans recommendation generation.
class GenerationSummary {
  /// Indicates the estimated time for when the recommendation generation will
  /// complete.
  final String? estimatedCompletionTime;

  /// Indicates the completion time of the recommendation generation.
  final String? generationCompletionTime;

  /// Indicates the start time of the recommendation generation.
  final String? generationStartedTime;

  /// Indicates whether the recommendation generation succeeded, is processing, or
  /// failed.
  final GenerationStatus? generationStatus;

  /// Indicates the ID for this specific recommendation.
  final String? recommendationId;

  GenerationSummary({
    this.estimatedCompletionTime,
    this.generationCompletionTime,
    this.generationStartedTime,
    this.generationStatus,
    this.recommendationId,
  });

  factory GenerationSummary.fromJson(Map<String, dynamic> json) {
    return GenerationSummary(
      estimatedCompletionTime: json['EstimatedCompletionTime'] as String?,
      generationCompletionTime: json['GenerationCompletionTime'] as String?,
      generationStartedTime: json['GenerationStartedTime'] as String?,
      generationStatus:
          (json['GenerationStatus'] as String?)?.toGenerationStatus(),
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedCompletionTime = this.estimatedCompletionTime;
    final generationCompletionTime = this.generationCompletionTime;
    final generationStartedTime = this.generationStartedTime;
    final generationStatus = this.generationStatus;
    final recommendationId = this.recommendationId;
    return {
      if (estimatedCompletionTime != null)
        'EstimatedCompletionTime': estimatedCompletionTime,
      if (generationCompletionTime != null)
        'GenerationCompletionTime': generationCompletionTime,
      if (generationStartedTime != null)
        'GenerationStartedTime': generationStartedTime,
      if (generationStatus != null)
        'GenerationStatus': generationStatus.toValue(),
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

class GetAnomaliesResponse {
  /// A list of cost anomalies.
  final List<Anomaly> anomalies;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextPageToken;

  GetAnomaliesResponse({
    required this.anomalies,
    this.nextPageToken,
  });

  factory GetAnomaliesResponse.fromJson(Map<String, dynamic> json) {
    return GetAnomaliesResponse(
      anomalies: (json['Anomalies'] as List)
          .whereNotNull()
          .map((e) => Anomaly.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalies = this.anomalies;
    final nextPageToken = this.nextPageToken;
    return {
      'Anomalies': anomalies,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetAnomalyMonitorsResponse {
  /// A list of cost anomaly monitors that includes the detailed metadata for each
  /// monitor.
  final List<AnomalyMonitor> anomalyMonitors;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextPageToken;

  GetAnomalyMonitorsResponse({
    required this.anomalyMonitors,
    this.nextPageToken,
  });

  factory GetAnomalyMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return GetAnomalyMonitorsResponse(
      anomalyMonitors: (json['AnomalyMonitors'] as List)
          .whereNotNull()
          .map((e) => AnomalyMonitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyMonitors = this.anomalyMonitors;
    final nextPageToken = this.nextPageToken;
    return {
      'AnomalyMonitors': anomalyMonitors,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetAnomalySubscriptionsResponse {
  /// A list of cost anomaly subscriptions that includes the detailed metadata for
  /// each one.
  final List<AnomalySubscription> anomalySubscriptions;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextPageToken;

  GetAnomalySubscriptionsResponse({
    required this.anomalySubscriptions,
    this.nextPageToken,
  });

  factory GetAnomalySubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return GetAnomalySubscriptionsResponse(
      anomalySubscriptions: (json['AnomalySubscriptions'] as List)
          .whereNotNull()
          .map((e) => AnomalySubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalySubscriptions = this.anomalySubscriptions;
    final nextPageToken = this.nextPageToken;
    return {
      'AnomalySubscriptions': anomalySubscriptions,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetApproximateUsageRecordsResponse {
  /// The lookback period that's used for the estimation.
  final DateInterval? lookbackPeriod;

  /// The service metadata for the service or services in the response.
  final Map<String, int>? services;

  /// The total number of usage records for all services in the services list.
  final int? totalRecords;

  GetApproximateUsageRecordsResponse({
    this.lookbackPeriod,
    this.services,
    this.totalRecords,
  });

  factory GetApproximateUsageRecordsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApproximateUsageRecordsResponse(
      lookbackPeriod: json['LookbackPeriod'] != null
          ? DateInterval.fromJson(
              json['LookbackPeriod'] as Map<String, dynamic>)
          : null,
      services: (json['Services'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      totalRecords: json['TotalRecords'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lookbackPeriod = this.lookbackPeriod;
    final services = this.services;
    final totalRecords = this.totalRecords;
    return {
      if (lookbackPeriod != null) 'LookbackPeriod': lookbackPeriod,
      if (services != null) 'Services': services,
      if (totalRecords != null) 'TotalRecords': totalRecords,
    };
  }
}

class GetCostAndUsageResponse {
  /// The attributes that apply to a specific dimension value. For example, if the
  /// value is a linked account, the attribute is that account name.
  final List<DimensionValuesWithAttributes>? dimensionValueAttributes;

  /// The groups that are specified by the <code>Filter</code> or
  /// <code>GroupBy</code> parameters in the request.
  final List<GroupDefinition>? groupDefinitions;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  /// The time period that's covered by the results in the response.
  final List<ResultByTime>? resultsByTime;

  GetCostAndUsageResponse({
    this.dimensionValueAttributes,
    this.groupDefinitions,
    this.nextPageToken,
    this.resultsByTime,
  });

  factory GetCostAndUsageResponse.fromJson(Map<String, dynamic> json) {
    return GetCostAndUsageResponse(
      dimensionValueAttributes: (json['DimensionValueAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DimensionValuesWithAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupDefinitions: (json['GroupDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
      resultsByTime: (json['ResultsByTime'] as List?)
          ?.whereNotNull()
          .map((e) => ResultByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValueAttributes = this.dimensionValueAttributes;
    final groupDefinitions = this.groupDefinitions;
    final nextPageToken = this.nextPageToken;
    final resultsByTime = this.resultsByTime;
    return {
      if (dimensionValueAttributes != null)
        'DimensionValueAttributes': dimensionValueAttributes,
      if (groupDefinitions != null) 'GroupDefinitions': groupDefinitions,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (resultsByTime != null) 'ResultsByTime': resultsByTime,
    };
  }
}

class GetCostAndUsageWithResourcesResponse {
  /// The attributes that apply to a specific dimension value. For example, if the
  /// value is a linked account, the attribute is that account name.
  final List<DimensionValuesWithAttributes>? dimensionValueAttributes;

  /// The groups that are specified by the <code>Filter</code> or
  /// <code>GroupBy</code> parameters in the request.
  final List<GroupDefinition>? groupDefinitions;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  /// The time period that's covered by the results in the response.
  final List<ResultByTime>? resultsByTime;

  GetCostAndUsageWithResourcesResponse({
    this.dimensionValueAttributes,
    this.groupDefinitions,
    this.nextPageToken,
    this.resultsByTime,
  });

  factory GetCostAndUsageWithResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCostAndUsageWithResourcesResponse(
      dimensionValueAttributes: (json['DimensionValueAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DimensionValuesWithAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupDefinitions: (json['GroupDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
      resultsByTime: (json['ResultsByTime'] as List?)
          ?.whereNotNull()
          .map((e) => ResultByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValueAttributes = this.dimensionValueAttributes;
    final groupDefinitions = this.groupDefinitions;
    final nextPageToken = this.nextPageToken;
    final resultsByTime = this.resultsByTime;
    return {
      if (dimensionValueAttributes != null)
        'DimensionValueAttributes': dimensionValueAttributes,
      if (groupDefinitions != null) 'GroupDefinitions': groupDefinitions,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (resultsByTime != null) 'ResultsByTime': resultsByTime,
    };
  }
}

class GetCostCategoriesResponse {
  /// The number of objects that are returned.
  final int returnSize;

  /// The total number of objects.
  final int totalSize;

  /// The names of the Cost Categories.
  final List<String>? costCategoryNames;

  /// The Cost Category values.
  ///
  /// If the <code>CostCategoryName</code> key isn't specified in the request, the
  /// <code>CostCategoryValues</code> fields aren't returned.
  final List<String>? costCategoryValues;

  /// If the number of objects that are still available for retrieval exceeds the
  /// quota, Amazon Web Services returns a NextPageToken value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  final String? nextPageToken;

  GetCostCategoriesResponse({
    required this.returnSize,
    required this.totalSize,
    this.costCategoryNames,
    this.costCategoryValues,
    this.nextPageToken,
  });

  factory GetCostCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetCostCategoriesResponse(
      returnSize: json['ReturnSize'] as int,
      totalSize: json['TotalSize'] as int,
      costCategoryNames: (json['CostCategoryNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      costCategoryValues: (json['CostCategoryValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnSize = this.returnSize;
    final totalSize = this.totalSize;
    final costCategoryNames = this.costCategoryNames;
    final costCategoryValues = this.costCategoryValues;
    final nextPageToken = this.nextPageToken;
    return {
      'ReturnSize': returnSize,
      'TotalSize': totalSize,
      if (costCategoryNames != null) 'CostCategoryNames': costCategoryNames,
      if (costCategoryValues != null) 'CostCategoryValues': costCategoryValues,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetCostForecastResponse {
  /// The forecasts for your query, in order. For <code>DAILY</code> forecasts,
  /// this is a list of days. For <code>MONTHLY</code> forecasts, this is a list
  /// of months.
  final List<ForecastResult>? forecastResultsByTime;

  /// How much you are forecasted to spend over the forecast period, in
  /// <code>USD</code>.
  final MetricValue? total;

  GetCostForecastResponse({
    this.forecastResultsByTime,
    this.total,
  });

  factory GetCostForecastResponse.fromJson(Map<String, dynamic> json) {
    return GetCostForecastResponse(
      forecastResultsByTime: (json['ForecastResultsByTime'] as List?)
          ?.whereNotNull()
          .map((e) => ForecastResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['Total'] != null
          ? MetricValue.fromJson(json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastResultsByTime = this.forecastResultsByTime;
    final total = this.total;
    return {
      if (forecastResultsByTime != null)
        'ForecastResultsByTime': forecastResultsByTime,
      if (total != null) 'Total': total,
    };
  }
}

class GetDimensionValuesResponse {
  /// The filters that you used to filter your request. Some dimensions are
  /// available only for a specific context.
  ///
  /// If you set the context to <code>COST_AND_USAGE</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// DATABASE_ENGINE - The Amazon Relational Database Service database. Examples
  /// are Aurora or MySQL.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LEGAL_ENTITY_NAME - The name of the organization that sells you Amazon Web
  /// Services services, such as Amazon Web Services.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the Amazon Web Services
  /// ID of the member account.
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// OPERATION - The action performed. Examples include <code>RunInstance</code>
  /// and <code>CreateBucket</code>.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// PURCHASE_TYPE - The reservation type of the purchase to which this usage is
  /// related. Examples include On-Demand Instances and Standard Reserved
  /// Instances.
  /// </li>
  /// <li>
  /// SERVICE - The Amazon Web Services service such as Amazon DynamoDB.
  /// </li>
  /// <li>
  /// USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The
  /// response for the <code>GetDimensionValues</code> operation includes a unit
  /// attribute. Examples include GB and Hrs.
  /// </li>
  /// <li>
  /// USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon
  /// EC2: CloudWatch – Alarms. The response for this operation includes a unit
  /// attribute.
  /// </li>
  /// <li>
  /// RECORD_TYPE - The different types of charges such as RI fees, usage costs,
  /// tax refunds, and credits.
  /// </li>
  /// <li>
  /// RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in
  /// feature only available for last 14 days for EC2-Compute Service. You can
  /// opt-in by enabling <code>Hourly</code> and <code>Resource Level Data</code>
  /// in Cost Management Console preferences.
  /// </li>
  /// </ul>
  /// If you set the context to <code>RESERVATIONS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows
  /// or Linux.
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are <code>SingleAZ</code> and
  /// <code>MultiAZ</code>.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the Amazon Web Services
  /// ID of the member account.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// REGION - The Amazon Web Services Region.
  /// </li>
  /// <li>
  /// SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values are
  /// regional or a single Availability Zone.
  /// </li>
  /// <li>
  /// TAG (Coverage only) - The tags that are associated with a Reserved Instance
  /// (RI).
  /// </li>
  /// <li>
  /// TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  /// </li>
  /// </ul>
  /// If you set the context to <code>SAVINGS_PLANS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)
  /// </li>
  /// <li>
  /// PAYMENT_OPTION - Payment option for the given Savings Plans (for example,
  /// All Upfront)
  /// </li>
  /// <li>
  /// REGION - The Amazon Web Services Region.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE_FAMILY - The family of instances (For example,
  /// <code>m5</code>)
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the Amazon Web Services
  /// ID of the member account.
  /// </li>
  /// <li>
  /// SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan
  /// </li>
  /// </ul>
  final List<DimensionValuesWithAttributes> dimensionValues;

  /// The number of results that Amazon Web Services returned at one time.
  final int returnSize;

  /// The total number of search results.
  final int totalSize;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  GetDimensionValuesResponse({
    required this.dimensionValues,
    required this.returnSize,
    required this.totalSize,
    this.nextPageToken,
  });

  factory GetDimensionValuesResponse.fromJson(Map<String, dynamic> json) {
    return GetDimensionValuesResponse(
      dimensionValues: (json['DimensionValues'] as List)
          .whereNotNull()
          .map((e) =>
              DimensionValuesWithAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnSize: json['ReturnSize'] as int,
      totalSize: json['TotalSize'] as int,
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValues = this.dimensionValues;
    final returnSize = this.returnSize;
    final totalSize = this.totalSize;
    final nextPageToken = this.nextPageToken;
    return {
      'DimensionValues': dimensionValues,
      'ReturnSize': returnSize,
      'TotalSize': totalSize,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetReservationCoverageResponse {
  /// The amount of time that your reservations covered.
  final List<CoverageByTime> coveragesByTime;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  /// The total amount of instance usage that a reservation covered.
  final Coverage? total;

  GetReservationCoverageResponse({
    required this.coveragesByTime,
    this.nextPageToken,
    this.total,
  });

  factory GetReservationCoverageResponse.fromJson(Map<String, dynamic> json) {
    return GetReservationCoverageResponse(
      coveragesByTime: (json['CoveragesByTime'] as List)
          .whereNotNull()
          .map((e) => CoverageByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
      total: json['Total'] != null
          ? Coverage.fromJson(json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coveragesByTime = this.coveragesByTime;
    final nextPageToken = this.nextPageToken;
    final total = this.total;
    return {
      'CoveragesByTime': coveragesByTime,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (total != null) 'Total': total,
    };
  }
}

class GetReservationPurchaseRecommendationResponse {
  /// Information about this specific recommendation call, such as the time stamp
  /// for when Cost Explorer generated this recommendation.
  final ReservationPurchaseRecommendationMetadata? metadata;

  /// The pagination token for the next set of retrievable results.
  final String? nextPageToken;

  /// Recommendations for reservations to purchase.
  final List<ReservationPurchaseRecommendation>? recommendations;

  GetReservationPurchaseRecommendationResponse({
    this.metadata,
    this.nextPageToken,
    this.recommendations,
  });

  factory GetReservationPurchaseRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetReservationPurchaseRecommendationResponse(
      metadata: json['Metadata'] != null
          ? ReservationPurchaseRecommendationMetadata.fromJson(
              json['Metadata'] as Map<String, dynamic>)
          : null,
      nextPageToken: json['NextPageToken'] as String?,
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => ReservationPurchaseRecommendation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final nextPageToken = this.nextPageToken;
    final recommendations = this.recommendations;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (recommendations != null) 'Recommendations': recommendations,
    };
  }
}

class GetReservationUtilizationResponse {
  /// The amount of time that you used your Reserved Instances (RIs).
  final List<UtilizationByTime> utilizationsByTime;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  /// The total amount of time that you used your Reserved Instances (RIs).
  final ReservationAggregates? total;

  GetReservationUtilizationResponse({
    required this.utilizationsByTime,
    this.nextPageToken,
    this.total,
  });

  factory GetReservationUtilizationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetReservationUtilizationResponse(
      utilizationsByTime: (json['UtilizationsByTime'] as List)
          .whereNotNull()
          .map((e) => UtilizationByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
      total: json['Total'] != null
          ? ReservationAggregates.fromJson(
              json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final utilizationsByTime = this.utilizationsByTime;
    final nextPageToken = this.nextPageToken;
    final total = this.total;
    return {
      'UtilizationsByTime': utilizationsByTime,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (total != null) 'Total': total,
    };
  }
}

class GetRightsizingRecommendationResponse {
  /// You can use Configuration to customize recommendations across two
  /// attributes. You can choose to view recommendations for instances within the
  /// same instance families or across different instance families. You can also
  /// choose to view your estimated savings that are associated with
  /// recommendations with consideration of existing Savings Plans or RI benefits,
  /// or neither.
  final RightsizingRecommendationConfiguration? configuration;

  /// Information regarding this specific recommendation set.
  final RightsizingRecommendationMetadata? metadata;

  /// The token to retrieve the next set of results.
  final String? nextPageToken;

  /// Recommendations to rightsize resources.
  final List<RightsizingRecommendation>? rightsizingRecommendations;

  /// Summary of this recommendation set.
  final RightsizingRecommendationSummary? summary;

  GetRightsizingRecommendationResponse({
    this.configuration,
    this.metadata,
    this.nextPageToken,
    this.rightsizingRecommendations,
    this.summary,
  });

  factory GetRightsizingRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRightsizingRecommendationResponse(
      configuration: json['Configuration'] != null
          ? RightsizingRecommendationConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      metadata: json['Metadata'] != null
          ? RightsizingRecommendationMetadata.fromJson(
              json['Metadata'] as Map<String, dynamic>)
          : null,
      nextPageToken: json['NextPageToken'] as String?,
      rightsizingRecommendations: (json['RightsizingRecommendations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RightsizingRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RightsizingRecommendationSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final metadata = this.metadata;
    final nextPageToken = this.nextPageToken;
    final rightsizingRecommendations = this.rightsizingRecommendations;
    final summary = this.summary;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (metadata != null) 'Metadata': metadata,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (rightsizingRecommendations != null)
        'RightsizingRecommendations': rightsizingRecommendations,
      if (summary != null) 'Summary': summary,
    };
  }
}

class GetSavingsPlanPurchaseRecommendationDetailsResponse {
  /// Contains detailed information about a specific Savings Plan recommendation.
  final RecommendationDetailData? recommendationDetailData;

  /// The ID that is associated with the Savings Plan recommendation.
  final String? recommendationDetailId;

  GetSavingsPlanPurchaseRecommendationDetailsResponse({
    this.recommendationDetailData,
    this.recommendationDetailId,
  });

  factory GetSavingsPlanPurchaseRecommendationDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSavingsPlanPurchaseRecommendationDetailsResponse(
      recommendationDetailData: json['RecommendationDetailData'] != null
          ? RecommendationDetailData.fromJson(
              json['RecommendationDetailData'] as Map<String, dynamic>)
          : null,
      recommendationDetailId: json['RecommendationDetailId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationDetailData = this.recommendationDetailData;
    final recommendationDetailId = this.recommendationDetailId;
    return {
      if (recommendationDetailData != null)
        'RecommendationDetailData': recommendationDetailData,
      if (recommendationDetailId != null)
        'RecommendationDetailId': recommendationDetailId,
    };
  }
}

class GetSavingsPlansCoverageResponse {
  /// The amount of spend that your Savings Plans covered.
  final List<SavingsPlansCoverage> savingsPlansCoverages;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextToken;

  GetSavingsPlansCoverageResponse({
    required this.savingsPlansCoverages,
    this.nextToken,
  });

  factory GetSavingsPlansCoverageResponse.fromJson(Map<String, dynamic> json) {
    return GetSavingsPlansCoverageResponse(
      savingsPlansCoverages: (json['SavingsPlansCoverages'] as List)
          .whereNotNull()
          .map((e) => SavingsPlansCoverage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPlansCoverages = this.savingsPlansCoverages;
    final nextToken = this.nextToken;
    return {
      'SavingsPlansCoverages': savingsPlansCoverages,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetSavingsPlansPurchaseRecommendationResponse {
  /// Information that regards this specific recommendation set.
  final SavingsPlansPurchaseRecommendationMetadata? metadata;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  /// Contains your request parameters, Savings Plan Recommendations Summary, and
  /// Details.
  final SavingsPlansPurchaseRecommendation? savingsPlansPurchaseRecommendation;

  GetSavingsPlansPurchaseRecommendationResponse({
    this.metadata,
    this.nextPageToken,
    this.savingsPlansPurchaseRecommendation,
  });

  factory GetSavingsPlansPurchaseRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSavingsPlansPurchaseRecommendationResponse(
      metadata: json['Metadata'] != null
          ? SavingsPlansPurchaseRecommendationMetadata.fromJson(
              json['Metadata'] as Map<String, dynamic>)
          : null,
      nextPageToken: json['NextPageToken'] as String?,
      savingsPlansPurchaseRecommendation:
          json['SavingsPlansPurchaseRecommendation'] != null
              ? SavingsPlansPurchaseRecommendation.fromJson(
                  json['SavingsPlansPurchaseRecommendation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final nextPageToken = this.nextPageToken;
    final savingsPlansPurchaseRecommendation =
        this.savingsPlansPurchaseRecommendation;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (savingsPlansPurchaseRecommendation != null)
        'SavingsPlansPurchaseRecommendation':
            savingsPlansPurchaseRecommendation,
    };
  }
}

class GetSavingsPlansUtilizationDetailsResponse {
  /// Retrieves a single daily or monthly Savings Plans utilization rate and
  /// details for your account.
  final List<SavingsPlansUtilizationDetail> savingsPlansUtilizationDetails;
  final DateInterval timePeriod;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextToken;

  /// The total Savings Plans utilization, regardless of time period.
  final SavingsPlansUtilizationAggregates? total;

  GetSavingsPlansUtilizationDetailsResponse({
    required this.savingsPlansUtilizationDetails,
    required this.timePeriod,
    this.nextToken,
    this.total,
  });

  factory GetSavingsPlansUtilizationDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSavingsPlansUtilizationDetailsResponse(
      savingsPlansUtilizationDetails: (json['SavingsPlansUtilizationDetails']
              as List)
          .whereNotNull()
          .map((e) =>
              SavingsPlansUtilizationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      timePeriod:
          DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
      nextToken: json['NextToken'] as String?,
      total: json['Total'] != null
          ? SavingsPlansUtilizationAggregates.fromJson(
              json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPlansUtilizationDetails = this.savingsPlansUtilizationDetails;
    final timePeriod = this.timePeriod;
    final nextToken = this.nextToken;
    final total = this.total;
    return {
      'SavingsPlansUtilizationDetails': savingsPlansUtilizationDetails,
      'TimePeriod': timePeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (total != null) 'Total': total,
    };
  }
}

class GetSavingsPlansUtilizationResponse {
  /// The total amount of cost/commitment that you used your Savings Plans,
  /// regardless of date ranges.
  final SavingsPlansUtilizationAggregates total;

  /// The amount of cost/commitment that you used your Savings Plans. You can use
  /// it to specify date ranges.
  final List<SavingsPlansUtilizationByTime>? savingsPlansUtilizationsByTime;

  GetSavingsPlansUtilizationResponse({
    required this.total,
    this.savingsPlansUtilizationsByTime,
  });

  factory GetSavingsPlansUtilizationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSavingsPlansUtilizationResponse(
      total: SavingsPlansUtilizationAggregates.fromJson(
          json['Total'] as Map<String, dynamic>),
      savingsPlansUtilizationsByTime: (json['SavingsPlansUtilizationsByTime']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              SavingsPlansUtilizationByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final total = this.total;
    final savingsPlansUtilizationsByTime = this.savingsPlansUtilizationsByTime;
    return {
      'Total': total,
      if (savingsPlansUtilizationsByTime != null)
        'SavingsPlansUtilizationsByTime': savingsPlansUtilizationsByTime,
    };
  }
}

class GetTagsResponse {
  /// The number of query results that Amazon Web Services returns at a time.
  final int returnSize;

  /// The tags that match your request.
  final List<String> tags;

  /// The total number of query results.
  final int totalSize;

  /// The token for the next set of retrievable results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  final String? nextPageToken;

  GetTagsResponse({
    required this.returnSize,
    required this.tags,
    required this.totalSize,
    this.nextPageToken,
  });

  factory GetTagsResponse.fromJson(Map<String, dynamic> json) {
    return GetTagsResponse(
      returnSize: json['ReturnSize'] as int,
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      totalSize: json['TotalSize'] as int,
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnSize = this.returnSize;
    final tags = this.tags;
    final totalSize = this.totalSize;
    final nextPageToken = this.nextPageToken;
    return {
      'ReturnSize': returnSize,
      'Tags': tags,
      'TotalSize': totalSize,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class GetUsageForecastResponse {
  /// The forecasts for your query, in order. For <code>DAILY</code> forecasts,
  /// this is a list of days. For <code>MONTHLY</code> forecasts, this is a list
  /// of months.
  final List<ForecastResult>? forecastResultsByTime;

  /// How much you're forecasted to use over the forecast period.
  final MetricValue? total;

  GetUsageForecastResponse({
    this.forecastResultsByTime,
    this.total,
  });

  factory GetUsageForecastResponse.fromJson(Map<String, dynamic> json) {
    return GetUsageForecastResponse(
      forecastResultsByTime: (json['ForecastResultsByTime'] as List?)
          ?.whereNotNull()
          .map((e) => ForecastResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['Total'] != null
          ? MetricValue.fromJson(json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final forecastResultsByTime = this.forecastResultsByTime;
    final total = this.total;
    return {
      if (forecastResultsByTime != null)
        'ForecastResultsByTime': forecastResultsByTime,
      if (total != null) 'Total': total,
    };
  }
}

enum Granularity {
  daily,
  monthly,
  hourly,
}

extension GranularityValueExtension on Granularity {
  String toValue() {
    switch (this) {
      case Granularity.daily:
        return 'DAILY';
      case Granularity.monthly:
        return 'MONTHLY';
      case Granularity.hourly:
        return 'HOURLY';
    }
  }
}

extension GranularityFromString on String {
  Granularity toGranularity() {
    switch (this) {
      case 'DAILY':
        return Granularity.daily;
      case 'MONTHLY':
        return Granularity.monthly;
      case 'HOURLY':
        return Granularity.hourly;
    }
    throw Exception('$this is not known in enum Granularity');
  }
}

/// One level of grouped data in the results.
class Group {
  /// The keys that are included in this group.
  final List<String>? keys;

  /// The metrics that are included in this group.
  final Map<String, MetricValue>? metrics;

  Group({
    this.keys,
    this.metrics,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      metrics: (json['Metrics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MetricValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    final metrics = this.metrics;
    return {
      if (keys != null) 'Keys': keys,
      if (metrics != null) 'Metrics': metrics,
    };
  }
}

/// Represents a group when you specify a group by criteria or in the response
/// to a query with a specific grouping.
class GroupDefinition {
  /// The string that represents a key for a specified group.
  final String? key;

  /// The string that represents the type of group.
  final GroupDefinitionType? type;

  GroupDefinition({
    this.key,
    this.type,
  });

  factory GroupDefinition.fromJson(Map<String, dynamic> json) {
    return GroupDefinition(
      key: json['Key'] as String?,
      type: (json['Type'] as String?)?.toGroupDefinitionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    return {
      if (key != null) 'Key': key,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum GroupDefinitionType {
  dimension,
  tag,
  costCategory,
}

extension GroupDefinitionTypeValueExtension on GroupDefinitionType {
  String toValue() {
    switch (this) {
      case GroupDefinitionType.dimension:
        return 'DIMENSION';
      case GroupDefinitionType.tag:
        return 'TAG';
      case GroupDefinitionType.costCategory:
        return 'COST_CATEGORY';
    }
  }
}

extension GroupDefinitionTypeFromString on String {
  GroupDefinitionType toGroupDefinitionType() {
    switch (this) {
      case 'DIMENSION':
        return GroupDefinitionType.dimension;
      case 'TAG':
        return GroupDefinitionType.tag;
      case 'COST_CATEGORY':
        return GroupDefinitionType.costCategory;
    }
    throw Exception('$this is not known in enum GroupDefinitionType');
  }
}

/// The dollar value of the anomaly.
class Impact {
  /// The maximum dollar value that's observed for an anomaly.
  final double maxImpact;

  /// The cumulative dollar amount that was actually spent during the anomaly.
  final double? totalActualSpend;

  /// The cumulative dollar amount that was expected to be spent during the
  /// anomaly. It is calculated using advanced machine learning models to
  /// determine the typical spending pattern based on historical data for a
  /// customer.
  final double? totalExpectedSpend;

  /// The cumulative dollar difference between the total actual spend and total
  /// expected spend. It is calculated as <code>TotalActualSpend -
  /// TotalExpectedSpend</code>.
  final double? totalImpact;

  /// The cumulative percentage difference between the total actual spend and
  /// total expected spend. It is calculated as <code>(TotalImpact /
  /// TotalExpectedSpend) * 100</code>. When <code>TotalExpectedSpend</code> is
  /// zero, this field is omitted. Expected spend can be zero in situations such
  /// as when you start to use a service for the first time.
  final double? totalImpactPercentage;

  Impact({
    required this.maxImpact,
    this.totalActualSpend,
    this.totalExpectedSpend,
    this.totalImpact,
    this.totalImpactPercentage,
  });

  factory Impact.fromJson(Map<String, dynamic> json) {
    return Impact(
      maxImpact: json['MaxImpact'] as double,
      totalActualSpend: json['TotalActualSpend'] as double?,
      totalExpectedSpend: json['TotalExpectedSpend'] as double?,
      totalImpact: json['TotalImpact'] as double?,
      totalImpactPercentage: json['TotalImpactPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxImpact = this.maxImpact;
    final totalActualSpend = this.totalActualSpend;
    final totalExpectedSpend = this.totalExpectedSpend;
    final totalImpact = this.totalImpact;
    final totalImpactPercentage = this.totalImpactPercentage;
    return {
      'MaxImpact': maxImpact,
      if (totalActualSpend != null) 'TotalActualSpend': totalActualSpend,
      if (totalExpectedSpend != null) 'TotalExpectedSpend': totalExpectedSpend,
      if (totalImpact != null) 'TotalImpact': totalImpact,
      if (totalImpactPercentage != null)
        'TotalImpactPercentage': totalImpactPercentage,
    };
  }
}

/// Details about the reservations that Amazon Web Services recommends that you
/// purchase.
class InstanceDetails {
  /// The Amazon EC2 reservations that Amazon Web Services recommends that you
  /// purchase.
  final EC2InstanceDetails? eC2InstanceDetails;

  /// The Amazon OpenSearch Service reservations that Amazon Web Services
  /// recommends that you purchase.
  final ESInstanceDetails? eSInstanceDetails;

  /// The ElastiCache reservations that Amazon Web Services recommends that you
  /// purchase.
  final ElastiCacheInstanceDetails? elastiCacheInstanceDetails;

  /// The MemoryDB reservations that Amazon Web Services recommends that you
  /// purchase.
  final MemoryDBInstanceDetails? memoryDBInstanceDetails;

  /// The Amazon RDS reservations that Amazon Web Services recommends that you
  /// purchase.
  final RDSInstanceDetails? rDSInstanceDetails;

  /// The Amazon Redshift reservations that Amazon Web Services recommends that
  /// you purchase.
  final RedshiftInstanceDetails? redshiftInstanceDetails;

  InstanceDetails({
    this.eC2InstanceDetails,
    this.eSInstanceDetails,
    this.elastiCacheInstanceDetails,
    this.memoryDBInstanceDetails,
    this.rDSInstanceDetails,
    this.redshiftInstanceDetails,
  });

  factory InstanceDetails.fromJson(Map<String, dynamic> json) {
    return InstanceDetails(
      eC2InstanceDetails: json['EC2InstanceDetails'] != null
          ? EC2InstanceDetails.fromJson(
              json['EC2InstanceDetails'] as Map<String, dynamic>)
          : null,
      eSInstanceDetails: json['ESInstanceDetails'] != null
          ? ESInstanceDetails.fromJson(
              json['ESInstanceDetails'] as Map<String, dynamic>)
          : null,
      elastiCacheInstanceDetails: json['ElastiCacheInstanceDetails'] != null
          ? ElastiCacheInstanceDetails.fromJson(
              json['ElastiCacheInstanceDetails'] as Map<String, dynamic>)
          : null,
      memoryDBInstanceDetails: json['MemoryDBInstanceDetails'] != null
          ? MemoryDBInstanceDetails.fromJson(
              json['MemoryDBInstanceDetails'] as Map<String, dynamic>)
          : null,
      rDSInstanceDetails: json['RDSInstanceDetails'] != null
          ? RDSInstanceDetails.fromJson(
              json['RDSInstanceDetails'] as Map<String, dynamic>)
          : null,
      redshiftInstanceDetails: json['RedshiftInstanceDetails'] != null
          ? RedshiftInstanceDetails.fromJson(
              json['RedshiftInstanceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2InstanceDetails = this.eC2InstanceDetails;
    final eSInstanceDetails = this.eSInstanceDetails;
    final elastiCacheInstanceDetails = this.elastiCacheInstanceDetails;
    final memoryDBInstanceDetails = this.memoryDBInstanceDetails;
    final rDSInstanceDetails = this.rDSInstanceDetails;
    final redshiftInstanceDetails = this.redshiftInstanceDetails;
    return {
      if (eC2InstanceDetails != null) 'EC2InstanceDetails': eC2InstanceDetails,
      if (eSInstanceDetails != null) 'ESInstanceDetails': eSInstanceDetails,
      if (elastiCacheInstanceDetails != null)
        'ElastiCacheInstanceDetails': elastiCacheInstanceDetails,
      if (memoryDBInstanceDetails != null)
        'MemoryDBInstanceDetails': memoryDBInstanceDetails,
      if (rDSInstanceDetails != null) 'RDSInstanceDetails': rDSInstanceDetails,
      if (redshiftInstanceDetails != null)
        'RedshiftInstanceDetails': redshiftInstanceDetails,
    };
  }
}

class ListCostAllocationTagBackfillHistoryResponse {
  /// The list of historical cost allocation tag backfill requests.
  final List<CostAllocationTagBackfillRequest>? backfillRequests;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextToken;

  ListCostAllocationTagBackfillHistoryResponse({
    this.backfillRequests,
    this.nextToken,
  });

  factory ListCostAllocationTagBackfillHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCostAllocationTagBackfillHistoryResponse(
      backfillRequests: (json['BackfillRequests'] as List?)
          ?.whereNotNull()
          .map((e) => CostAllocationTagBackfillRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backfillRequests = this.backfillRequests;
    final nextToken = this.nextToken;
    return {
      if (backfillRequests != null) 'BackfillRequests': backfillRequests,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCostAllocationTagsResponse {
  /// A list of cost allocation tags that includes the detailed metadata for each
  /// one.
  final List<CostAllocationTag>? costAllocationTags;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextToken;

  ListCostAllocationTagsResponse({
    this.costAllocationTags,
    this.nextToken,
  });

  factory ListCostAllocationTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListCostAllocationTagsResponse(
      costAllocationTags: (json['CostAllocationTags'] as List?)
          ?.whereNotNull()
          .map((e) => CostAllocationTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costAllocationTags = this.costAllocationTags;
    final nextToken = this.nextToken;
    return {
      if (costAllocationTags != null) 'CostAllocationTags': costAllocationTags,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCostCategoryDefinitionsResponse {
  /// A reference to a Cost Category that contains enough information to identify
  /// the Cost Category.
  final List<CostCategoryReference>? costCategoryReferences;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  final String? nextToken;

  ListCostCategoryDefinitionsResponse({
    this.costCategoryReferences,
    this.nextToken,
  });

  factory ListCostCategoryDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCostCategoryDefinitionsResponse(
      costCategoryReferences: (json['CostCategoryReferences'] as List?)
          ?.whereNotNull()
          .map((e) => CostCategoryReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryReferences = this.costCategoryReferences;
    final nextToken = this.nextToken;
    return {
      if (costCategoryReferences != null)
        'CostCategoryReferences': costCategoryReferences,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSavingsPlansPurchaseRecommendationGenerationResponse {
  /// The list of historical recommendation generations.
  final List<GenerationSummary>? generationSummaryList;

  /// The token to retrieve the next set of results.
  final String? nextPageToken;

  ListSavingsPlansPurchaseRecommendationGenerationResponse({
    this.generationSummaryList,
    this.nextPageToken,
  });

  factory ListSavingsPlansPurchaseRecommendationGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSavingsPlansPurchaseRecommendationGenerationResponse(
      generationSummaryList: (json['GenerationSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => GenerationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['NextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final generationSummaryList = this.generationSummaryList;
    final nextPageToken = this.nextPageToken;
    return {
      if (generationSummaryList != null)
        'GenerationSummaryList': generationSummaryList,
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tag key value pairs that are associated with the resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

enum LookbackPeriodInDays {
  sevenDays,
  thirtyDays,
  sixtyDays,
}

extension LookbackPeriodInDaysValueExtension on LookbackPeriodInDays {
  String toValue() {
    switch (this) {
      case LookbackPeriodInDays.sevenDays:
        return 'SEVEN_DAYS';
      case LookbackPeriodInDays.thirtyDays:
        return 'THIRTY_DAYS';
      case LookbackPeriodInDays.sixtyDays:
        return 'SIXTY_DAYS';
    }
  }
}

extension LookbackPeriodInDaysFromString on String {
  LookbackPeriodInDays toLookbackPeriodInDays() {
    switch (this) {
      case 'SEVEN_DAYS':
        return LookbackPeriodInDays.sevenDays;
      case 'THIRTY_DAYS':
        return LookbackPeriodInDays.thirtyDays;
      case 'SIXTY_DAYS':
        return LookbackPeriodInDays.sixtyDays;
    }
    throw Exception('$this is not known in enum LookbackPeriodInDays');
  }
}

enum MatchOption {
  equals,
  absent,
  startsWith,
  endsWith,
  contains,
  caseSensitive,
  caseInsensitive,
  greaterThanOrEqual,
}

extension MatchOptionValueExtension on MatchOption {
  String toValue() {
    switch (this) {
      case MatchOption.equals:
        return 'EQUALS';
      case MatchOption.absent:
        return 'ABSENT';
      case MatchOption.startsWith:
        return 'STARTS_WITH';
      case MatchOption.endsWith:
        return 'ENDS_WITH';
      case MatchOption.contains:
        return 'CONTAINS';
      case MatchOption.caseSensitive:
        return 'CASE_SENSITIVE';
      case MatchOption.caseInsensitive:
        return 'CASE_INSENSITIVE';
      case MatchOption.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
    }
  }
}

extension MatchOptionFromString on String {
  MatchOption toMatchOption() {
    switch (this) {
      case 'EQUALS':
        return MatchOption.equals;
      case 'ABSENT':
        return MatchOption.absent;
      case 'STARTS_WITH':
        return MatchOption.startsWith;
      case 'ENDS_WITH':
        return MatchOption.endsWith;
      case 'CONTAINS':
        return MatchOption.contains;
      case 'CASE_SENSITIVE':
        return MatchOption.caseSensitive;
      case 'CASE_INSENSITIVE':
        return MatchOption.caseInsensitive;
      case 'GREATER_THAN_OR_EQUAL':
        return MatchOption.greaterThanOrEqual;
    }
    throw Exception('$this is not known in enum MatchOption');
  }
}

/// Details about the MemoryDB reservations that Amazon Web Services recommends
/// that you purchase.
class MemoryDBInstanceDetails {
  /// Determines whether the recommendation is for a current generation instance.
  final bool? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? family;

  /// The node type of the recommended reservation.
  final String? nodeType;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  MemoryDBInstanceDetails({
    this.currentGeneration,
    this.family,
    this.nodeType,
    this.region,
    this.sizeFlexEligible,
  });

  factory MemoryDBInstanceDetails.fromJson(Map<String, dynamic> json) {
    return MemoryDBInstanceDetails(
      currentGeneration: json['CurrentGeneration'] as bool?,
      family: json['Family'] as String?,
      nodeType: json['NodeType'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentGeneration = this.currentGeneration;
    final family = this.family;
    final nodeType = this.nodeType;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    return {
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (family != null) 'Family': family,
      if (nodeType != null) 'NodeType': nodeType,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
    };
  }
}

enum Metric {
  blendedCost,
  unblendedCost,
  amortizedCost,
  netUnblendedCost,
  netAmortizedCost,
  usageQuantity,
  normalizedUsageAmount,
}

extension MetricValueExtension on Metric {
  String toValue() {
    switch (this) {
      case Metric.blendedCost:
        return 'BLENDED_COST';
      case Metric.unblendedCost:
        return 'UNBLENDED_COST';
      case Metric.amortizedCost:
        return 'AMORTIZED_COST';
      case Metric.netUnblendedCost:
        return 'NET_UNBLENDED_COST';
      case Metric.netAmortizedCost:
        return 'NET_AMORTIZED_COST';
      case Metric.usageQuantity:
        return 'USAGE_QUANTITY';
      case Metric.normalizedUsageAmount:
        return 'NORMALIZED_USAGE_AMOUNT';
    }
  }
}

extension MetricFromString on String {
  Metric toMetric() {
    switch (this) {
      case 'BLENDED_COST':
        return Metric.blendedCost;
      case 'UNBLENDED_COST':
        return Metric.unblendedCost;
      case 'AMORTIZED_COST':
        return Metric.amortizedCost;
      case 'NET_UNBLENDED_COST':
        return Metric.netUnblendedCost;
      case 'NET_AMORTIZED_COST':
        return Metric.netAmortizedCost;
      case 'USAGE_QUANTITY':
        return Metric.usageQuantity;
      case 'NORMALIZED_USAGE_AMOUNT':
        return Metric.normalizedUsageAmount;
    }
    throw Exception('$this is not known in enum Metric');
  }
}

/// The aggregated value for a metric.
class MetricValue {
  /// The actual number that represents the metric.
  final String? amount;

  /// The unit that the metric is given in.
  final String? unit;

  MetricValue({
    this.amount,
    this.unit,
  });

  factory MetricValue.fromJson(Map<String, dynamic> json) {
    return MetricValue(
      amount: json['Amount'] as String?,
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      if (amount != null) 'Amount': amount,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Details for the modification recommendation.
class ModifyRecommendationDetail {
  /// Determines whether this instance type is the Amazon Web Services default
  /// recommendation.
  final List<TargetInstance>? targetInstances;

  ModifyRecommendationDetail({
    this.targetInstances,
  });

  factory ModifyRecommendationDetail.fromJson(Map<String, dynamic> json) {
    return ModifyRecommendationDetail(
      targetInstances: (json['TargetInstances'] as List?)
          ?.whereNotNull()
          .map((e) => TargetInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetInstances = this.targetInstances;
    return {
      if (targetInstances != null) 'TargetInstances': targetInstances,
    };
  }
}

enum MonitorDimension {
  service,
}

extension MonitorDimensionValueExtension on MonitorDimension {
  String toValue() {
    switch (this) {
      case MonitorDimension.service:
        return 'SERVICE';
    }
  }
}

extension MonitorDimensionFromString on String {
  MonitorDimension toMonitorDimension() {
    switch (this) {
      case 'SERVICE':
        return MonitorDimension.service;
    }
    throw Exception('$this is not known in enum MonitorDimension');
  }
}

enum MonitorType {
  dimensional,
  custom,
}

extension MonitorTypeValueExtension on MonitorType {
  String toValue() {
    switch (this) {
      case MonitorType.dimensional:
        return 'DIMENSIONAL';
      case MonitorType.custom:
        return 'CUSTOM';
    }
  }
}

extension MonitorTypeFromString on String {
  MonitorType toMonitorType() {
    switch (this) {
      case 'DIMENSIONAL':
        return MonitorType.dimensional;
      case 'CUSTOM':
        return MonitorType.custom;
    }
    throw Exception('$this is not known in enum MonitorType');
  }
}

/// The network field that contains a list of network metrics that are
/// associated with the current instance.
class NetworkResourceUtilization {
  /// The network inbound throughput utilization measured in Bytes per second
  /// (Bps).
  final String? networkInBytesPerSecond;

  /// The network outbound throughput utilization measured in Bytes per second
  /// (Bps).
  final String? networkOutBytesPerSecond;

  /// The network inbound packets that are measured in packets per second.
  final String? networkPacketsInPerSecond;

  /// The network outbound packets that are measured in packets per second.
  final String? networkPacketsOutPerSecond;

  NetworkResourceUtilization({
    this.networkInBytesPerSecond,
    this.networkOutBytesPerSecond,
    this.networkPacketsInPerSecond,
    this.networkPacketsOutPerSecond,
  });

  factory NetworkResourceUtilization.fromJson(Map<String, dynamic> json) {
    return NetworkResourceUtilization(
      networkInBytesPerSecond: json['NetworkInBytesPerSecond'] as String?,
      networkOutBytesPerSecond: json['NetworkOutBytesPerSecond'] as String?,
      networkPacketsInPerSecond: json['NetworkPacketsInPerSecond'] as String?,
      networkPacketsOutPerSecond: json['NetworkPacketsOutPerSecond'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInBytesPerSecond = this.networkInBytesPerSecond;
    final networkOutBytesPerSecond = this.networkOutBytesPerSecond;
    final networkPacketsInPerSecond = this.networkPacketsInPerSecond;
    final networkPacketsOutPerSecond = this.networkPacketsOutPerSecond;
    return {
      if (networkInBytesPerSecond != null)
        'NetworkInBytesPerSecond': networkInBytesPerSecond,
      if (networkOutBytesPerSecond != null)
        'NetworkOutBytesPerSecond': networkOutBytesPerSecond,
      if (networkPacketsInPerSecond != null)
        'NetworkPacketsInPerSecond': networkPacketsInPerSecond,
      if (networkPacketsOutPerSecond != null)
        'NetworkPacketsOutPerSecond': networkPacketsOutPerSecond,
    };
  }
}

enum NumericOperator {
  equal,
  greaterThanOrEqual,
  lessThanOrEqual,
  greaterThan,
  lessThan,
  between,
}

extension NumericOperatorValueExtension on NumericOperator {
  String toValue() {
    switch (this) {
      case NumericOperator.equal:
        return 'EQUAL';
      case NumericOperator.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
      case NumericOperator.lessThanOrEqual:
        return 'LESS_THAN_OR_EQUAL';
      case NumericOperator.greaterThan:
        return 'GREATER_THAN';
      case NumericOperator.lessThan:
        return 'LESS_THAN';
      case NumericOperator.between:
        return 'BETWEEN';
    }
  }
}

extension NumericOperatorFromString on String {
  NumericOperator toNumericOperator() {
    switch (this) {
      case 'EQUAL':
        return NumericOperator.equal;
      case 'GREATER_THAN_OR_EQUAL':
        return NumericOperator.greaterThanOrEqual;
      case 'LESS_THAN_OR_EQUAL':
        return NumericOperator.lessThanOrEqual;
      case 'GREATER_THAN':
        return NumericOperator.greaterThan;
      case 'LESS_THAN':
        return NumericOperator.lessThan;
      case 'BETWEEN':
        return NumericOperator.between;
    }
    throw Exception('$this is not known in enum NumericOperator');
  }
}

enum OfferingClass {
  standard,
  convertible,
}

extension OfferingClassValueExtension on OfferingClass {
  String toValue() {
    switch (this) {
      case OfferingClass.standard:
        return 'STANDARD';
      case OfferingClass.convertible:
        return 'CONVERTIBLE';
    }
  }
}

extension OfferingClassFromString on String {
  OfferingClass toOfferingClass() {
    switch (this) {
      case 'STANDARD':
        return OfferingClass.standard;
      case 'CONVERTIBLE':
        return OfferingClass.convertible;
    }
    throw Exception('$this is not known in enum OfferingClass');
  }
}

enum PaymentOption {
  noUpfront,
  partialUpfront,
  allUpfront,
  lightUtilization,
  mediumUtilization,
  heavyUtilization,
}

extension PaymentOptionValueExtension on PaymentOption {
  String toValue() {
    switch (this) {
      case PaymentOption.noUpfront:
        return 'NO_UPFRONT';
      case PaymentOption.partialUpfront:
        return 'PARTIAL_UPFRONT';
      case PaymentOption.allUpfront:
        return 'ALL_UPFRONT';
      case PaymentOption.lightUtilization:
        return 'LIGHT_UTILIZATION';
      case PaymentOption.mediumUtilization:
        return 'MEDIUM_UTILIZATION';
      case PaymentOption.heavyUtilization:
        return 'HEAVY_UTILIZATION';
    }
  }
}

extension PaymentOptionFromString on String {
  PaymentOption toPaymentOption() {
    switch (this) {
      case 'NO_UPFRONT':
        return PaymentOption.noUpfront;
      case 'PARTIAL_UPFRONT':
        return PaymentOption.partialUpfront;
      case 'ALL_UPFRONT':
        return PaymentOption.allUpfront;
      case 'LIGHT_UTILIZATION':
        return PaymentOption.lightUtilization;
      case 'MEDIUM_UTILIZATION':
        return PaymentOption.mediumUtilization;
      case 'HEAVY_UTILIZATION':
        return PaymentOption.heavyUtilization;
    }
    throw Exception('$this is not known in enum PaymentOption');
  }
}

enum PlatformDifference {
  hypervisor,
  networkInterface,
  storageInterface,
  instanceStoreAvailability,
  virtualizationType,
}

extension PlatformDifferenceValueExtension on PlatformDifference {
  String toValue() {
    switch (this) {
      case PlatformDifference.hypervisor:
        return 'HYPERVISOR';
      case PlatformDifference.networkInterface:
        return 'NETWORK_INTERFACE';
      case PlatformDifference.storageInterface:
        return 'STORAGE_INTERFACE';
      case PlatformDifference.instanceStoreAvailability:
        return 'INSTANCE_STORE_AVAILABILITY';
      case PlatformDifference.virtualizationType:
        return 'VIRTUALIZATION_TYPE';
    }
  }
}

extension PlatformDifferenceFromString on String {
  PlatformDifference toPlatformDifference() {
    switch (this) {
      case 'HYPERVISOR':
        return PlatformDifference.hypervisor;
      case 'NETWORK_INTERFACE':
        return PlatformDifference.networkInterface;
      case 'STORAGE_INTERFACE':
        return PlatformDifference.storageInterface;
      case 'INSTANCE_STORE_AVAILABILITY':
        return PlatformDifference.instanceStoreAvailability;
      case 'VIRTUALIZATION_TYPE':
        return PlatformDifference.virtualizationType;
    }
    throw Exception('$this is not known in enum PlatformDifference');
  }
}

class ProvideAnomalyFeedbackResponse {
  /// The ID of the modified cost anomaly.
  final String anomalyId;

  ProvideAnomalyFeedbackResponse({
    required this.anomalyId,
  });

  factory ProvideAnomalyFeedbackResponse.fromJson(Map<String, dynamic> json) {
    return ProvideAnomalyFeedbackResponse(
      anomalyId: json['AnomalyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyId = this.anomalyId;
    return {
      'AnomalyId': anomalyId,
    };
  }
}

/// Details about the Amazon RDS reservations that Amazon Web Services
/// recommends that you purchase.
class RDSInstanceDetails {
  /// Determines whether the recommendation is for a current-generation instance.
  final bool? currentGeneration;

  /// The database edition that the recommended reservation supports.
  final String? databaseEdition;

  /// The database engine that the recommended reservation supports.
  final String? databaseEngine;

  /// Determines whether the recommendation is for a reservation in a single
  /// Availability Zone or a reservation with a backup in a second Availability
  /// Zone.
  final String? deploymentOption;

  /// The instance family of the recommended reservation.
  final String? family;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// The license model that the recommended reservation supports.
  final String? licenseModel;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  RDSInstanceDetails({
    this.currentGeneration,
    this.databaseEdition,
    this.databaseEngine,
    this.deploymentOption,
    this.family,
    this.instanceType,
    this.licenseModel,
    this.region,
    this.sizeFlexEligible,
  });

  factory RDSInstanceDetails.fromJson(Map<String, dynamic> json) {
    return RDSInstanceDetails(
      currentGeneration: json['CurrentGeneration'] as bool?,
      databaseEdition: json['DatabaseEdition'] as String?,
      databaseEngine: json['DatabaseEngine'] as String?,
      deploymentOption: json['DeploymentOption'] as String?,
      family: json['Family'] as String?,
      instanceType: json['InstanceType'] as String?,
      licenseModel: json['LicenseModel'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentGeneration = this.currentGeneration;
    final databaseEdition = this.databaseEdition;
    final databaseEngine = this.databaseEngine;
    final deploymentOption = this.deploymentOption;
    final family = this.family;
    final instanceType = this.instanceType;
    final licenseModel = this.licenseModel;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    return {
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (databaseEdition != null) 'DatabaseEdition': databaseEdition,
      if (databaseEngine != null) 'DatabaseEngine': databaseEngine,
      if (deploymentOption != null) 'DeploymentOption': deploymentOption,
      if (family != null) 'Family': family,
      if (instanceType != null) 'InstanceType': instanceType,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
    };
  }
}

/// The details and metrics for the given recommendation.
class RecommendationDetailData {
  /// The AccountID that the recommendation is generated for.
  final String? accountId;

  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the management account and
  /// member accounts if the value is set to PAYER. If the value is LINKED,
  /// recommendations are calculated for individual member accounts only.
  final AccountScope? accountScope;

  /// The currency code that Amazon Web Services used to generate the
  /// recommendation and present potential savings.
  final String? currencyCode;

  /// The average value of hourly coverage over the lookback period.
  final String? currentAverageCoverage;

  /// The average value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentAverageHourlyOnDemandSpend;

  /// The highest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentMaximumHourlyOnDemandSpend;

  /// The lowest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentMinimumHourlyOnDemandSpend;

  /// The estimated coverage of the recommended Savings Plan.
  final String? estimatedAverageCoverage;

  /// The estimated utilization of the recommended Savings Plan.
  final String? estimatedAverageUtilization;

  /// The estimated monthly savings amount based on the recommended Savings Plan.
  final String? estimatedMonthlySavingsAmount;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// Savings Plan, over the length of the lookback period.
  final String? estimatedOnDemandCost;

  /// The estimated On-Demand costs you expect with no additional commitment,
  /// based on your usage of the selected time period and the Savings Plan you
  /// own.
  final String? estimatedOnDemandCostWithCurrentCommitment;

  /// The estimated return on investment that's based on the recommended Savings
  /// Plan that you purchased. This is calculated as
  /// estimatedSavingsAmount/estimatedSPCost*100.
  final String? estimatedROI;

  /// The cost of the recommended Savings Plan over the length of the lookback
  /// period.
  final String? estimatedSPCost;

  /// The estimated savings amount that's based on the recommended Savings Plan
  /// over the length of the lookback period.
  final String? estimatedSavingsAmount;

  /// The estimated savings percentage relative to the total cost of applicable
  /// On-Demand usage over the lookback period.
  final String? estimatedSavingsPercentage;

  /// The existing hourly commitment for the Savings Plan type.
  final String? existingHourlyCommitment;
  final String? generationTimestamp;

  /// The recommended hourly commitment level for the Savings Plan type and the
  /// configuration that's based on the usage during the lookback period.
  final String? hourlyCommitmentToPurchase;

  /// The instance family of the recommended Savings Plan.
  final String? instanceFamily;
  final String? latestUsageTimestamp;

  /// How many days of previous usage that Amazon Web Services considers when
  /// making this recommendation.
  final LookbackPeriodInDays? lookbackPeriodInDays;

  /// The related hourly cost, coverage, and utilization metrics over the lookback
  /// period.
  final List<RecommendationDetailHourlyMetrics>? metricsOverLookbackPeriod;

  /// The unique ID that's used to distinguish Savings Plans from one another.
  final String? offeringId;

  /// The payment option for the commitment (for example, All Upfront or No
  /// Upfront).
  final PaymentOption? paymentOption;

  /// The region the recommendation is generated for.
  final String? region;

  /// The requested Savings Plan recommendation type.
  final SupportedSavingsPlansType? savingsPlansType;

  /// The term of the commitment in years.
  final TermInYears? termInYears;

  /// The upfront cost of the recommended Savings Plan, based on the selected
  /// payment option.
  final String? upfrontCost;

  RecommendationDetailData({
    this.accountId,
    this.accountScope,
    this.currencyCode,
    this.currentAverageCoverage,
    this.currentAverageHourlyOnDemandSpend,
    this.currentMaximumHourlyOnDemandSpend,
    this.currentMinimumHourlyOnDemandSpend,
    this.estimatedAverageCoverage,
    this.estimatedAverageUtilization,
    this.estimatedMonthlySavingsAmount,
    this.estimatedOnDemandCost,
    this.estimatedOnDemandCostWithCurrentCommitment,
    this.estimatedROI,
    this.estimatedSPCost,
    this.estimatedSavingsAmount,
    this.estimatedSavingsPercentage,
    this.existingHourlyCommitment,
    this.generationTimestamp,
    this.hourlyCommitmentToPurchase,
    this.instanceFamily,
    this.latestUsageTimestamp,
    this.lookbackPeriodInDays,
    this.metricsOverLookbackPeriod,
    this.offeringId,
    this.paymentOption,
    this.region,
    this.savingsPlansType,
    this.termInYears,
    this.upfrontCost,
  });

  factory RecommendationDetailData.fromJson(Map<String, dynamic> json) {
    return RecommendationDetailData(
      accountId: json['AccountId'] as String?,
      accountScope: (json['AccountScope'] as String?)?.toAccountScope(),
      currencyCode: json['CurrencyCode'] as String?,
      currentAverageCoverage: json['CurrentAverageCoverage'] as String?,
      currentAverageHourlyOnDemandSpend:
          json['CurrentAverageHourlyOnDemandSpend'] as String?,
      currentMaximumHourlyOnDemandSpend:
          json['CurrentMaximumHourlyOnDemandSpend'] as String?,
      currentMinimumHourlyOnDemandSpend:
          json['CurrentMinimumHourlyOnDemandSpend'] as String?,
      estimatedAverageCoverage: json['EstimatedAverageCoverage'] as String?,
      estimatedAverageUtilization:
          json['EstimatedAverageUtilization'] as String?,
      estimatedMonthlySavingsAmount:
          json['EstimatedMonthlySavingsAmount'] as String?,
      estimatedOnDemandCost: json['EstimatedOnDemandCost'] as String?,
      estimatedOnDemandCostWithCurrentCommitment:
          json['EstimatedOnDemandCostWithCurrentCommitment'] as String?,
      estimatedROI: json['EstimatedROI'] as String?,
      estimatedSPCost: json['EstimatedSPCost'] as String?,
      estimatedSavingsAmount: json['EstimatedSavingsAmount'] as String?,
      estimatedSavingsPercentage: json['EstimatedSavingsPercentage'] as String?,
      existingHourlyCommitment: json['ExistingHourlyCommitment'] as String?,
      generationTimestamp: json['GenerationTimestamp'] as String?,
      hourlyCommitmentToPurchase: json['HourlyCommitmentToPurchase'] as String?,
      instanceFamily: json['InstanceFamily'] as String?,
      latestUsageTimestamp: json['LatestUsageTimestamp'] as String?,
      lookbackPeriodInDays:
          (json['LookbackPeriodInDays'] as String?)?.toLookbackPeriodInDays(),
      metricsOverLookbackPeriod: (json['MetricsOverLookbackPeriod'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationDetailHourlyMetrics.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      offeringId: json['OfferingId'] as String?,
      paymentOption: (json['PaymentOption'] as String?)?.toPaymentOption(),
      region: json['Region'] as String?,
      savingsPlansType:
          (json['SavingsPlansType'] as String?)?.toSupportedSavingsPlansType(),
      termInYears: (json['TermInYears'] as String?)?.toTermInYears(),
      upfrontCost: json['UpfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountScope = this.accountScope;
    final currencyCode = this.currencyCode;
    final currentAverageCoverage = this.currentAverageCoverage;
    final currentAverageHourlyOnDemandSpend =
        this.currentAverageHourlyOnDemandSpend;
    final currentMaximumHourlyOnDemandSpend =
        this.currentMaximumHourlyOnDemandSpend;
    final currentMinimumHourlyOnDemandSpend =
        this.currentMinimumHourlyOnDemandSpend;
    final estimatedAverageCoverage = this.estimatedAverageCoverage;
    final estimatedAverageUtilization = this.estimatedAverageUtilization;
    final estimatedMonthlySavingsAmount = this.estimatedMonthlySavingsAmount;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final estimatedOnDemandCostWithCurrentCommitment =
        this.estimatedOnDemandCostWithCurrentCommitment;
    final estimatedROI = this.estimatedROI;
    final estimatedSPCost = this.estimatedSPCost;
    final estimatedSavingsAmount = this.estimatedSavingsAmount;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final existingHourlyCommitment = this.existingHourlyCommitment;
    final generationTimestamp = this.generationTimestamp;
    final hourlyCommitmentToPurchase = this.hourlyCommitmentToPurchase;
    final instanceFamily = this.instanceFamily;
    final latestUsageTimestamp = this.latestUsageTimestamp;
    final lookbackPeriodInDays = this.lookbackPeriodInDays;
    final metricsOverLookbackPeriod = this.metricsOverLookbackPeriod;
    final offeringId = this.offeringId;
    final paymentOption = this.paymentOption;
    final region = this.region;
    final savingsPlansType = this.savingsPlansType;
    final termInYears = this.termInYears;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (accountScope != null) 'AccountScope': accountScope.toValue(),
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (currentAverageCoverage != null)
        'CurrentAverageCoverage': currentAverageCoverage,
      if (currentAverageHourlyOnDemandSpend != null)
        'CurrentAverageHourlyOnDemandSpend': currentAverageHourlyOnDemandSpend,
      if (currentMaximumHourlyOnDemandSpend != null)
        'CurrentMaximumHourlyOnDemandSpend': currentMaximumHourlyOnDemandSpend,
      if (currentMinimumHourlyOnDemandSpend != null)
        'CurrentMinimumHourlyOnDemandSpend': currentMinimumHourlyOnDemandSpend,
      if (estimatedAverageCoverage != null)
        'EstimatedAverageCoverage': estimatedAverageCoverage,
      if (estimatedAverageUtilization != null)
        'EstimatedAverageUtilization': estimatedAverageUtilization,
      if (estimatedMonthlySavingsAmount != null)
        'EstimatedMonthlySavingsAmount': estimatedMonthlySavingsAmount,
      if (estimatedOnDemandCost != null)
        'EstimatedOnDemandCost': estimatedOnDemandCost,
      if (estimatedOnDemandCostWithCurrentCommitment != null)
        'EstimatedOnDemandCostWithCurrentCommitment':
            estimatedOnDemandCostWithCurrentCommitment,
      if (estimatedROI != null) 'EstimatedROI': estimatedROI,
      if (estimatedSPCost != null) 'EstimatedSPCost': estimatedSPCost,
      if (estimatedSavingsAmount != null)
        'EstimatedSavingsAmount': estimatedSavingsAmount,
      if (estimatedSavingsPercentage != null)
        'EstimatedSavingsPercentage': estimatedSavingsPercentage,
      if (existingHourlyCommitment != null)
        'ExistingHourlyCommitment': existingHourlyCommitment,
      if (generationTimestamp != null)
        'GenerationTimestamp': generationTimestamp,
      if (hourlyCommitmentToPurchase != null)
        'HourlyCommitmentToPurchase': hourlyCommitmentToPurchase,
      if (instanceFamily != null) 'InstanceFamily': instanceFamily,
      if (latestUsageTimestamp != null)
        'LatestUsageTimestamp': latestUsageTimestamp,
      if (lookbackPeriodInDays != null)
        'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
      if (metricsOverLookbackPeriod != null)
        'MetricsOverLookbackPeriod': metricsOverLookbackPeriod,
      if (offeringId != null) 'OfferingId': offeringId,
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (region != null) 'Region': region,
      if (savingsPlansType != null)
        'SavingsPlansType': savingsPlansType.toValue(),
      if (termInYears != null) 'TermInYears': termInYears.toValue(),
      if (upfrontCost != null) 'UpfrontCost': upfrontCost,
    };
  }
}

/// Contains the hourly metrics for the given recommendation over the lookback
/// period.
class RecommendationDetailHourlyMetrics {
  /// The current amount of Savings Plans eligible usage that the Savings Plan
  /// covered.
  final String? currentCoverage;

  /// The estimated coverage amount based on the recommended Savings Plan.
  final String? estimatedCoverage;

  /// The estimated utilization for the recommended Savings Plan.
  final String? estimatedNewCommitmentUtilization;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// Savings Plan, over the length of the lookback period.
  final String? estimatedOnDemandCost;
  final String? startTime;

  RecommendationDetailHourlyMetrics({
    this.currentCoverage,
    this.estimatedCoverage,
    this.estimatedNewCommitmentUtilization,
    this.estimatedOnDemandCost,
    this.startTime,
  });

  factory RecommendationDetailHourlyMetrics.fromJson(
      Map<String, dynamic> json) {
    return RecommendationDetailHourlyMetrics(
      currentCoverage: json['CurrentCoverage'] as String?,
      estimatedCoverage: json['EstimatedCoverage'] as String?,
      estimatedNewCommitmentUtilization:
          json['EstimatedNewCommitmentUtilization'] as String?,
      estimatedOnDemandCost: json['EstimatedOnDemandCost'] as String?,
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentCoverage = this.currentCoverage;
    final estimatedCoverage = this.estimatedCoverage;
    final estimatedNewCommitmentUtilization =
        this.estimatedNewCommitmentUtilization;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final startTime = this.startTime;
    return {
      if (currentCoverage != null) 'CurrentCoverage': currentCoverage,
      if (estimatedCoverage != null) 'EstimatedCoverage': estimatedCoverage,
      if (estimatedNewCommitmentUtilization != null)
        'EstimatedNewCommitmentUtilization': estimatedNewCommitmentUtilization,
      if (estimatedOnDemandCost != null)
        'EstimatedOnDemandCost': estimatedOnDemandCost,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

enum RecommendationTarget {
  sameInstanceFamily,
  crossInstanceFamily,
}

extension RecommendationTargetValueExtension on RecommendationTarget {
  String toValue() {
    switch (this) {
      case RecommendationTarget.sameInstanceFamily:
        return 'SAME_INSTANCE_FAMILY';
      case RecommendationTarget.crossInstanceFamily:
        return 'CROSS_INSTANCE_FAMILY';
    }
  }
}

extension RecommendationTargetFromString on String {
  RecommendationTarget toRecommendationTarget() {
    switch (this) {
      case 'SAME_INSTANCE_FAMILY':
        return RecommendationTarget.sameInstanceFamily;
      case 'CROSS_INSTANCE_FAMILY':
        return RecommendationTarget.crossInstanceFamily;
    }
    throw Exception('$this is not known in enum RecommendationTarget');
  }
}

/// Details about the Amazon Redshift reservations that Amazon Web Services
/// recommends that you purchase.
class RedshiftInstanceDetails {
  /// Determines whether the recommendation is for a current-generation instance.
  final bool? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? family;

  /// The type of node that Amazon Web Services recommends.
  final String? nodeType;

  /// The Amazon Web Services Region of the recommended reservation.
  final String? region;

  /// Determines whether the recommended reservation is size flexible.
  final bool? sizeFlexEligible;

  RedshiftInstanceDetails({
    this.currentGeneration,
    this.family,
    this.nodeType,
    this.region,
    this.sizeFlexEligible,
  });

  factory RedshiftInstanceDetails.fromJson(Map<String, dynamic> json) {
    return RedshiftInstanceDetails(
      currentGeneration: json['CurrentGeneration'] as bool?,
      family: json['Family'] as String?,
      nodeType: json['NodeType'] as String?,
      region: json['Region'] as String?,
      sizeFlexEligible: json['SizeFlexEligible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentGeneration = this.currentGeneration;
    final family = this.family;
    final nodeType = this.nodeType;
    final region = this.region;
    final sizeFlexEligible = this.sizeFlexEligible;
    return {
      if (currentGeneration != null) 'CurrentGeneration': currentGeneration,
      if (family != null) 'Family': family,
      if (nodeType != null) 'NodeType': nodeType,
      if (region != null) 'Region': region,
      if (sizeFlexEligible != null) 'SizeFlexEligible': sizeFlexEligible,
    };
  }
}

/// The aggregated numbers for your reservation usage.
class ReservationAggregates {
  /// The monthly cost of your reservation. It's amortized over the reservation
  /// period.
  final String? amortizedRecurringFee;

  /// The upfront cost of your reservation. It's amortized over the reservation
  /// period.
  final String? amortizedUpfrontFee;

  /// How much you saved due to purchasing and utilizing reservation. Amazon Web
  /// Services calculates this by subtracting <code>TotalAmortizedFee</code> from
  /// <code>OnDemandCostOfRIHoursUsed</code>.
  final String? netRISavings;

  /// How much your reservation costs if charged On-Demand rates.
  final String? onDemandCostOfRIHoursUsed;

  /// How many reservation hours that you purchased.
  final String? purchasedHours;

  /// The number of Amazon EC2 reservation hours that you purchased. It's
  /// converted to normalized units. Normalized units are available only for
  /// Amazon EC2 usage after November 11, 2017.
  final String? purchasedUnits;

  /// The cost of unused hours for your reservation.
  final String? rICostForUnusedHours;

  /// The realized savings because of purchasing and using a reservation.
  final String? realizedSavings;

  /// The total number of reservation hours that you used.
  final String? totalActualHours;

  /// The total number of Amazon EC2 reservation hours that you used. It's
  /// converted to normalized units. Normalized units are available only for
  /// Amazon EC2 usage after November 11, 2017.
  final String? totalActualUnits;

  /// The total cost of your reservation. It's amortized over the reservation
  /// period.
  final String? totalAmortizedFee;

  /// How much you might save if you use your entire reservation.
  final String? totalPotentialRISavings;

  /// The unrealized savings because of purchasing and using a reservation.
  final String? unrealizedSavings;

  /// The number of reservation hours that you didn't use.
  final String? unusedHours;

  /// The number of Amazon EC2 reservation hours that you didn't use. It's
  /// converted to normalized units. Normalized units are available only for
  /// Amazon EC2 usage after November 11, 2017.
  final String? unusedUnits;

  /// The percentage of reservation time that you used.
  final String? utilizationPercentage;

  /// The percentage of Amazon EC2 reservation time that you used. It's converted
  /// to normalized units. Normalized units are available only for Amazon EC2
  /// usage after November 11, 2017.
  final String? utilizationPercentageInUnits;

  ReservationAggregates({
    this.amortizedRecurringFee,
    this.amortizedUpfrontFee,
    this.netRISavings,
    this.onDemandCostOfRIHoursUsed,
    this.purchasedHours,
    this.purchasedUnits,
    this.rICostForUnusedHours,
    this.realizedSavings,
    this.totalActualHours,
    this.totalActualUnits,
    this.totalAmortizedFee,
    this.totalPotentialRISavings,
    this.unrealizedSavings,
    this.unusedHours,
    this.unusedUnits,
    this.utilizationPercentage,
    this.utilizationPercentageInUnits,
  });

  factory ReservationAggregates.fromJson(Map<String, dynamic> json) {
    return ReservationAggregates(
      amortizedRecurringFee: json['AmortizedRecurringFee'] as String?,
      amortizedUpfrontFee: json['AmortizedUpfrontFee'] as String?,
      netRISavings: json['NetRISavings'] as String?,
      onDemandCostOfRIHoursUsed: json['OnDemandCostOfRIHoursUsed'] as String?,
      purchasedHours: json['PurchasedHours'] as String?,
      purchasedUnits: json['PurchasedUnits'] as String?,
      rICostForUnusedHours: json['RICostForUnusedHours'] as String?,
      realizedSavings: json['RealizedSavings'] as String?,
      totalActualHours: json['TotalActualHours'] as String?,
      totalActualUnits: json['TotalActualUnits'] as String?,
      totalAmortizedFee: json['TotalAmortizedFee'] as String?,
      totalPotentialRISavings: json['TotalPotentialRISavings'] as String?,
      unrealizedSavings: json['UnrealizedSavings'] as String?,
      unusedHours: json['UnusedHours'] as String?,
      unusedUnits: json['UnusedUnits'] as String?,
      utilizationPercentage: json['UtilizationPercentage'] as String?,
      utilizationPercentageInUnits:
          json['UtilizationPercentageInUnits'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amortizedRecurringFee = this.amortizedRecurringFee;
    final amortizedUpfrontFee = this.amortizedUpfrontFee;
    final netRISavings = this.netRISavings;
    final onDemandCostOfRIHoursUsed = this.onDemandCostOfRIHoursUsed;
    final purchasedHours = this.purchasedHours;
    final purchasedUnits = this.purchasedUnits;
    final rICostForUnusedHours = this.rICostForUnusedHours;
    final realizedSavings = this.realizedSavings;
    final totalActualHours = this.totalActualHours;
    final totalActualUnits = this.totalActualUnits;
    final totalAmortizedFee = this.totalAmortizedFee;
    final totalPotentialRISavings = this.totalPotentialRISavings;
    final unrealizedSavings = this.unrealizedSavings;
    final unusedHours = this.unusedHours;
    final unusedUnits = this.unusedUnits;
    final utilizationPercentage = this.utilizationPercentage;
    final utilizationPercentageInUnits = this.utilizationPercentageInUnits;
    return {
      if (amortizedRecurringFee != null)
        'AmortizedRecurringFee': amortizedRecurringFee,
      if (amortizedUpfrontFee != null)
        'AmortizedUpfrontFee': amortizedUpfrontFee,
      if (netRISavings != null) 'NetRISavings': netRISavings,
      if (onDemandCostOfRIHoursUsed != null)
        'OnDemandCostOfRIHoursUsed': onDemandCostOfRIHoursUsed,
      if (purchasedHours != null) 'PurchasedHours': purchasedHours,
      if (purchasedUnits != null) 'PurchasedUnits': purchasedUnits,
      if (rICostForUnusedHours != null)
        'RICostForUnusedHours': rICostForUnusedHours,
      if (realizedSavings != null) 'RealizedSavings': realizedSavings,
      if (totalActualHours != null) 'TotalActualHours': totalActualHours,
      if (totalActualUnits != null) 'TotalActualUnits': totalActualUnits,
      if (totalAmortizedFee != null) 'TotalAmortizedFee': totalAmortizedFee,
      if (totalPotentialRISavings != null)
        'TotalPotentialRISavings': totalPotentialRISavings,
      if (unrealizedSavings != null) 'UnrealizedSavings': unrealizedSavings,
      if (unusedHours != null) 'UnusedHours': unusedHours,
      if (unusedUnits != null) 'UnusedUnits': unusedUnits,
      if (utilizationPercentage != null)
        'UtilizationPercentage': utilizationPercentage,
      if (utilizationPercentageInUnits != null)
        'UtilizationPercentageInUnits': utilizationPercentageInUnits,
    };
  }
}

/// A group of reservations that share a set of attributes.
class ReservationCoverageGroup {
  /// The attributes for this group of reservations.
  final Map<String, String>? attributes;

  /// How much instance usage this group of reservations covered.
  final Coverage? coverage;

  ReservationCoverageGroup({
    this.attributes,
    this.coverage,
  });

  factory ReservationCoverageGroup.fromJson(Map<String, dynamic> json) {
    return ReservationCoverageGroup(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      coverage: json['Coverage'] != null
          ? Coverage.fromJson(json['Coverage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final coverage = this.coverage;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (coverage != null) 'Coverage': coverage,
    };
  }
}

/// A specific reservation that Amazon Web Services recommends for purchase.
class ReservationPurchaseRecommendation {
  /// The account scope that Amazon Web Services recommends that you purchase this
  /// instance for. For example, you can purchase this reservation for an entire
  /// organization in Amazon Web Services Organizations.
  final AccountScope? accountScope;

  /// How many days of previous usage that Amazon Web Services considers when
  /// making this recommendation.
  final LookbackPeriodInDays? lookbackPeriodInDays;

  /// The payment option for the reservation (for example, <code>AllUpfront</code>
  /// or <code>NoUpfront</code>).
  final PaymentOption? paymentOption;

  /// Details about the recommended purchases.
  final List<ReservationPurchaseRecommendationDetail>? recommendationDetails;

  /// A summary about the recommended purchase.
  final ReservationPurchaseRecommendationSummary? recommendationSummary;

  /// Hardware specifications for the service that you want recommendations for.
  final ServiceSpecification? serviceSpecification;

  /// The term of the reservation that you want recommendations for, in years.
  final TermInYears? termInYears;

  ReservationPurchaseRecommendation({
    this.accountScope,
    this.lookbackPeriodInDays,
    this.paymentOption,
    this.recommendationDetails,
    this.recommendationSummary,
    this.serviceSpecification,
    this.termInYears,
  });

  factory ReservationPurchaseRecommendation.fromJson(
      Map<String, dynamic> json) {
    return ReservationPurchaseRecommendation(
      accountScope: (json['AccountScope'] as String?)?.toAccountScope(),
      lookbackPeriodInDays:
          (json['LookbackPeriodInDays'] as String?)?.toLookbackPeriodInDays(),
      paymentOption: (json['PaymentOption'] as String?)?.toPaymentOption(),
      recommendationDetails: (json['RecommendationDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ReservationPurchaseRecommendationDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      recommendationSummary: json['RecommendationSummary'] != null
          ? ReservationPurchaseRecommendationSummary.fromJson(
              json['RecommendationSummary'] as Map<String, dynamic>)
          : null,
      serviceSpecification: json['ServiceSpecification'] != null
          ? ServiceSpecification.fromJson(
              json['ServiceSpecification'] as Map<String, dynamic>)
          : null,
      termInYears: (json['TermInYears'] as String?)?.toTermInYears(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final lookbackPeriodInDays = this.lookbackPeriodInDays;
    final paymentOption = this.paymentOption;
    final recommendationDetails = this.recommendationDetails;
    final recommendationSummary = this.recommendationSummary;
    final serviceSpecification = this.serviceSpecification;
    final termInYears = this.termInYears;
    return {
      if (accountScope != null) 'AccountScope': accountScope.toValue(),
      if (lookbackPeriodInDays != null)
        'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (recommendationDetails != null)
        'RecommendationDetails': recommendationDetails,
      if (recommendationSummary != null)
        'RecommendationSummary': recommendationSummary,
      if (serviceSpecification != null)
        'ServiceSpecification': serviceSpecification,
      if (termInYears != null) 'TermInYears': termInYears.toValue(),
    };
  }
}

/// Details about your recommended reservation purchase.
class ReservationPurchaseRecommendationDetail {
  /// The account that this Reserved Instance (RI) recommendation is for.
  final String? accountId;

  /// The average number of normalized units that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? averageNormalizedUnitsUsedPerHour;

  /// The average number of instances that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? averageNumberOfInstancesUsedPerHour;

  /// The average utilization of your instances. Amazon Web Services uses this to
  /// calculate your recommended reservation purchases.
  final String? averageUtilization;

  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  final String? currencyCode;

  /// How long Amazon Web Services estimates that it takes for this instance to
  /// start saving you money, in months.
  final String? estimatedBreakEvenInMonths;

  /// How much Amazon Web Services estimates that you spend on On-Demand Instances
  /// in a month.
  final String? estimatedMonthlyOnDemandCost;

  /// How much Amazon Web Services estimates that this specific recommendation
  /// might save you in a month.
  final String? estimatedMonthlySavingsAmount;

  /// How much Amazon Web Services estimates that this specific recommendation
  /// might save you in a month, as a percentage of your overall costs.
  final String? estimatedMonthlySavingsPercentage;

  /// How much Amazon Web Services estimates that you might spend for all usage
  /// during the specified historical period if you had a reservation.
  final String? estimatedReservationCostForLookbackPeriod;

  /// Details about the reservations that Amazon Web Services recommends that you
  /// purchase.
  final InstanceDetails? instanceDetails;

  /// The maximum number of normalized units that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? maximumNormalizedUnitsUsedPerHour;

  /// The maximum number of instances that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? maximumNumberOfInstancesUsedPerHour;

  /// The minimum number of normalized units that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? minimumNormalizedUnitsUsedPerHour;

  /// The minimum number of instances that you used in an hour during the
  /// historical period. Amazon Web Services uses this to calculate your
  /// recommended reservation purchases.
  final String? minimumNumberOfInstancesUsedPerHour;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? recommendedNormalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? recommendedNumberOfInstancesToPurchase;

  /// How much purchasing this instance costs you on a monthly basis.
  final String? recurringStandardMonthlyCost;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  ReservationPurchaseRecommendationDetail({
    this.accountId,
    this.averageNormalizedUnitsUsedPerHour,
    this.averageNumberOfInstancesUsedPerHour,
    this.averageUtilization,
    this.currencyCode,
    this.estimatedBreakEvenInMonths,
    this.estimatedMonthlyOnDemandCost,
    this.estimatedMonthlySavingsAmount,
    this.estimatedMonthlySavingsPercentage,
    this.estimatedReservationCostForLookbackPeriod,
    this.instanceDetails,
    this.maximumNormalizedUnitsUsedPerHour,
    this.maximumNumberOfInstancesUsedPerHour,
    this.minimumNormalizedUnitsUsedPerHour,
    this.minimumNumberOfInstancesUsedPerHour,
    this.recommendedNormalizedUnitsToPurchase,
    this.recommendedNumberOfInstancesToPurchase,
    this.recurringStandardMonthlyCost,
    this.upfrontCost,
  });

  factory ReservationPurchaseRecommendationDetail.fromJson(
      Map<String, dynamic> json) {
    return ReservationPurchaseRecommendationDetail(
      accountId: json['AccountId'] as String?,
      averageNormalizedUnitsUsedPerHour:
          json['AverageNormalizedUnitsUsedPerHour'] as String?,
      averageNumberOfInstancesUsedPerHour:
          json['AverageNumberOfInstancesUsedPerHour'] as String?,
      averageUtilization: json['AverageUtilization'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      estimatedBreakEvenInMonths: json['EstimatedBreakEvenInMonths'] as String?,
      estimatedMonthlyOnDemandCost:
          json['EstimatedMonthlyOnDemandCost'] as String?,
      estimatedMonthlySavingsAmount:
          json['EstimatedMonthlySavingsAmount'] as String?,
      estimatedMonthlySavingsPercentage:
          json['EstimatedMonthlySavingsPercentage'] as String?,
      estimatedReservationCostForLookbackPeriod:
          json['EstimatedReservationCostForLookbackPeriod'] as String?,
      instanceDetails: json['InstanceDetails'] != null
          ? InstanceDetails.fromJson(
              json['InstanceDetails'] as Map<String, dynamic>)
          : null,
      maximumNormalizedUnitsUsedPerHour:
          json['MaximumNormalizedUnitsUsedPerHour'] as String?,
      maximumNumberOfInstancesUsedPerHour:
          json['MaximumNumberOfInstancesUsedPerHour'] as String?,
      minimumNormalizedUnitsUsedPerHour:
          json['MinimumNormalizedUnitsUsedPerHour'] as String?,
      minimumNumberOfInstancesUsedPerHour:
          json['MinimumNumberOfInstancesUsedPerHour'] as String?,
      recommendedNormalizedUnitsToPurchase:
          json['RecommendedNormalizedUnitsToPurchase'] as String?,
      recommendedNumberOfInstancesToPurchase:
          json['RecommendedNumberOfInstancesToPurchase'] as String?,
      recurringStandardMonthlyCost:
          json['RecurringStandardMonthlyCost'] as String?,
      upfrontCost: json['UpfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final averageNormalizedUnitsUsedPerHour =
        this.averageNormalizedUnitsUsedPerHour;
    final averageNumberOfInstancesUsedPerHour =
        this.averageNumberOfInstancesUsedPerHour;
    final averageUtilization = this.averageUtilization;
    final currencyCode = this.currencyCode;
    final estimatedBreakEvenInMonths = this.estimatedBreakEvenInMonths;
    final estimatedMonthlyOnDemandCost = this.estimatedMonthlyOnDemandCost;
    final estimatedMonthlySavingsAmount = this.estimatedMonthlySavingsAmount;
    final estimatedMonthlySavingsPercentage =
        this.estimatedMonthlySavingsPercentage;
    final estimatedReservationCostForLookbackPeriod =
        this.estimatedReservationCostForLookbackPeriod;
    final instanceDetails = this.instanceDetails;
    final maximumNormalizedUnitsUsedPerHour =
        this.maximumNormalizedUnitsUsedPerHour;
    final maximumNumberOfInstancesUsedPerHour =
        this.maximumNumberOfInstancesUsedPerHour;
    final minimumNormalizedUnitsUsedPerHour =
        this.minimumNormalizedUnitsUsedPerHour;
    final minimumNumberOfInstancesUsedPerHour =
        this.minimumNumberOfInstancesUsedPerHour;
    final recommendedNormalizedUnitsToPurchase =
        this.recommendedNormalizedUnitsToPurchase;
    final recommendedNumberOfInstancesToPurchase =
        this.recommendedNumberOfInstancesToPurchase;
    final recurringStandardMonthlyCost = this.recurringStandardMonthlyCost;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (averageNormalizedUnitsUsedPerHour != null)
        'AverageNormalizedUnitsUsedPerHour': averageNormalizedUnitsUsedPerHour,
      if (averageNumberOfInstancesUsedPerHour != null)
        'AverageNumberOfInstancesUsedPerHour':
            averageNumberOfInstancesUsedPerHour,
      if (averageUtilization != null) 'AverageUtilization': averageUtilization,
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (estimatedBreakEvenInMonths != null)
        'EstimatedBreakEvenInMonths': estimatedBreakEvenInMonths,
      if (estimatedMonthlyOnDemandCost != null)
        'EstimatedMonthlyOnDemandCost': estimatedMonthlyOnDemandCost,
      if (estimatedMonthlySavingsAmount != null)
        'EstimatedMonthlySavingsAmount': estimatedMonthlySavingsAmount,
      if (estimatedMonthlySavingsPercentage != null)
        'EstimatedMonthlySavingsPercentage': estimatedMonthlySavingsPercentage,
      if (estimatedReservationCostForLookbackPeriod != null)
        'EstimatedReservationCostForLookbackPeriod':
            estimatedReservationCostForLookbackPeriod,
      if (instanceDetails != null) 'InstanceDetails': instanceDetails,
      if (maximumNormalizedUnitsUsedPerHour != null)
        'MaximumNormalizedUnitsUsedPerHour': maximumNormalizedUnitsUsedPerHour,
      if (maximumNumberOfInstancesUsedPerHour != null)
        'MaximumNumberOfInstancesUsedPerHour':
            maximumNumberOfInstancesUsedPerHour,
      if (minimumNormalizedUnitsUsedPerHour != null)
        'MinimumNormalizedUnitsUsedPerHour': minimumNormalizedUnitsUsedPerHour,
      if (minimumNumberOfInstancesUsedPerHour != null)
        'MinimumNumberOfInstancesUsedPerHour':
            minimumNumberOfInstancesUsedPerHour,
      if (recommendedNormalizedUnitsToPurchase != null)
        'RecommendedNormalizedUnitsToPurchase':
            recommendedNormalizedUnitsToPurchase,
      if (recommendedNumberOfInstancesToPurchase != null)
        'RecommendedNumberOfInstancesToPurchase':
            recommendedNumberOfInstancesToPurchase,
      if (recurringStandardMonthlyCost != null)
        'RecurringStandardMonthlyCost': recurringStandardMonthlyCost,
      if (upfrontCost != null) 'UpfrontCost': upfrontCost,
    };
  }
}

/// Information about a recommendation, such as the timestamp for when Amazon
/// Web Services made a specific recommendation.
class ReservationPurchaseRecommendationMetadata {
  /// Additional metadata that might be applicable to the recommendation.
  final String? additionalMetadata;

  /// The timestamp for when Amazon Web Services made the recommendation.
  final String? generationTimestamp;

  /// The ID for the recommendation.
  final String? recommendationId;

  ReservationPurchaseRecommendationMetadata({
    this.additionalMetadata,
    this.generationTimestamp,
    this.recommendationId,
  });

  factory ReservationPurchaseRecommendationMetadata.fromJson(
      Map<String, dynamic> json) {
    return ReservationPurchaseRecommendationMetadata(
      additionalMetadata: json['AdditionalMetadata'] as String?,
      generationTimestamp: json['GenerationTimestamp'] as String?,
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalMetadata = this.additionalMetadata;
    final generationTimestamp = this.generationTimestamp;
    final recommendationId = this.recommendationId;
    return {
      if (additionalMetadata != null) 'AdditionalMetadata': additionalMetadata,
      if (generationTimestamp != null)
        'GenerationTimestamp': generationTimestamp,
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

/// A summary about this recommendation, such as the currency code, the amount
/// that Amazon Web Services estimates that you could save, and the total amount
/// of reservation to purchase.
class ReservationPurchaseRecommendationSummary {
  /// The currency code used for this recommendation.
  final String? currencyCode;

  /// The total amount that Amazon Web Services estimates that this recommendation
  /// could save you in a month.
  final String? totalEstimatedMonthlySavingsAmount;

  /// The total amount that Amazon Web Services estimates that this recommendation
  /// could save you in a month, as a percentage of your costs.
  final String? totalEstimatedMonthlySavingsPercentage;

  ReservationPurchaseRecommendationSummary({
    this.currencyCode,
    this.totalEstimatedMonthlySavingsAmount,
    this.totalEstimatedMonthlySavingsPercentage,
  });

  factory ReservationPurchaseRecommendationSummary.fromJson(
      Map<String, dynamic> json) {
    return ReservationPurchaseRecommendationSummary(
      currencyCode: json['CurrencyCode'] as String?,
      totalEstimatedMonthlySavingsAmount:
          json['TotalEstimatedMonthlySavingsAmount'] as String?,
      totalEstimatedMonthlySavingsPercentage:
          json['TotalEstimatedMonthlySavingsPercentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final totalEstimatedMonthlySavingsAmount =
        this.totalEstimatedMonthlySavingsAmount;
    final totalEstimatedMonthlySavingsPercentage =
        this.totalEstimatedMonthlySavingsPercentage;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (totalEstimatedMonthlySavingsAmount != null)
        'TotalEstimatedMonthlySavingsAmount':
            totalEstimatedMonthlySavingsAmount,
      if (totalEstimatedMonthlySavingsPercentage != null)
        'TotalEstimatedMonthlySavingsPercentage':
            totalEstimatedMonthlySavingsPercentage,
    };
  }
}

/// A group of reservations that share a set of attributes.
class ReservationUtilizationGroup {
  /// The attributes for this group of reservations.
  final Map<String, String>? attributes;

  /// The key for a specific reservation attribute.
  final String? key;

  /// How much you used this group of reservations.
  final ReservationAggregates? utilization;

  /// The value of a specific reservation attribute.
  final String? value;

  ReservationUtilizationGroup({
    this.attributes,
    this.key,
    this.utilization,
    this.value,
  });

  factory ReservationUtilizationGroup.fromJson(Map<String, dynamic> json) {
    return ReservationUtilizationGroup(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      key: json['Key'] as String?,
      utilization: json['Utilization'] != null
          ? ReservationAggregates.fromJson(
              json['Utilization'] as Map<String, dynamic>)
          : null,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final key = this.key;
    final utilization = this.utilization;
    final value = this.value;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (key != null) 'Key': key,
      if (utilization != null) 'Utilization': utilization,
      if (value != null) 'Value': value,
    };
  }
}

/// Details for the resource.
class ResourceDetails {
  /// Details for the Amazon EC2 resource.
  final EC2ResourceDetails? eC2ResourceDetails;

  ResourceDetails({
    this.eC2ResourceDetails,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      eC2ResourceDetails: json['EC2ResourceDetails'] != null
          ? EC2ResourceDetails.fromJson(
              json['EC2ResourceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2ResourceDetails = this.eC2ResourceDetails;
    return {
      if (eC2ResourceDetails != null) 'EC2ResourceDetails': eC2ResourceDetails,
    };
  }
}

/// The tag structure that contains a tag key and value.
/// <note>
/// Tagging is supported only for the following Cost Explorer resource types: <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html">
/// <code>AnomalyMonitor</code> </a>, <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html">
/// <code>AnomalySubscription</code> </a>, <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategory.html">
/// <code>CostCategory</code> </a>.
/// </note>
class ResourceTag {
  /// The key that's associated with the tag.
  final String key;

  /// The value that's associated with the tag.
  final String value;

  ResourceTag({
    required this.key,
    required this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
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

/// Resource utilization of current resource.
class ResourceUtilization {
  /// The utilization of current Amazon EC2 instance.
  final EC2ResourceUtilization? eC2ResourceUtilization;

  ResourceUtilization({
    this.eC2ResourceUtilization,
  });

  factory ResourceUtilization.fromJson(Map<String, dynamic> json) {
    return ResourceUtilization(
      eC2ResourceUtilization: json['EC2ResourceUtilization'] != null
          ? EC2ResourceUtilization.fromJson(
              json['EC2ResourceUtilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2ResourceUtilization = this.eC2ResourceUtilization;
    return {
      if (eC2ResourceUtilization != null)
        'EC2ResourceUtilization': eC2ResourceUtilization,
    };
  }
}

/// The result that's associated with a time period.
class ResultByTime {
  /// Determines whether the result is estimated.
  final bool? estimated;

  /// The groups that this time period includes.
  final List<Group>? groups;

  /// The time period that the result covers.
  final DateInterval? timePeriod;

  /// The total amount of cost or usage accrued during the time period.
  final Map<String, MetricValue>? total;

  ResultByTime({
    this.estimated,
    this.groups,
    this.timePeriod,
    this.total,
  });

  factory ResultByTime.fromJson(Map<String, dynamic> json) {
    return ResultByTime(
      estimated: json['Estimated'] as bool?,
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      timePeriod: json['TimePeriod'] != null
          ? DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
      total: (json['Total'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MetricValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final estimated = this.estimated;
    final groups = this.groups;
    final timePeriod = this.timePeriod;
    final total = this.total;
    return {
      if (estimated != null) 'Estimated': estimated,
      if (groups != null) 'Groups': groups,
      if (timePeriod != null) 'TimePeriod': timePeriod,
      if (total != null) 'Total': total,
    };
  }
}

/// Recommendations to rightsize resources.
class RightsizingRecommendation {
  /// The account that this recommendation is for.
  final String? accountId;

  /// Context regarding the current instance.
  final CurrentInstance? currentInstance;

  /// The list of possible reasons why the recommendation is generated, such as
  /// under- or over-utilization of specific metrics (for example, CPU, Memory,
  /// Network).
  final List<FindingReasonCode>? findingReasonCodes;

  /// The details for the modification recommendations.
  final ModifyRecommendationDetail? modifyRecommendationDetail;

  /// A recommendation to either terminate or modify the resource.
  final RightsizingType? rightsizingType;

  /// The details for termination recommendations.
  final TerminateRecommendationDetail? terminateRecommendationDetail;

  RightsizingRecommendation({
    this.accountId,
    this.currentInstance,
    this.findingReasonCodes,
    this.modifyRecommendationDetail,
    this.rightsizingType,
    this.terminateRecommendationDetail,
  });

  factory RightsizingRecommendation.fromJson(Map<String, dynamic> json) {
    return RightsizingRecommendation(
      accountId: json['AccountId'] as String?,
      currentInstance: json['CurrentInstance'] != null
          ? CurrentInstance.fromJson(
              json['CurrentInstance'] as Map<String, dynamic>)
          : null,
      findingReasonCodes: (json['FindingReasonCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toFindingReasonCode())
          .toList(),
      modifyRecommendationDetail: json['ModifyRecommendationDetail'] != null
          ? ModifyRecommendationDetail.fromJson(
              json['ModifyRecommendationDetail'] as Map<String, dynamic>)
          : null,
      rightsizingType:
          (json['RightsizingType'] as String?)?.toRightsizingType(),
      terminateRecommendationDetail:
          json['TerminateRecommendationDetail'] != null
              ? TerminateRecommendationDetail.fromJson(
                  json['TerminateRecommendationDetail'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final currentInstance = this.currentInstance;
    final findingReasonCodes = this.findingReasonCodes;
    final modifyRecommendationDetail = this.modifyRecommendationDetail;
    final rightsizingType = this.rightsizingType;
    final terminateRecommendationDetail = this.terminateRecommendationDetail;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (currentInstance != null) 'CurrentInstance': currentInstance,
      if (findingReasonCodes != null)
        'FindingReasonCodes':
            findingReasonCodes.map((e) => e.toValue()).toList(),
      if (modifyRecommendationDetail != null)
        'ModifyRecommendationDetail': modifyRecommendationDetail,
      if (rightsizingType != null) 'RightsizingType': rightsizingType.toValue(),
      if (terminateRecommendationDetail != null)
        'TerminateRecommendationDetail': terminateRecommendationDetail,
    };
  }
}

/// You can use <code>RightsizingRecommendationConfiguration</code> to customize
/// recommendations across two attributes. You can choose to view
/// recommendations for instances within the same instance families or across
/// different instance families. You can also choose to view your estimated
/// savings that are associated with recommendations with consideration of
/// existing Savings Plans or Reserved Instance (RI) benefits, or neither.
class RightsizingRecommendationConfiguration {
  /// The option to consider RI or Savings Plans discount benefits in your savings
  /// calculation. The default value is <code>TRUE</code>.
  final bool benefitsConsidered;

  /// The option to see recommendations within the same instance family or
  /// recommendations for instances across other families. The default value is
  /// <code>SAME_INSTANCE_FAMILY</code>.
  final RecommendationTarget recommendationTarget;

  RightsizingRecommendationConfiguration({
    required this.benefitsConsidered,
    required this.recommendationTarget,
  });

  factory RightsizingRecommendationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RightsizingRecommendationConfiguration(
      benefitsConsidered: json['BenefitsConsidered'] as bool,
      recommendationTarget:
          (json['RecommendationTarget'] as String).toRecommendationTarget(),
    );
  }

  Map<String, dynamic> toJson() {
    final benefitsConsidered = this.benefitsConsidered;
    final recommendationTarget = this.recommendationTarget;
    return {
      'BenefitsConsidered': benefitsConsidered,
      'RecommendationTarget': recommendationTarget.toValue(),
    };
  }
}

/// Metadata for a recommendation set.
class RightsizingRecommendationMetadata {
  /// Additional metadata that might be applicable to the recommendation.
  final String? additionalMetadata;

  /// The timestamp for when Amazon Web Services made the recommendation.
  final String? generationTimestamp;

  /// The number of days of previous usage that Amazon Web Services considers when
  /// making the recommendation.
  final LookbackPeriodInDays? lookbackPeriodInDays;

  /// The ID for the recommendation.
  final String? recommendationId;

  RightsizingRecommendationMetadata({
    this.additionalMetadata,
    this.generationTimestamp,
    this.lookbackPeriodInDays,
    this.recommendationId,
  });

  factory RightsizingRecommendationMetadata.fromJson(
      Map<String, dynamic> json) {
    return RightsizingRecommendationMetadata(
      additionalMetadata: json['AdditionalMetadata'] as String?,
      generationTimestamp: json['GenerationTimestamp'] as String?,
      lookbackPeriodInDays:
          (json['LookbackPeriodInDays'] as String?)?.toLookbackPeriodInDays(),
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalMetadata = this.additionalMetadata;
    final generationTimestamp = this.generationTimestamp;
    final lookbackPeriodInDays = this.lookbackPeriodInDays;
    final recommendationId = this.recommendationId;
    return {
      if (additionalMetadata != null) 'AdditionalMetadata': additionalMetadata,
      if (generationTimestamp != null)
        'GenerationTimestamp': generationTimestamp,
      if (lookbackPeriodInDays != null)
        'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

/// The summary of rightsizing recommendations
class RightsizingRecommendationSummary {
  /// The estimated total savings resulting from modifications, on a monthly
  /// basis.
  final String? estimatedTotalMonthlySavingsAmount;

  /// The currency code that Amazon Web Services used to calculate the savings.
  final String? savingsCurrencyCode;

  /// The savings percentage based on the recommended modifications. It's relative
  /// to the total On-Demand costs that are associated with these instances.
  final String? savingsPercentage;

  /// The total number of instance recommendations.
  final String? totalRecommendationCount;

  RightsizingRecommendationSummary({
    this.estimatedTotalMonthlySavingsAmount,
    this.savingsCurrencyCode,
    this.savingsPercentage,
    this.totalRecommendationCount,
  });

  factory RightsizingRecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RightsizingRecommendationSummary(
      estimatedTotalMonthlySavingsAmount:
          json['EstimatedTotalMonthlySavingsAmount'] as String?,
      savingsCurrencyCode: json['SavingsCurrencyCode'] as String?,
      savingsPercentage: json['SavingsPercentage'] as String?,
      totalRecommendationCount: json['TotalRecommendationCount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedTotalMonthlySavingsAmount =
        this.estimatedTotalMonthlySavingsAmount;
    final savingsCurrencyCode = this.savingsCurrencyCode;
    final savingsPercentage = this.savingsPercentage;
    final totalRecommendationCount = this.totalRecommendationCount;
    return {
      if (estimatedTotalMonthlySavingsAmount != null)
        'EstimatedTotalMonthlySavingsAmount':
            estimatedTotalMonthlySavingsAmount,
      if (savingsCurrencyCode != null)
        'SavingsCurrencyCode': savingsCurrencyCode,
      if (savingsPercentage != null) 'SavingsPercentage': savingsPercentage,
      if (totalRecommendationCount != null)
        'TotalRecommendationCount': totalRecommendationCount,
    };
  }
}

enum RightsizingType {
  terminate,
  modify,
}

extension RightsizingTypeValueExtension on RightsizingType {
  String toValue() {
    switch (this) {
      case RightsizingType.terminate:
        return 'TERMINATE';
      case RightsizingType.modify:
        return 'MODIFY';
    }
  }
}

extension RightsizingTypeFromString on String {
  RightsizingType toRightsizingType() {
    switch (this) {
      case 'TERMINATE':
        return RightsizingType.terminate;
      case 'MODIFY':
        return RightsizingType.modify;
    }
    throw Exception('$this is not known in enum RightsizingType');
  }
}

/// The combination of Amazon Web Service, linked account, linked account name,
/// Region, and usage type where a cost anomaly is observed. The linked account
/// name will only be available when the account name can be identified.
class RootCause {
  /// The member account value that's associated with the cost anomaly.
  final String? linkedAccount;

  /// The member account name value that's associated with the cost anomaly.
  final String? linkedAccountName;

  /// The Amazon Web Services Region that's associated with the cost anomaly.
  final String? region;

  /// The Amazon Web Service name that's associated with the cost anomaly.
  final String? service;

  /// The <code>UsageType</code> value that's associated with the cost anomaly.
  final String? usageType;

  RootCause({
    this.linkedAccount,
    this.linkedAccountName,
    this.region,
    this.service,
    this.usageType,
  });

  factory RootCause.fromJson(Map<String, dynamic> json) {
    return RootCause(
      linkedAccount: json['LinkedAccount'] as String?,
      linkedAccountName: json['LinkedAccountName'] as String?,
      region: json['Region'] as String?,
      service: json['Service'] as String?,
      usageType: json['UsageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedAccount = this.linkedAccount;
    final linkedAccountName = this.linkedAccountName;
    final region = this.region;
    final service = this.service;
    final usageType = this.usageType;
    return {
      if (linkedAccount != null) 'LinkedAccount': linkedAccount,
      if (linkedAccountName != null) 'LinkedAccountName': linkedAccountName,
      if (region != null) 'Region': region,
      if (service != null) 'Service': service,
      if (usageType != null) 'UsageType': usageType,
    };
  }
}

/// The amortized amount of Savings Plans purchased in a specific account during
/// a specific time interval.
class SavingsPlansAmortizedCommitment {
  /// The amortized amount of your Savings Plans commitment that was purchased
  /// with either a <code>Partial</code> or a <code>NoUpfront</code>.
  final String? amortizedRecurringCommitment;

  /// The amortized amount of your Savings Plans commitment that was purchased
  /// with an <code>Upfront</code> or <code>PartialUpfront</code> Savings Plans.
  final String? amortizedUpfrontCommitment;

  /// The total amortized amount of your Savings Plans commitment, regardless of
  /// your Savings Plans purchase method.
  final String? totalAmortizedCommitment;

  SavingsPlansAmortizedCommitment({
    this.amortizedRecurringCommitment,
    this.amortizedUpfrontCommitment,
    this.totalAmortizedCommitment,
  });

  factory SavingsPlansAmortizedCommitment.fromJson(Map<String, dynamic> json) {
    return SavingsPlansAmortizedCommitment(
      amortizedRecurringCommitment:
          json['AmortizedRecurringCommitment'] as String?,
      amortizedUpfrontCommitment: json['AmortizedUpfrontCommitment'] as String?,
      totalAmortizedCommitment: json['TotalAmortizedCommitment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amortizedRecurringCommitment = this.amortizedRecurringCommitment;
    final amortizedUpfrontCommitment = this.amortizedUpfrontCommitment;
    final totalAmortizedCommitment = this.totalAmortizedCommitment;
    return {
      if (amortizedRecurringCommitment != null)
        'AmortizedRecurringCommitment': amortizedRecurringCommitment,
      if (amortizedUpfrontCommitment != null)
        'AmortizedUpfrontCommitment': amortizedUpfrontCommitment,
      if (totalAmortizedCommitment != null)
        'TotalAmortizedCommitment': totalAmortizedCommitment,
    };
  }
}

/// The amount of Savings Plans eligible usage that's covered by Savings Plans.
/// All calculations consider the On-Demand equivalent of your Savings Plans
/// usage.
class SavingsPlansCoverage {
  /// The attribute that applies to a specific <code>Dimension</code>.
  final Map<String, String>? attributes;

  /// The amount of Savings Plans eligible usage that the Savings Plans covered.
  final SavingsPlansCoverageData? coverage;
  final DateInterval? timePeriod;

  SavingsPlansCoverage({
    this.attributes,
    this.coverage,
    this.timePeriod,
  });

  factory SavingsPlansCoverage.fromJson(Map<String, dynamic> json) {
    return SavingsPlansCoverage(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      coverage: json['Coverage'] != null
          ? SavingsPlansCoverageData.fromJson(
              json['Coverage'] as Map<String, dynamic>)
          : null,
      timePeriod: json['TimePeriod'] != null
          ? DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final coverage = this.coverage;
    final timePeriod = this.timePeriod;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (coverage != null) 'Coverage': coverage,
      if (timePeriod != null) 'TimePeriod': timePeriod,
    };
  }
}

/// Specific coverage percentage, On-Demand costs, and spend covered by Savings
/// Plans, and total Savings Plans costs for an account.
class SavingsPlansCoverageData {
  /// The percentage of your existing Savings Plans covered usage, divided by all
  /// of your eligible Savings Plans usage in an account (or set of accounts).
  final String? coveragePercentage;

  /// The cost of your Amazon Web Services usage at the public On-Demand rate.
  final String? onDemandCost;

  /// The amount of your Amazon Web Services usage that's covered by a Savings
  /// Plans.
  final String? spendCoveredBySavingsPlans;

  /// The total cost of your Amazon Web Services usage, regardless of your
  /// purchase option.
  final String? totalCost;

  SavingsPlansCoverageData({
    this.coveragePercentage,
    this.onDemandCost,
    this.spendCoveredBySavingsPlans,
    this.totalCost,
  });

  factory SavingsPlansCoverageData.fromJson(Map<String, dynamic> json) {
    return SavingsPlansCoverageData(
      coveragePercentage: json['CoveragePercentage'] as String?,
      onDemandCost: json['OnDemandCost'] as String?,
      spendCoveredBySavingsPlans: json['SpendCoveredBySavingsPlans'] as String?,
      totalCost: json['TotalCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coveragePercentage = this.coveragePercentage;
    final onDemandCost = this.onDemandCost;
    final spendCoveredBySavingsPlans = this.spendCoveredBySavingsPlans;
    final totalCost = this.totalCost;
    return {
      if (coveragePercentage != null) 'CoveragePercentage': coveragePercentage,
      if (onDemandCost != null) 'OnDemandCost': onDemandCost,
      if (spendCoveredBySavingsPlans != null)
        'SpendCoveredBySavingsPlans': spendCoveredBySavingsPlans,
      if (totalCost != null) 'TotalCost': totalCost,
    };
  }
}

enum SavingsPlansDataType {
  attributes,
  utilization,
  amortizedCommitment,
  savings,
}

extension SavingsPlansDataTypeValueExtension on SavingsPlansDataType {
  String toValue() {
    switch (this) {
      case SavingsPlansDataType.attributes:
        return 'ATTRIBUTES';
      case SavingsPlansDataType.utilization:
        return 'UTILIZATION';
      case SavingsPlansDataType.amortizedCommitment:
        return 'AMORTIZED_COMMITMENT';
      case SavingsPlansDataType.savings:
        return 'SAVINGS';
    }
  }
}

extension SavingsPlansDataTypeFromString on String {
  SavingsPlansDataType toSavingsPlansDataType() {
    switch (this) {
      case 'ATTRIBUTES':
        return SavingsPlansDataType.attributes;
      case 'UTILIZATION':
        return SavingsPlansDataType.utilization;
      case 'AMORTIZED_COMMITMENT':
        return SavingsPlansDataType.amortizedCommitment;
      case 'SAVINGS':
        return SavingsPlansDataType.savings;
    }
    throw Exception('$this is not known in enum SavingsPlansDataType');
  }
}

/// The attribute details on a specific Savings Plan.
class SavingsPlansDetails {
  /// A group of instance types that Savings Plans applies to.
  final String? instanceFamily;

  /// The unique ID that's used to distinguish Savings Plans from one another.
  final String? offeringId;

  /// A collection of Amazon Web Services resources in a geographic area. Each
  /// Amazon Web Services Region is isolated and independent of the other Regions.
  final String? region;

  SavingsPlansDetails({
    this.instanceFamily,
    this.offeringId,
    this.region,
  });

  factory SavingsPlansDetails.fromJson(Map<String, dynamic> json) {
    return SavingsPlansDetails(
      instanceFamily: json['InstanceFamily'] as String?,
      offeringId: json['OfferingId'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceFamily = this.instanceFamily;
    final offeringId = this.offeringId;
    final region = this.region;
    return {
      if (instanceFamily != null) 'InstanceFamily': instanceFamily,
      if (offeringId != null) 'OfferingId': offeringId,
      if (region != null) 'Region': region,
    };
  }
}

/// Contains your request parameters, Savings Plan Recommendations Summary, and
/// Details.
class SavingsPlansPurchaseRecommendation {
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations that include the management account and
  /// member accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual member
  /// accounts only.
  final AccountScope? accountScope;

  /// The lookback period in days that's used to generate the recommendation.
  final LookbackPeriodInDays? lookbackPeriodInDays;

  /// The payment option that's used to generate the recommendation.
  final PaymentOption? paymentOption;

  /// Details for the Savings Plans that we recommend that you purchase to cover
  /// existing Savings Plans eligible workloads.
  final List<SavingsPlansPurchaseRecommendationDetail>?
      savingsPlansPurchaseRecommendationDetails;

  /// Summary metrics for your Savings Plans Recommendations.
  final SavingsPlansPurchaseRecommendationSummary?
      savingsPlansPurchaseRecommendationSummary;

  /// The requested Savings Plans recommendation type.
  final SupportedSavingsPlansType? savingsPlansType;

  /// The Savings Plans recommendation term in years. It's used to generate the
  /// recommendation.
  final TermInYears? termInYears;

  SavingsPlansPurchaseRecommendation({
    this.accountScope,
    this.lookbackPeriodInDays,
    this.paymentOption,
    this.savingsPlansPurchaseRecommendationDetails,
    this.savingsPlansPurchaseRecommendationSummary,
    this.savingsPlansType,
    this.termInYears,
  });

  factory SavingsPlansPurchaseRecommendation.fromJson(
      Map<String, dynamic> json) {
    return SavingsPlansPurchaseRecommendation(
      accountScope: (json['AccountScope'] as String?)?.toAccountScope(),
      lookbackPeriodInDays:
          (json['LookbackPeriodInDays'] as String?)?.toLookbackPeriodInDays(),
      paymentOption: (json['PaymentOption'] as String?)?.toPaymentOption(),
      savingsPlansPurchaseRecommendationDetails:
          (json['SavingsPlansPurchaseRecommendationDetails'] as List?)
              ?.whereNotNull()
              .map((e) => SavingsPlansPurchaseRecommendationDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      savingsPlansPurchaseRecommendationSummary:
          json['SavingsPlansPurchaseRecommendationSummary'] != null
              ? SavingsPlansPurchaseRecommendationSummary.fromJson(
                  json['SavingsPlansPurchaseRecommendationSummary']
                      as Map<String, dynamic>)
              : null,
      savingsPlansType:
          (json['SavingsPlansType'] as String?)?.toSupportedSavingsPlansType(),
      termInYears: (json['TermInYears'] as String?)?.toTermInYears(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final lookbackPeriodInDays = this.lookbackPeriodInDays;
    final paymentOption = this.paymentOption;
    final savingsPlansPurchaseRecommendationDetails =
        this.savingsPlansPurchaseRecommendationDetails;
    final savingsPlansPurchaseRecommendationSummary =
        this.savingsPlansPurchaseRecommendationSummary;
    final savingsPlansType = this.savingsPlansType;
    final termInYears = this.termInYears;
    return {
      if (accountScope != null) 'AccountScope': accountScope.toValue(),
      if (lookbackPeriodInDays != null)
        'LookbackPeriodInDays': lookbackPeriodInDays.toValue(),
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (savingsPlansPurchaseRecommendationDetails != null)
        'SavingsPlansPurchaseRecommendationDetails':
            savingsPlansPurchaseRecommendationDetails,
      if (savingsPlansPurchaseRecommendationSummary != null)
        'SavingsPlansPurchaseRecommendationSummary':
            savingsPlansPurchaseRecommendationSummary,
      if (savingsPlansType != null)
        'SavingsPlansType': savingsPlansType.toValue(),
      if (termInYears != null) 'TermInYears': termInYears.toValue(),
    };
  }
}

/// Details for your recommended Savings Plans.
class SavingsPlansPurchaseRecommendationDetail {
  /// The <code>AccountID</code> the recommendation is generated for.
  final String? accountId;

  /// The currency code that Amazon Web Services used to generate the
  /// recommendations and present potential savings.
  final String? currencyCode;

  /// The average value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentAverageHourlyOnDemandSpend;

  /// The highest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentMaximumHourlyOnDemandSpend;

  /// The lowest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  final String? currentMinimumHourlyOnDemandSpend;

  /// The estimated utilization of the recommended Savings Plans.
  final String? estimatedAverageUtilization;

  /// The estimated monthly savings amount based on the recommended Savings Plans.
  final String? estimatedMonthlySavingsAmount;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// Savings Plans, over the length of the lookback period.
  final String? estimatedOnDemandCost;

  /// The estimated On-Demand costs you expect with no additional commitment,
  /// based on your usage of the selected time period and the Savings Plans you
  /// own.
  final String? estimatedOnDemandCostWithCurrentCommitment;

  /// The estimated return on investment that's based on the recommended Savings
  /// Plans that you purchased. This is calculated as
  /// <code>estimatedSavingsAmount</code>/ <code>estimatedSPCost</code>*100.
  final String? estimatedROI;

  /// The cost of the recommended Savings Plans over the length of the lookback
  /// period.
  final String? estimatedSPCost;

  /// The estimated savings amount that's based on the recommended Savings Plans
  /// over the length of the lookback period.
  final String? estimatedSavingsAmount;

  /// The estimated savings percentage relative to the total cost of applicable
  /// On-Demand usage over the lookback period.
  final String? estimatedSavingsPercentage;

  /// The recommended hourly commitment level for the Savings Plans type and the
  /// configuration that's based on the usage during the lookback period.
  final String? hourlyCommitmentToPurchase;

  /// Contains detailed information about a specific Savings Plan recommendation.
  final String? recommendationDetailId;

  /// Details for your recommended Savings Plans.
  final SavingsPlansDetails? savingsPlansDetails;

  /// The upfront cost of the recommended Savings Plans, based on the selected
  /// payment option.
  final String? upfrontCost;

  SavingsPlansPurchaseRecommendationDetail({
    this.accountId,
    this.currencyCode,
    this.currentAverageHourlyOnDemandSpend,
    this.currentMaximumHourlyOnDemandSpend,
    this.currentMinimumHourlyOnDemandSpend,
    this.estimatedAverageUtilization,
    this.estimatedMonthlySavingsAmount,
    this.estimatedOnDemandCost,
    this.estimatedOnDemandCostWithCurrentCommitment,
    this.estimatedROI,
    this.estimatedSPCost,
    this.estimatedSavingsAmount,
    this.estimatedSavingsPercentage,
    this.hourlyCommitmentToPurchase,
    this.recommendationDetailId,
    this.savingsPlansDetails,
    this.upfrontCost,
  });

  factory SavingsPlansPurchaseRecommendationDetail.fromJson(
      Map<String, dynamic> json) {
    return SavingsPlansPurchaseRecommendationDetail(
      accountId: json['AccountId'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      currentAverageHourlyOnDemandSpend:
          json['CurrentAverageHourlyOnDemandSpend'] as String?,
      currentMaximumHourlyOnDemandSpend:
          json['CurrentMaximumHourlyOnDemandSpend'] as String?,
      currentMinimumHourlyOnDemandSpend:
          json['CurrentMinimumHourlyOnDemandSpend'] as String?,
      estimatedAverageUtilization:
          json['EstimatedAverageUtilization'] as String?,
      estimatedMonthlySavingsAmount:
          json['EstimatedMonthlySavingsAmount'] as String?,
      estimatedOnDemandCost: json['EstimatedOnDemandCost'] as String?,
      estimatedOnDemandCostWithCurrentCommitment:
          json['EstimatedOnDemandCostWithCurrentCommitment'] as String?,
      estimatedROI: json['EstimatedROI'] as String?,
      estimatedSPCost: json['EstimatedSPCost'] as String?,
      estimatedSavingsAmount: json['EstimatedSavingsAmount'] as String?,
      estimatedSavingsPercentage: json['EstimatedSavingsPercentage'] as String?,
      hourlyCommitmentToPurchase: json['HourlyCommitmentToPurchase'] as String?,
      recommendationDetailId: json['RecommendationDetailId'] as String?,
      savingsPlansDetails: json['SavingsPlansDetails'] != null
          ? SavingsPlansDetails.fromJson(
              json['SavingsPlansDetails'] as Map<String, dynamic>)
          : null,
      upfrontCost: json['UpfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final currencyCode = this.currencyCode;
    final currentAverageHourlyOnDemandSpend =
        this.currentAverageHourlyOnDemandSpend;
    final currentMaximumHourlyOnDemandSpend =
        this.currentMaximumHourlyOnDemandSpend;
    final currentMinimumHourlyOnDemandSpend =
        this.currentMinimumHourlyOnDemandSpend;
    final estimatedAverageUtilization = this.estimatedAverageUtilization;
    final estimatedMonthlySavingsAmount = this.estimatedMonthlySavingsAmount;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final estimatedOnDemandCostWithCurrentCommitment =
        this.estimatedOnDemandCostWithCurrentCommitment;
    final estimatedROI = this.estimatedROI;
    final estimatedSPCost = this.estimatedSPCost;
    final estimatedSavingsAmount = this.estimatedSavingsAmount;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final hourlyCommitmentToPurchase = this.hourlyCommitmentToPurchase;
    final recommendationDetailId = this.recommendationDetailId;
    final savingsPlansDetails = this.savingsPlansDetails;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (currentAverageHourlyOnDemandSpend != null)
        'CurrentAverageHourlyOnDemandSpend': currentAverageHourlyOnDemandSpend,
      if (currentMaximumHourlyOnDemandSpend != null)
        'CurrentMaximumHourlyOnDemandSpend': currentMaximumHourlyOnDemandSpend,
      if (currentMinimumHourlyOnDemandSpend != null)
        'CurrentMinimumHourlyOnDemandSpend': currentMinimumHourlyOnDemandSpend,
      if (estimatedAverageUtilization != null)
        'EstimatedAverageUtilization': estimatedAverageUtilization,
      if (estimatedMonthlySavingsAmount != null)
        'EstimatedMonthlySavingsAmount': estimatedMonthlySavingsAmount,
      if (estimatedOnDemandCost != null)
        'EstimatedOnDemandCost': estimatedOnDemandCost,
      if (estimatedOnDemandCostWithCurrentCommitment != null)
        'EstimatedOnDemandCostWithCurrentCommitment':
            estimatedOnDemandCostWithCurrentCommitment,
      if (estimatedROI != null) 'EstimatedROI': estimatedROI,
      if (estimatedSPCost != null) 'EstimatedSPCost': estimatedSPCost,
      if (estimatedSavingsAmount != null)
        'EstimatedSavingsAmount': estimatedSavingsAmount,
      if (estimatedSavingsPercentage != null)
        'EstimatedSavingsPercentage': estimatedSavingsPercentage,
      if (hourlyCommitmentToPurchase != null)
        'HourlyCommitmentToPurchase': hourlyCommitmentToPurchase,
      if (recommendationDetailId != null)
        'RecommendationDetailId': recommendationDetailId,
      if (savingsPlansDetails != null)
        'SavingsPlansDetails': savingsPlansDetails,
      if (upfrontCost != null) 'UpfrontCost': upfrontCost,
    };
  }
}

/// Metadata about your Savings Plans Purchase Recommendations.
class SavingsPlansPurchaseRecommendationMetadata {
  /// Additional metadata that might be applicable to the recommendation.
  final String? additionalMetadata;

  /// The timestamp that shows when the recommendations were generated.
  final String? generationTimestamp;

  /// The unique identifier for the recommendation set.
  final String? recommendationId;

  SavingsPlansPurchaseRecommendationMetadata({
    this.additionalMetadata,
    this.generationTimestamp,
    this.recommendationId,
  });

  factory SavingsPlansPurchaseRecommendationMetadata.fromJson(
      Map<String, dynamic> json) {
    return SavingsPlansPurchaseRecommendationMetadata(
      additionalMetadata: json['AdditionalMetadata'] as String?,
      generationTimestamp: json['GenerationTimestamp'] as String?,
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalMetadata = this.additionalMetadata;
    final generationTimestamp = this.generationTimestamp;
    final recommendationId = this.recommendationId;
    return {
      if (additionalMetadata != null) 'AdditionalMetadata': additionalMetadata,
      if (generationTimestamp != null)
        'GenerationTimestamp': generationTimestamp,
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

/// Summary metrics for your Savings Plans Purchase Recommendations.
class SavingsPlansPurchaseRecommendationSummary {
  /// The currency code that Amazon Web Services used to generate the
  /// recommendations and present potential savings.
  final String? currencyCode;

  /// The current total on demand spend of the applicable usage types over the
  /// lookback period.
  final String? currentOnDemandSpend;

  /// The recommended Savings Plans cost on a daily (24 hourly) basis.
  final String? dailyCommitmentToPurchase;

  /// The estimated monthly savings amount that's based on the recommended Savings
  /// Plans purchase.
  final String? estimatedMonthlySavingsAmount;

  /// The estimated On-Demand costs you expect with no additional commitment. It's
  /// based on your usage of the selected time period and the Savings Plans you
  /// own.
  final String? estimatedOnDemandCostWithCurrentCommitment;

  /// The estimated return on investment that's based on the recommended Savings
  /// Plans and estimated savings.
  final String? estimatedROI;

  /// The estimated total savings over the lookback period, based on the purchase
  /// of the recommended Savings Plans.
  final String? estimatedSavingsAmount;

  /// The estimated savings relative to the total cost of On-Demand usage, over
  /// the lookback period. This is calculated as
  /// <code>estimatedSavingsAmount</code>/ <code>CurrentOnDemandSpend</code>*100.
  final String? estimatedSavingsPercentage;

  /// The estimated total cost of the usage after purchasing the recommended
  /// Savings Plans. This is a sum of the cost of Savings Plans during this term,
  /// and the remaining On-Demand usage.
  final String? estimatedTotalCost;

  /// The recommended hourly commitment that's based on the recommendation
  /// parameters.
  final String? hourlyCommitmentToPurchase;

  /// The aggregate number of Savings Plans recommendations that exist for your
  /// account.
  final String? totalRecommendationCount;

  SavingsPlansPurchaseRecommendationSummary({
    this.currencyCode,
    this.currentOnDemandSpend,
    this.dailyCommitmentToPurchase,
    this.estimatedMonthlySavingsAmount,
    this.estimatedOnDemandCostWithCurrentCommitment,
    this.estimatedROI,
    this.estimatedSavingsAmount,
    this.estimatedSavingsPercentage,
    this.estimatedTotalCost,
    this.hourlyCommitmentToPurchase,
    this.totalRecommendationCount,
  });

  factory SavingsPlansPurchaseRecommendationSummary.fromJson(
      Map<String, dynamic> json) {
    return SavingsPlansPurchaseRecommendationSummary(
      currencyCode: json['CurrencyCode'] as String?,
      currentOnDemandSpend: json['CurrentOnDemandSpend'] as String?,
      dailyCommitmentToPurchase: json['DailyCommitmentToPurchase'] as String?,
      estimatedMonthlySavingsAmount:
          json['EstimatedMonthlySavingsAmount'] as String?,
      estimatedOnDemandCostWithCurrentCommitment:
          json['EstimatedOnDemandCostWithCurrentCommitment'] as String?,
      estimatedROI: json['EstimatedROI'] as String?,
      estimatedSavingsAmount: json['EstimatedSavingsAmount'] as String?,
      estimatedSavingsPercentage: json['EstimatedSavingsPercentage'] as String?,
      estimatedTotalCost: json['EstimatedTotalCost'] as String?,
      hourlyCommitmentToPurchase: json['HourlyCommitmentToPurchase'] as String?,
      totalRecommendationCount: json['TotalRecommendationCount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final currentOnDemandSpend = this.currentOnDemandSpend;
    final dailyCommitmentToPurchase = this.dailyCommitmentToPurchase;
    final estimatedMonthlySavingsAmount = this.estimatedMonthlySavingsAmount;
    final estimatedOnDemandCostWithCurrentCommitment =
        this.estimatedOnDemandCostWithCurrentCommitment;
    final estimatedROI = this.estimatedROI;
    final estimatedSavingsAmount = this.estimatedSavingsAmount;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final estimatedTotalCost = this.estimatedTotalCost;
    final hourlyCommitmentToPurchase = this.hourlyCommitmentToPurchase;
    final totalRecommendationCount = this.totalRecommendationCount;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (currentOnDemandSpend != null)
        'CurrentOnDemandSpend': currentOnDemandSpend,
      if (dailyCommitmentToPurchase != null)
        'DailyCommitmentToPurchase': dailyCommitmentToPurchase,
      if (estimatedMonthlySavingsAmount != null)
        'EstimatedMonthlySavingsAmount': estimatedMonthlySavingsAmount,
      if (estimatedOnDemandCostWithCurrentCommitment != null)
        'EstimatedOnDemandCostWithCurrentCommitment':
            estimatedOnDemandCostWithCurrentCommitment,
      if (estimatedROI != null) 'EstimatedROI': estimatedROI,
      if (estimatedSavingsAmount != null)
        'EstimatedSavingsAmount': estimatedSavingsAmount,
      if (estimatedSavingsPercentage != null)
        'EstimatedSavingsPercentage': estimatedSavingsPercentage,
      if (estimatedTotalCost != null) 'EstimatedTotalCost': estimatedTotalCost,
      if (hourlyCommitmentToPurchase != null)
        'HourlyCommitmentToPurchase': hourlyCommitmentToPurchase,
      if (totalRecommendationCount != null)
        'TotalRecommendationCount': totalRecommendationCount,
    };
  }
}

/// The amount of savings that you're accumulating, against the public On-Demand
/// rate of the usage accrued in an account.
class SavingsPlansSavings {
  /// The savings amount that you're accumulating for the usage that's covered by
  /// a Savings Plans, when compared to the On-Demand equivalent of the same
  /// usage.
  final String? netSavings;

  /// How much the amount that the usage would have cost if it was accrued at the
  /// On-Demand rate.
  final String? onDemandCostEquivalent;

  SavingsPlansSavings({
    this.netSavings,
    this.onDemandCostEquivalent,
  });

  factory SavingsPlansSavings.fromJson(Map<String, dynamic> json) {
    return SavingsPlansSavings(
      netSavings: json['NetSavings'] as String?,
      onDemandCostEquivalent: json['OnDemandCostEquivalent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final netSavings = this.netSavings;
    final onDemandCostEquivalent = this.onDemandCostEquivalent;
    return {
      if (netSavings != null) 'NetSavings': netSavings,
      if (onDemandCostEquivalent != null)
        'OnDemandCostEquivalent': onDemandCostEquivalent,
    };
  }
}

/// The measurement of how well you're using your existing Savings Plans.
class SavingsPlansUtilization {
  /// The total amount of Savings Plans commitment that's been purchased in an
  /// account (or set of accounts).
  final String? totalCommitment;

  /// The amount of your Savings Plans commitment that wasn't consumed from
  /// Savings Plans eligible usage in a specific period.
  final String? unusedCommitment;

  /// The amount of your Savings Plans commitment that was consumed from Savings
  /// Plans eligible usage in a specific period.
  final String? usedCommitment;

  /// The amount of <code>UsedCommitment</code> divided by the
  /// <code>TotalCommitment</code> for your Savings Plans.
  final String? utilizationPercentage;

  SavingsPlansUtilization({
    this.totalCommitment,
    this.unusedCommitment,
    this.usedCommitment,
    this.utilizationPercentage,
  });

  factory SavingsPlansUtilization.fromJson(Map<String, dynamic> json) {
    return SavingsPlansUtilization(
      totalCommitment: json['TotalCommitment'] as String?,
      unusedCommitment: json['UnusedCommitment'] as String?,
      usedCommitment: json['UsedCommitment'] as String?,
      utilizationPercentage: json['UtilizationPercentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalCommitment = this.totalCommitment;
    final unusedCommitment = this.unusedCommitment;
    final usedCommitment = this.usedCommitment;
    final utilizationPercentage = this.utilizationPercentage;
    return {
      if (totalCommitment != null) 'TotalCommitment': totalCommitment,
      if (unusedCommitment != null) 'UnusedCommitment': unusedCommitment,
      if (usedCommitment != null) 'UsedCommitment': usedCommitment,
      if (utilizationPercentage != null)
        'UtilizationPercentage': utilizationPercentage,
    };
  }
}

/// The aggregated utilization metrics for your Savings Plans usage.
class SavingsPlansUtilizationAggregates {
  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  final SavingsPlansUtilization utilization;

  /// The total amortized commitment for a Savings Plans. This includes the sum of
  /// the upfront and recurring Savings Plans fees.
  final SavingsPlansAmortizedCommitment? amortizedCommitment;

  /// The amount that's saved by using existing Savings Plans. Savings returns
  /// both net savings from Savings Plans and also the
  /// <code>onDemandCostEquivalent</code> of the Savings Plans when considering
  /// the utilization rate.
  final SavingsPlansSavings? savings;

  SavingsPlansUtilizationAggregates({
    required this.utilization,
    this.amortizedCommitment,
    this.savings,
  });

  factory SavingsPlansUtilizationAggregates.fromJson(
      Map<String, dynamic> json) {
    return SavingsPlansUtilizationAggregates(
      utilization: SavingsPlansUtilization.fromJson(
          json['Utilization'] as Map<String, dynamic>),
      amortizedCommitment: json['AmortizedCommitment'] != null
          ? SavingsPlansAmortizedCommitment.fromJson(
              json['AmortizedCommitment'] as Map<String, dynamic>)
          : null,
      savings: json['Savings'] != null
          ? SavingsPlansSavings.fromJson(
              json['Savings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final utilization = this.utilization;
    final amortizedCommitment = this.amortizedCommitment;
    final savings = this.savings;
    return {
      'Utilization': utilization,
      if (amortizedCommitment != null)
        'AmortizedCommitment': amortizedCommitment,
      if (savings != null) 'Savings': savings,
    };
  }
}

/// The amount of Savings Plans utilization (in hours).
class SavingsPlansUtilizationByTime {
  final DateInterval timePeriod;

  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  final SavingsPlansUtilization utilization;

  /// The total amortized commitment for a Savings Plans. This includes the sum of
  /// the upfront and recurring Savings Plans fees.
  final SavingsPlansAmortizedCommitment? amortizedCommitment;

  /// The amount that's saved by using existing Savings Plans. Savings returns
  /// both net savings from Savings Plans and also the
  /// <code>onDemandCostEquivalent</code> of the Savings Plans when considering
  /// the utilization rate.
  final SavingsPlansSavings? savings;

  SavingsPlansUtilizationByTime({
    required this.timePeriod,
    required this.utilization,
    this.amortizedCommitment,
    this.savings,
  });

  factory SavingsPlansUtilizationByTime.fromJson(Map<String, dynamic> json) {
    return SavingsPlansUtilizationByTime(
      timePeriod:
          DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>),
      utilization: SavingsPlansUtilization.fromJson(
          json['Utilization'] as Map<String, dynamic>),
      amortizedCommitment: json['AmortizedCommitment'] != null
          ? SavingsPlansAmortizedCommitment.fromJson(
              json['AmortizedCommitment'] as Map<String, dynamic>)
          : null,
      savings: json['Savings'] != null
          ? SavingsPlansSavings.fromJson(
              json['Savings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timePeriod = this.timePeriod;
    final utilization = this.utilization;
    final amortizedCommitment = this.amortizedCommitment;
    final savings = this.savings;
    return {
      'TimePeriod': timePeriod,
      'Utilization': utilization,
      if (amortizedCommitment != null)
        'AmortizedCommitment': amortizedCommitment,
      if (savings != null) 'Savings': savings,
    };
  }
}

/// A single daily or monthly Savings Plans utilization rate and details for
/// your account. A management account in an organization have access to member
/// accounts. You can use <code>GetDimensionValues</code> to determine the
/// possible dimension values.
class SavingsPlansUtilizationDetail {
  /// The total amortized commitment for a Savings Plans. Includes the sum of the
  /// upfront and recurring Savings Plans fees.
  final SavingsPlansAmortizedCommitment? amortizedCommitment;

  /// The attribute that applies to a specific <code>Dimension</code>.
  final Map<String, String>? attributes;

  /// The amount saved by using existing Savings Plans. Savings returns both net
  /// savings from savings plans and also the <code>onDemandCostEquivalent</code>
  /// of the Savings Plans when considering the utilization rate.
  final SavingsPlansSavings? savings;

  /// The unique Amazon Resource Name (ARN) for a particular Savings Plan.
  final String? savingsPlanArn;

  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  final SavingsPlansUtilization? utilization;

  SavingsPlansUtilizationDetail({
    this.amortizedCommitment,
    this.attributes,
    this.savings,
    this.savingsPlanArn,
    this.utilization,
  });

  factory SavingsPlansUtilizationDetail.fromJson(Map<String, dynamic> json) {
    return SavingsPlansUtilizationDetail(
      amortizedCommitment: json['AmortizedCommitment'] != null
          ? SavingsPlansAmortizedCommitment.fromJson(
              json['AmortizedCommitment'] as Map<String, dynamic>)
          : null,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      savings: json['Savings'] != null
          ? SavingsPlansSavings.fromJson(
              json['Savings'] as Map<String, dynamic>)
          : null,
      savingsPlanArn: json['SavingsPlanArn'] as String?,
      utilization: json['Utilization'] != null
          ? SavingsPlansUtilization.fromJson(
              json['Utilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amortizedCommitment = this.amortizedCommitment;
    final attributes = this.attributes;
    final savings = this.savings;
    final savingsPlanArn = this.savingsPlanArn;
    final utilization = this.utilization;
    return {
      if (amortizedCommitment != null)
        'AmortizedCommitment': amortizedCommitment,
      if (attributes != null) 'Attributes': attributes,
      if (savings != null) 'Savings': savings,
      if (savingsPlanArn != null) 'SavingsPlanArn': savingsPlanArn,
      if (utilization != null) 'Utilization': utilization,
    };
  }
}

/// Hardware specifications for the service that you want recommendations for.
class ServiceSpecification {
  /// The Amazon EC2 hardware specifications that you want Amazon Web Services to
  /// provide recommendations for.
  final EC2Specification? eC2Specification;

  ServiceSpecification({
    this.eC2Specification,
  });

  factory ServiceSpecification.fromJson(Map<String, dynamic> json) {
    return ServiceSpecification(
      eC2Specification: json['EC2Specification'] != null
          ? EC2Specification.fromJson(
              json['EC2Specification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2Specification = this.eC2Specification;
    return {
      if (eC2Specification != null) 'EC2Specification': eC2Specification,
    };
  }
}

/// The details for how to sort the data.
class SortDefinition {
  /// The key that's used to sort the data.
  final String key;

  /// The order that's used to sort the data.
  final SortOrder? sortOrder;

  SortDefinition({
    required this.key,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final sortOrder = this.sortOrder;
    return {
      'Key': key,
      if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StartCostAllocationTagBackfillResponse {
  /// An object containing detailed metadata of your new backfill request.
  final CostAllocationTagBackfillRequest? backfillRequest;

  StartCostAllocationTagBackfillResponse({
    this.backfillRequest,
  });

  factory StartCostAllocationTagBackfillResponse.fromJson(
      Map<String, dynamic> json) {
    return StartCostAllocationTagBackfillResponse(
      backfillRequest: json['BackfillRequest'] != null
          ? CostAllocationTagBackfillRequest.fromJson(
              json['BackfillRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backfillRequest = this.backfillRequest;
    return {
      if (backfillRequest != null) 'BackfillRequest': backfillRequest,
    };
  }
}

class StartSavingsPlansPurchaseRecommendationGenerationResponse {
  /// The estimated time for when the recommendation generation will complete.
  final String? estimatedCompletionTime;

  /// The start time of the recommendation generation.
  final String? generationStartedTime;

  /// The ID for this specific recommendation.
  final String? recommendationId;

  StartSavingsPlansPurchaseRecommendationGenerationResponse({
    this.estimatedCompletionTime,
    this.generationStartedTime,
    this.recommendationId,
  });

  factory StartSavingsPlansPurchaseRecommendationGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSavingsPlansPurchaseRecommendationGenerationResponse(
      estimatedCompletionTime: json['EstimatedCompletionTime'] as String?,
      generationStartedTime: json['GenerationStartedTime'] as String?,
      recommendationId: json['RecommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedCompletionTime = this.estimatedCompletionTime;
    final generationStartedTime = this.generationStartedTime;
    final recommendationId = this.recommendationId;
    return {
      if (estimatedCompletionTime != null)
        'EstimatedCompletionTime': estimatedCompletionTime,
      if (generationStartedTime != null)
        'GenerationStartedTime': generationStartedTime,
      if (recommendationId != null) 'RecommendationId': recommendationId,
    };
  }
}

/// The recipient of <code>AnomalySubscription</code> notifications.
class Subscriber {
  /// The email address or SNS Amazon Resource Name (ARN). This depends on the
  /// <code>Type</code>.
  final String? address;

  /// Indicates if the subscriber accepts the notifications.
  final SubscriberStatus? status;

  /// The notification delivery channel.
  final SubscriberType? type;

  Subscriber({
    this.address,
    this.status,
    this.type,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) {
    return Subscriber(
      address: json['Address'] as String?,
      status: (json['Status'] as String?)?.toSubscriberStatus(),
      type: (json['Type'] as String?)?.toSubscriberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final status = this.status;
    final type = this.type;
    return {
      if (address != null) 'Address': address,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum SubscriberStatus {
  confirmed,
  declined,
}

extension SubscriberStatusValueExtension on SubscriberStatus {
  String toValue() {
    switch (this) {
      case SubscriberStatus.confirmed:
        return 'CONFIRMED';
      case SubscriberStatus.declined:
        return 'DECLINED';
    }
  }
}

extension SubscriberStatusFromString on String {
  SubscriberStatus toSubscriberStatus() {
    switch (this) {
      case 'CONFIRMED':
        return SubscriberStatus.confirmed;
      case 'DECLINED':
        return SubscriberStatus.declined;
    }
    throw Exception('$this is not known in enum SubscriberStatus');
  }
}

enum SubscriberType {
  email,
  sns,
}

extension SubscriberTypeValueExtension on SubscriberType {
  String toValue() {
    switch (this) {
      case SubscriberType.email:
        return 'EMAIL';
      case SubscriberType.sns:
        return 'SNS';
    }
  }
}

extension SubscriberTypeFromString on String {
  SubscriberType toSubscriberType() {
    switch (this) {
      case 'EMAIL':
        return SubscriberType.email;
      case 'SNS':
        return SubscriberType.sns;
    }
    throw Exception('$this is not known in enum SubscriberType');
  }
}

enum SupportedSavingsPlansType {
  computeSp,
  ec2InstanceSp,
  sagemakerSp,
}

extension SupportedSavingsPlansTypeValueExtension on SupportedSavingsPlansType {
  String toValue() {
    switch (this) {
      case SupportedSavingsPlansType.computeSp:
        return 'COMPUTE_SP';
      case SupportedSavingsPlansType.ec2InstanceSp:
        return 'EC2_INSTANCE_SP';
      case SupportedSavingsPlansType.sagemakerSp:
        return 'SAGEMAKER_SP';
    }
  }
}

extension SupportedSavingsPlansTypeFromString on String {
  SupportedSavingsPlansType toSupportedSavingsPlansType() {
    switch (this) {
      case 'COMPUTE_SP':
        return SupportedSavingsPlansType.computeSp;
      case 'EC2_INSTANCE_SP':
        return SupportedSavingsPlansType.ec2InstanceSp;
      case 'SAGEMAKER_SP':
        return SupportedSavingsPlansType.sagemakerSp;
    }
    throw Exception('$this is not known in enum SupportedSavingsPlansType');
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

/// The values that are available for a tag.
///
/// If <code>Values</code> and <code>Key</code> aren't specified, the
/// <code>ABSENT</code> <code>MatchOption</code> is applied to all tags. That
/// is, it's filtered on resources with no tags.
///
/// If <code>Key</code> is provided and <code>Values</code> isn't specified, the
/// <code>ABSENT</code> <code>MatchOption</code> is applied to the tag
/// <code>Key</code> only. That is, it's filtered on resources without the given
/// tag key.
class TagValues {
  /// The key for the tag.
  final String? key;

  /// The match options that you can use to filter your results.
  /// <code>MatchOptions</code> is only applicable for actions related to Cost
  /// Category. The default values for <code>MatchOptions</code> are
  /// <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.
  final List<MatchOption>? matchOptions;

  /// The specific value of the tag.
  final List<String>? values;

  TagValues({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory TagValues.fromJson(Map<String, dynamic> json) {
    return TagValues(
      key: json['Key'] as String?,
      matchOptions: (json['MatchOptions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMatchOption())
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (matchOptions != null)
        'MatchOptions': matchOptions.map((e) => e.toValue()).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// Details on recommended instance.
class TargetInstance {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  final String? currencyCode;

  /// Determines whether this recommendation is the defaulted Amazon Web Services
  /// recommendation.
  final bool? defaultTargetInstance;

  /// The expected cost to operate this instance type on a monthly basis.
  final String? estimatedMonthlyCost;

  /// The estimated savings that result from modification, on a monthly basis.
  final String? estimatedMonthlySavings;

  /// The expected utilization metrics for target instance type.
  final ResourceUtilization? expectedResourceUtilization;

  /// Explains the actions that you might need to take to successfully migrate
  /// your workloads from the current instance type to the recommended instance
  /// type.
  final List<PlatformDifference>? platformDifferences;

  /// Details on the target instance type.
  final ResourceDetails? resourceDetails;

  TargetInstance({
    this.currencyCode,
    this.defaultTargetInstance,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.expectedResourceUtilization,
    this.platformDifferences,
    this.resourceDetails,
  });

  factory TargetInstance.fromJson(Map<String, dynamic> json) {
    return TargetInstance(
      currencyCode: json['CurrencyCode'] as String?,
      defaultTargetInstance: json['DefaultTargetInstance'] as bool?,
      estimatedMonthlyCost: json['EstimatedMonthlyCost'] as String?,
      estimatedMonthlySavings: json['EstimatedMonthlySavings'] as String?,
      expectedResourceUtilization: json['ExpectedResourceUtilization'] != null
          ? ResourceUtilization.fromJson(
              json['ExpectedResourceUtilization'] as Map<String, dynamic>)
          : null,
      platformDifferences: (json['PlatformDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPlatformDifference())
          .toList(),
      resourceDetails: json['ResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['ResourceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final defaultTargetInstance = this.defaultTargetInstance;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final expectedResourceUtilization = this.expectedResourceUtilization;
    final platformDifferences = this.platformDifferences;
    final resourceDetails = this.resourceDetails;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (defaultTargetInstance != null)
        'DefaultTargetInstance': defaultTargetInstance,
      if (estimatedMonthlyCost != null)
        'EstimatedMonthlyCost': estimatedMonthlyCost,
      if (estimatedMonthlySavings != null)
        'EstimatedMonthlySavings': estimatedMonthlySavings,
      if (expectedResourceUtilization != null)
        'ExpectedResourceUtilization': expectedResourceUtilization,
      if (platformDifferences != null)
        'PlatformDifferences':
            platformDifferences.map((e) => e.toValue()).toList(),
      if (resourceDetails != null) 'ResourceDetails': resourceDetails,
    };
  }
}

enum TermInYears {
  oneYear,
  threeYears,
}

extension TermInYearsValueExtension on TermInYears {
  String toValue() {
    switch (this) {
      case TermInYears.oneYear:
        return 'ONE_YEAR';
      case TermInYears.threeYears:
        return 'THREE_YEARS';
    }
  }
}

extension TermInYearsFromString on String {
  TermInYears toTermInYears() {
    switch (this) {
      case 'ONE_YEAR':
        return TermInYears.oneYear;
      case 'THREE_YEARS':
        return TermInYears.threeYears;
    }
    throw Exception('$this is not known in enum TermInYears');
  }
}

/// Details on termination recommendation.
class TerminateRecommendationDetail {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  final String? currencyCode;

  /// The estimated savings that result from modification, on a monthly basis.
  final String? estimatedMonthlySavings;

  TerminateRecommendationDetail({
    this.currencyCode,
    this.estimatedMonthlySavings,
  });

  factory TerminateRecommendationDetail.fromJson(Map<String, dynamic> json) {
    return TerminateRecommendationDetail(
      currencyCode: json['CurrencyCode'] as String?,
      estimatedMonthlySavings: json['EstimatedMonthlySavings'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (estimatedMonthlySavings != null)
        'EstimatedMonthlySavings': estimatedMonthlySavings,
    };
  }
}

/// Filters cost anomalies based on the total impact.
class TotalImpactFilter {
  /// The comparing value that's used in the filter.
  final NumericOperator numericOperator;

  /// The lower bound dollar value that's used in the filter.
  final double startValue;

  /// The upper bound dollar value that's used in the filter.
  final double? endValue;

  TotalImpactFilter({
    required this.numericOperator,
    required this.startValue,
    this.endValue,
  });

  Map<String, dynamic> toJson() {
    final numericOperator = this.numericOperator;
    final startValue = this.startValue;
    final endValue = this.endValue;
    return {
      'NumericOperator': numericOperator.toValue(),
      'StartValue': startValue,
      if (endValue != null) 'EndValue': endValue,
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

class UpdateAnomalyMonitorResponse {
  /// A cost anomaly monitor ARN.
  final String monitorArn;

  UpdateAnomalyMonitorResponse({
    required this.monitorArn,
  });

  factory UpdateAnomalyMonitorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAnomalyMonitorResponse(
      monitorArn: json['MonitorArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    return {
      'MonitorArn': monitorArn,
    };
  }
}

class UpdateAnomalySubscriptionResponse {
  /// A cost anomaly subscription ARN.
  final String subscriptionArn;

  UpdateAnomalySubscriptionResponse({
    required this.subscriptionArn,
  });

  factory UpdateAnomalySubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAnomalySubscriptionResponse(
      subscriptionArn: json['SubscriptionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionArn = this.subscriptionArn;
    return {
      'SubscriptionArn': subscriptionArn,
    };
  }
}

/// Gives a detailed description of the result of an action. It's on each cost
/// allocation tag entry in the request.
class UpdateCostAllocationTagsStatusError {
  /// An error code representing why the action failed on this entry.
  final String? code;

  /// A message explaining why the action failed on this entry.
  final String? message;

  /// The key for the cost allocation tag.
  final String? tagKey;

  UpdateCostAllocationTagsStatusError({
    this.code,
    this.message,
    this.tagKey,
  });

  factory UpdateCostAllocationTagsStatusError.fromJson(
      Map<String, dynamic> json) {
    return UpdateCostAllocationTagsStatusError(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
      tagKey: json['TagKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final tagKey = this.tagKey;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
      if (tagKey != null) 'TagKey': tagKey,
    };
  }
}

class UpdateCostAllocationTagsStatusResponse {
  /// A list of <code>UpdateCostAllocationTagsStatusError</code> objects with
  /// error details about each cost allocation tag that can't be updated. If
  /// there's no failure, an empty array returns.
  final List<UpdateCostAllocationTagsStatusError>? errors;

  UpdateCostAllocationTagsStatusResponse({
    this.errors,
  });

  factory UpdateCostAllocationTagsStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCostAllocationTagsStatusResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateCostAllocationTagsStatusError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class UpdateCostCategoryDefinitionResponse {
  /// The unique identifier for your Cost Category.
  final String? costCategoryArn;

  /// The Cost Category's effective start date. It can only be a billing start
  /// date (first day of the month).
  final String? effectiveStart;

  UpdateCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveStart,
  });

  factory UpdateCostCategoryDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCostCategoryDefinitionResponse(
      costCategoryArn: json['CostCategoryArn'] as String?,
      effectiveStart: json['EffectiveStart'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategoryArn = this.costCategoryArn;
    final effectiveStart = this.effectiveStart;
    return {
      if (costCategoryArn != null) 'CostCategoryArn': costCategoryArn,
      if (effectiveStart != null) 'EffectiveStart': effectiveStart,
    };
  }
}

/// The amount of utilization, in hours.
class UtilizationByTime {
  /// The groups that this utilization result uses.
  final List<ReservationUtilizationGroup>? groups;

  /// The period of time that this utilization was used for.
  final DateInterval? timePeriod;

  /// The total number of reservation hours that were used.
  final ReservationAggregates? total;

  UtilizationByTime({
    this.groups,
    this.timePeriod,
    this.total,
  });

  factory UtilizationByTime.fromJson(Map<String, dynamic> json) {
    return UtilizationByTime(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReservationUtilizationGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timePeriod: json['TimePeriod'] != null
          ? DateInterval.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
      total: json['Total'] != null
          ? ReservationAggregates.fromJson(
              json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final timePeriod = this.timePeriod;
    final total = this.total;
    return {
      if (groups != null) 'Groups': groups,
      if (timePeriod != null) 'TimePeriod': timePeriod,
      if (total != null) 'Total': total,
    };
  }
}

class BackfillLimitExceededException extends _s.GenericAwsException {
  BackfillLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'BackfillLimitExceededException',
            message: message);
}

class BillExpirationException extends _s.GenericAwsException {
  BillExpirationException({String? type, String? message})
      : super(type: type, code: 'BillExpirationException', message: message);
}

class DataUnavailableException extends _s.GenericAwsException {
  DataUnavailableException({String? type, String? message})
      : super(type: type, code: 'DataUnavailableException', message: message);
}

class GenerationExistsException extends _s.GenericAwsException {
  GenerationExistsException({String? type, String? message})
      : super(type: type, code: 'GenerationExistsException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class RequestChangedException extends _s.GenericAwsException {
  RequestChangedException({String? type, String? message})
      : super(type: type, code: 'RequestChangedException', message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnknownMonitorException extends _s.GenericAwsException {
  UnknownMonitorException({String? type, String? message})
      : super(type: type, code: 'UnknownMonitorException', message: message);
}

class UnknownSubscriptionException extends _s.GenericAwsException {
  UnknownSubscriptionException({String? type, String? message})
      : super(
            type: type, code: 'UnknownSubscriptionException', message: message);
}

class UnresolvableUsageUnitException extends _s.GenericAwsException {
  UnresolvableUsageUnitException({String? type, String? message})
      : super(
            type: type,
            code: 'UnresolvableUsageUnitException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BackfillLimitExceededException': (type, message) =>
      BackfillLimitExceededException(type: type, message: message),
  'BillExpirationException': (type, message) =>
      BillExpirationException(type: type, message: message),
  'DataUnavailableException': (type, message) =>
      DataUnavailableException(type: type, message: message),
  'GenerationExistsException': (type, message) =>
      GenerationExistsException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'RequestChangedException': (type, message) =>
      RequestChangedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnknownMonitorException': (type, message) =>
      UnknownMonitorException(type: type, message: message),
  'UnknownSubscriptionException': (type, message) =>
      UnknownSubscriptionException(type: type, message: message),
  'UnresolvableUsageUnitException': (type, message) =>
      UnresolvableUsageUnitException(type: type, message: message),
};
