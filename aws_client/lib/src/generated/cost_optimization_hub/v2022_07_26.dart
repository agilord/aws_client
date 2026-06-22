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

import 'v2022_07_26.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Cost Optimization Hub API to programmatically identify,
/// filter, aggregate, and quantify savings for your cost optimization
/// recommendations across multiple Amazon Web Services Regions and Amazon Web
/// Services accounts in your organization.
///
/// The Cost Optimization Hub API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://cost-optimization-hub.us-east-1.amazonaws.com
/// </li>
/// </ul>
class CostOptimizationHub {
  final _s.JsonProtocol _protocol;
  factory CostOptimizationHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'cost-optimization-hub',
    );
    return CostOptimizationHub._(
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
  CostOptimizationHub._({
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

  /// Returns a set of preferences for an account in order to add
  /// account-specific preferences into the service. These preferences impact
  /// how the savings associated with recommendations are presented—estimated
  /// savings after discounts or estimated savings before discounts, for
  /// example.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetPreferencesResponse> getPreferences() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.GetPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Returns both the current and recommended resource configuration and the
  /// estimated cost impact for a recommendation.
  ///
  /// The <code>recommendationId</code> is only valid for up to a maximum of 24
  /// hours as recommendations are refreshed daily. To retrieve the
  /// <code>recommendationId</code>, use the <code>ListRecommendations</code>
  /// API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationId] :
  /// The ID for the recommendation.
  Future<GetRecommendationResponse> getRecommendation({
    required String recommendationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.GetRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendationId': recommendationId,
      },
    );

    return GetRecommendationResponse.fromJson(jsonResponse.body);
  }

  /// Returns cost efficiency metrics aggregated over time and optionally
  /// grouped by a specified dimension. The metrics provide insights into your
  /// cost optimization progress by tracking estimated savings, spending, and
  /// measures how effectively you're optimizing your Cloud resources.
  ///
  /// The operation supports both daily and monthly time granularities and
  /// allows grouping results by account ID, Amazon Web Services Region. Results
  /// are returned as time-series data, enabling you to analyze trends in your
  /// cost optimization performance over the specified time period.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [granularity] :
  /// The time granularity for the cost efficiency metrics. Specify
  /// <code>Daily</code> for metrics aggregated by day, or <code>Monthly</code>
  /// for metrics aggregated by month.
  ///
  /// Parameter [timePeriod] :
  /// The time period for which to retrieve the cost efficiency metrics. The
  /// start date is inclusive and the end date is exclusive. Dates can be
  /// specified in either YYYY-MM-DD format or YYYY-MM format depending on the
  /// desired granularity.
  ///
  /// Parameter [groupBy] :
  /// The dimension by which to group the cost efficiency metrics. Valid values
  /// include account ID, Amazon Web Services Region. When no grouping is
  /// specified, metrics are aggregated across all resources in the specified
  /// time period.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of groups to return in the response. Valid values range
  /// from 0 to 1000. Use in conjunction with <code>nextToken</code> to paginate
  /// through results when the total number of groups exceeds this limit.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next page of results. This value is returned in
  /// the response when the number of groups exceeds the specified
  /// <code>maxResults</code> value.
  ///
  /// Parameter [orderBy] :
  /// The ordering specification for the results. Defines which dimension to
  /// sort by and whether to sort in ascending or descending order.
  Future<ListEfficiencyMetricsResponse> listEfficiencyMetrics({
    required GranularityType granularity,
    required TimePeriod timePeriod,
    String? groupBy,
    int? maxResults,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListEfficiencyMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'granularity': granularity.value,
        'timePeriod': timePeriod,
        if (groupBy != null) 'groupBy': groupBy,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (orderBy != null) 'orderBy': orderBy,
      },
    );

    return ListEfficiencyMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the enrollment status for an account. It can also return the
  /// list of accounts that are enrolled under the organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The account ID of a member account in the organization.
  ///
  /// Parameter [includeOrganizationInfo] :
  /// Indicates whether to return the enrollment status for the organization.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListEnrollmentStatusesResponse> listEnrollmentStatuses({
    String? accountId,
    bool? includeOrganizationInfo,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListEnrollmentStatuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountId != null) 'accountId': accountId,
        if (includeOrganizationInfo != null)
          'includeOrganizationInfo': includeOrganizationInfo,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnrollmentStatusesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// The constraints that you want all returned recommendations to match.
  ///
  /// Parameter [includeAllRecommendations] :
  /// List of all recommendations for a resource, or a single recommendation if
  /// de-duped by <code>resourceId</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendations that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [orderBy] :
  /// The ordering of recommendations by a dimension.
  Future<ListRecommendationsResponse> listRecommendations({
    Filter? filter,
    bool? includeAllRecommendations,
    int? maxResults,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (includeAllRecommendations != null)
          'includeAllRecommendations': includeAllRecommendations,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (orderBy != null) 'orderBy': orderBy,
      },
    );

    return ListRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a concise representation of savings estimates for resources. Also
  /// returns de-duped savings across different types of recommendations.
  /// <note>
  /// The following filters are not supported for this API:
  /// <code>recommendationIds</code>, <code>resourceArns</code>, and
  /// <code>resourceIds</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupBy] :
  /// The grouping of recommendations by a dimension.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendations to be returned for the request.
  ///
  /// Parameter [metrics] :
  /// Additional metrics to be returned for the request. The only valid value is
  /// <code>savingsPercentage</code>.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListRecommendationSummariesResponse> listRecommendationSummaries({
    required String groupBy,
    Filter? filter,
    int? maxResults,
    List<SummaryMetrics>? metrics,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListRecommendationSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'groupBy': groupBy,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (metrics != null) 'metrics': metrics.map((e) => e.value).toList(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRecommendationSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Updates the enrollment (opt in and opt out) status of an account to the
  /// Cost Optimization Hub service.
  ///
  /// If the account is a management account of an organization, this action can
  /// also be used to enroll member accounts of the organization.
  ///
  /// You must have the appropriate permissions to opt in to Cost Optimization
  /// Hub and to view its recommendations. When you opt in, Cost Optimization
  /// Hub automatically creates a service-linked role in your account to access
  /// its data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [status] :
  /// Sets the account status.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to enroll member accounts of the organization if the
  /// account is the management account or delegated administrator.
  Future<UpdateEnrollmentStatusResponse> updateEnrollmentStatus({
    required EnrollmentStatus status,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.UpdateEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'status': status.value,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return UpdateEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }

  /// Updates a set of preferences for an account in order to add
  /// account-specific preferences into the service. These preferences impact
  /// how the savings associated with recommendations are presented.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memberAccountDiscountVisibility] :
  /// Sets the "member account discount visibility" preference.
  ///
  /// Parameter [preferredCommitment] :
  /// Sets the preferences for how Reserved Instances and Savings Plans
  /// cost-saving opportunities are prioritized in terms of payment option and
  /// term length.
  ///
  /// Parameter [savingsEstimationMode] :
  /// Sets the "savings estimation mode" preference.
  Future<UpdatePreferencesResponse> updatePreferences({
    MemberAccountDiscountVisibility? memberAccountDiscountVisibility,
    PreferredCommitment? preferredCommitment,
    SavingsEstimationMode? savingsEstimationMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.UpdatePreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (memberAccountDiscountVisibility != null)
          'memberAccountDiscountVisibility':
              memberAccountDiscountVisibility.value,
        if (preferredCommitment != null)
          'preferredCommitment': preferredCommitment,
        if (savingsEstimationMode != null)
          'savingsEstimationMode': savingsEstimationMode.value,
      },
    );

    return UpdatePreferencesResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class GetPreferencesResponse {
  /// Retrieves the status of the "member account discount visibility" preference.
  final MemberAccountDiscountVisibility? memberAccountDiscountVisibility;

  /// Retrieves the current preferences for how Reserved Instances and Savings
  /// Plans cost-saving opportunities are prioritized in terms of payment option
  /// and term length.
  final PreferredCommitment? preferredCommitment;

  /// Retrieves the status of the "savings estimation mode" preference.
  final SavingsEstimationMode? savingsEstimationMode;

  GetPreferencesResponse({
    this.memberAccountDiscountVisibility,
    this.preferredCommitment,
    this.savingsEstimationMode,
  });

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetPreferencesResponse(
      memberAccountDiscountVisibility:
          (json['memberAccountDiscountVisibility'] as String?)
              ?.let(MemberAccountDiscountVisibility.fromString),
      preferredCommitment: json['preferredCommitment'] != null
          ? PreferredCommitment.fromJson(
              json['preferredCommitment'] as Map<String, dynamic>)
          : null,
      savingsEstimationMode: (json['savingsEstimationMode'] as String?)
          ?.let(SavingsEstimationMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccountDiscountVisibility =
        this.memberAccountDiscountVisibility;
    final preferredCommitment = this.preferredCommitment;
    final savingsEstimationMode = this.savingsEstimationMode;
    return {
      if (memberAccountDiscountVisibility != null)
        'memberAccountDiscountVisibility':
            memberAccountDiscountVisibility.value,
      if (preferredCommitment != null)
        'preferredCommitment': preferredCommitment,
      if (savingsEstimationMode != null)
        'savingsEstimationMode': savingsEstimationMode.value,
    };
  }
}

/// @nodoc
class GetRecommendationResponse {
  /// The account to which the recommendation applies.
  final String? accountId;

  /// The type of action you can take by adopting the recommendation.
  final ActionType? actionType;

  /// The lookback period used to calculate cost impact for a recommendation.
  final int? costCalculationLookbackPeriodInDays;

  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// The details for the resource.
  final ResourceDetails? currentResourceDetails;

  /// The type of resource.
  final ResourceType? currentResourceType;

  /// The estimated monthly cost of the current resource. For Reserved Instances
  /// and Savings Plans, it refers to the cost for eligible usage.
  final double? estimatedMonthlyCost;

  /// The estimated monthly savings amount for the recommendation.
  final double? estimatedMonthlySavings;

  /// The estimated savings amount over the lookback period used to calculate cost
  /// impact for a recommendation.
  final double? estimatedSavingsOverCostCalculationLookbackPeriod;

  /// The estimated savings percentage relative to the total cost over the cost
  /// calculation lookback period.
  final double? estimatedSavingsPercentage;

  /// The effort required to implement the recommendation.
  final ImplementationEffort? implementationEffort;

  /// The time when the recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The ID for the recommendation.
  final String? recommendationId;

  /// The lookback period that's used to generate the recommendation.
  final int? recommendationLookbackPeriodInDays;

  /// The details about the recommended resource.
  final ResourceDetails? recommendedResourceDetails;

  /// The resource type of the recommendation.
  final ResourceType? recommendedResourceType;

  /// The Amazon Web Services Region of the resource.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The unique identifier for the resource. This is the same as the Amazon
  /// Resource Name (ARN), if available.
  final String? resourceId;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// The source of the recommendation.
  final Source? source;

  /// A list of tags associated with the resource for which the recommendation
  /// exists.
  final List<Tag>? tags;

  GetRecommendationResponse({
    this.accountId,
    this.actionType,
    this.costCalculationLookbackPeriodInDays,
    this.currencyCode,
    this.currentResourceDetails,
    this.currentResourceType,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.estimatedSavingsOverCostCalculationLookbackPeriod,
    this.estimatedSavingsPercentage,
    this.implementationEffort,
    this.lastRefreshTimestamp,
    this.recommendationId,
    this.recommendationLookbackPeriodInDays,
    this.recommendedResourceDetails,
    this.recommendedResourceType,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.restartNeeded,
    this.rollbackPossible,
    this.source,
    this.tags,
  });

  factory GetRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationResponse(
      accountId: json['accountId'] as String?,
      actionType: (json['actionType'] as String?)?.let(ActionType.fromString),
      costCalculationLookbackPeriodInDays:
          json['costCalculationLookbackPeriodInDays'] as int?,
      currencyCode: json['currencyCode'] as String?,
      currentResourceDetails: json['currentResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['currentResourceDetails'] as Map<String, dynamic>)
          : null,
      currentResourceType: (json['currentResourceType'] as String?)
          ?.let(ResourceType.fromString),
      estimatedMonthlyCost: json['estimatedMonthlyCost'] as double?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      estimatedSavingsOverCostCalculationLookbackPeriod:
          json['estimatedSavingsOverCostCalculationLookbackPeriod'] as double?,
      estimatedSavingsPercentage: json['estimatedSavingsPercentage'] as double?,
      implementationEffort: (json['implementationEffort'] as String?)
          ?.let(ImplementationEffort.fromString),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      recommendationId: json['recommendationId'] as String?,
      recommendationLookbackPeriodInDays:
          json['recommendationLookbackPeriodInDays'] as int?,
      recommendedResourceDetails: json['recommendedResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['recommendedResourceDetails'] as Map<String, dynamic>)
          : null,
      recommendedResourceType: (json['recommendedResourceType'] as String?)
          ?.let(ResourceType.fromString),
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      restartNeeded: json['restartNeeded'] as bool?,
      rollbackPossible: json['rollbackPossible'] as bool?,
      source: (json['source'] as String?)?.let(Source.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionType = this.actionType;
    final costCalculationLookbackPeriodInDays =
        this.costCalculationLookbackPeriodInDays;
    final currencyCode = this.currencyCode;
    final currentResourceDetails = this.currentResourceDetails;
    final currentResourceType = this.currentResourceType;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedSavingsOverCostCalculationLookbackPeriod =
        this.estimatedSavingsOverCostCalculationLookbackPeriod;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final implementationEffort = this.implementationEffort;
    final lastRefreshTimestamp = this.lastRefreshTimestamp;
    final recommendationId = this.recommendationId;
    final recommendationLookbackPeriodInDays =
        this.recommendationLookbackPeriodInDays;
    final recommendedResourceDetails = this.recommendedResourceDetails;
    final recommendedResourceType = this.recommendedResourceType;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final source = this.source;
    final tags = this.tags;
    return {
      if (accountId != null) 'accountId': accountId,
      if (actionType != null) 'actionType': actionType.value,
      if (costCalculationLookbackPeriodInDays != null)
        'costCalculationLookbackPeriodInDays':
            costCalculationLookbackPeriodInDays,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (currentResourceDetails != null)
        'currentResourceDetails': currentResourceDetails,
      if (currentResourceType != null)
        'currentResourceType': currentResourceType.value,
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': estimatedMonthlyCost,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (estimatedSavingsOverCostCalculationLookbackPeriod != null)
        'estimatedSavingsOverCostCalculationLookbackPeriod':
            estimatedSavingsOverCostCalculationLookbackPeriod,
      if (estimatedSavingsPercentage != null)
        'estimatedSavingsPercentage': estimatedSavingsPercentage,
      if (implementationEffort != null)
        'implementationEffort': implementationEffort.value,
      if (lastRefreshTimestamp != null)
        'lastRefreshTimestamp': unixTimestampToJson(lastRefreshTimestamp),
      if (recommendationId != null) 'recommendationId': recommendationId,
      if (recommendationLookbackPeriodInDays != null)
        'recommendationLookbackPeriodInDays':
            recommendationLookbackPeriodInDays,
      if (recommendedResourceDetails != null)
        'recommendedResourceDetails': recommendedResourceDetails,
      if (recommendedResourceType != null)
        'recommendedResourceType': recommendedResourceType.value,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (source != null) 'source': source.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListEfficiencyMetricsResponse {
  /// A list of cost efficiency metrics grouped by the specified dimension. Each
  /// group contains time-series data points with cost efficiency, potential
  /// savings, and optimzable spend for the specified time period.
  final List<EfficiencyMetricsByGroup>? efficiencyMetricsByGroup;

  /// The token to retrieve the next page of results. When this value is present
  /// in the response, additional groups are available. Pass this token in the
  /// <code>nextToken</code> parameter of a subsequent request to retrieve the
  /// next page.
  final String? nextToken;

  ListEfficiencyMetricsResponse({
    this.efficiencyMetricsByGroup,
    this.nextToken,
  });

  factory ListEfficiencyMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListEfficiencyMetricsResponse(
      efficiencyMetricsByGroup: (json['efficiencyMetricsByGroup'] as List?)
          ?.nonNulls
          .map((e) =>
              EfficiencyMetricsByGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final efficiencyMetricsByGroup = this.efficiencyMetricsByGroup;
    final nextToken = this.nextToken;
    return {
      if (efficiencyMetricsByGroup != null)
        'efficiencyMetricsByGroup': efficiencyMetricsByGroup,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEnrollmentStatusesResponse {
  /// The enrollment status of all member accounts in the organization if the
  /// account is the management account or delegated administrator.
  final bool? includeMemberAccounts;

  /// The enrollment status of a specific account ID, including creation and last
  /// updated timestamps.
  final List<AccountEnrollmentStatus>? items;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListEnrollmentStatusesResponse({
    this.includeMemberAccounts,
    this.items,
    this.nextToken,
  });

  factory ListEnrollmentStatusesResponse.fromJson(Map<String, dynamic> json) {
    return ListEnrollmentStatusesResponse(
      includeMemberAccounts: json['includeMemberAccounts'] as bool?,
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              AccountEnrollmentStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final includeMemberAccounts = this.includeMemberAccounts;
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (includeMemberAccounts != null)
        'includeMemberAccounts': includeMemberAccounts,
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecommendationsResponse {
  /// List of all savings recommendations.
  final List<Recommendation>? items;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecommendationSummariesResponse {
  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// The total overall savings for the aggregated view.
  final double? estimatedTotalDedupedSavings;

  /// The dimension used to group the recommendations by.
  final String? groupBy;

  /// A list of all savings recommendations.
  final List<RecommendationSummary>? items;

  /// The results or descriptions for the additional metrics, based on whether the
  /// metrics were or were not requested.
  final SummaryMetricsResult? metrics;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationSummariesResponse({
    this.currencyCode,
    this.estimatedTotalDedupedSavings,
    this.groupBy,
    this.items,
    this.metrics,
    this.nextToken,
  });

  factory ListRecommendationSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendationSummariesResponse(
      currencyCode: json['currencyCode'] as String?,
      estimatedTotalDedupedSavings:
          json['estimatedTotalDedupedSavings'] as double?,
      groupBy: json['groupBy'] as String?,
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      metrics: json['metrics'] != null
          ? SummaryMetricsResult.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final estimatedTotalDedupedSavings = this.estimatedTotalDedupedSavings;
    final groupBy = this.groupBy;
    final items = this.items;
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (estimatedTotalDedupedSavings != null)
        'estimatedTotalDedupedSavings': estimatedTotalDedupedSavings,
      if (groupBy != null) 'groupBy': groupBy,
      if (items != null) 'items': items,
      if (metrics != null) 'metrics': metrics,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateEnrollmentStatusResponse {
  /// The enrollment status of the account.
  final String? status;

  UpdateEnrollmentStatusResponse({
    this.status,
  });

  factory UpdateEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnrollmentStatusResponse(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

/// @nodoc
class UpdatePreferencesResponse {
  /// Shows the status of the "member account discount visibility" preference.
  final MemberAccountDiscountVisibility? memberAccountDiscountVisibility;

  /// Shows the updated preferences for how Reserved Instances and Savings Plans
  /// cost-saving opportunities are prioritized in terms of payment option and
  /// term length.
  final PreferredCommitment? preferredCommitment;

  /// Shows the status of the "savings estimation mode" preference.
  final SavingsEstimationMode? savingsEstimationMode;

  UpdatePreferencesResponse({
    this.memberAccountDiscountVisibility,
    this.preferredCommitment,
    this.savingsEstimationMode,
  });

  factory UpdatePreferencesResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePreferencesResponse(
      memberAccountDiscountVisibility:
          (json['memberAccountDiscountVisibility'] as String?)
              ?.let(MemberAccountDiscountVisibility.fromString),
      preferredCommitment: json['preferredCommitment'] != null
          ? PreferredCommitment.fromJson(
              json['preferredCommitment'] as Map<String, dynamic>)
          : null,
      savingsEstimationMode: (json['savingsEstimationMode'] as String?)
          ?.let(SavingsEstimationMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccountDiscountVisibility =
        this.memberAccountDiscountVisibility;
    final preferredCommitment = this.preferredCommitment;
    final savingsEstimationMode = this.savingsEstimationMode;
    return {
      if (memberAccountDiscountVisibility != null)
        'memberAccountDiscountVisibility':
            memberAccountDiscountVisibility.value,
      if (preferredCommitment != null)
        'preferredCommitment': preferredCommitment,
      if (savingsEstimationMode != null)
        'savingsEstimationMode': savingsEstimationMode.value,
    };
  }
}

/// @nodoc
class SavingsEstimationMode {
  static const beforeDiscounts = SavingsEstimationMode._('BeforeDiscounts');
  static const afterDiscounts = SavingsEstimationMode._('AfterDiscounts');

  final String value;

  const SavingsEstimationMode._(this.value);

  static const values = [beforeDiscounts, afterDiscounts];

  static SavingsEstimationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsEstimationMode._(value));

  @override
  bool operator ==(other) =>
      other is SavingsEstimationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MemberAccountDiscountVisibility {
  static const all = MemberAccountDiscountVisibility._('All');
  static const none = MemberAccountDiscountVisibility._('None');

  final String value;

  const MemberAccountDiscountVisibility._(this.value);

  static const values = [all, none];

  static MemberAccountDiscountVisibility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemberAccountDiscountVisibility._(value));

  @override
  bool operator ==(other) =>
      other is MemberAccountDiscountVisibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The preferred configuration for Reserved Instances and Savings Plans
/// commitment-based discounts, consisting of a payment option and a commitment
/// duration.
///
/// @nodoc
class PreferredCommitment {
  /// The preferred upfront payment structure for commitments. If the value is
  /// null, it will default to <code>AllUpfront</code> (highest savings) where
  /// applicable.
  final PaymentOption? paymentOption;

  /// The preferred length of the commitment period. If the value is null, it will
  /// default to <code>ThreeYears</code> (highest savings) where applicable.
  final Term? term;

  PreferredCommitment({
    this.paymentOption,
    this.term,
  });

  factory PreferredCommitment.fromJson(Map<String, dynamic> json) {
    return PreferredCommitment(
      paymentOption:
          (json['paymentOption'] as String?)?.let(PaymentOption.fromString),
      term: (json['term'] as String?)?.let(Term.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentOption = this.paymentOption;
    final term = this.term;
    return {
      if (paymentOption != null) 'paymentOption': paymentOption.value,
      if (term != null) 'term': term.value,
    };
  }
}

/// @nodoc
class Term {
  static const oneYear = Term._('OneYear');
  static const threeYears = Term._('ThreeYears');

  final String value;

  const Term._(this.value);

  static const values = [oneYear, threeYears];

  static Term fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Term._(value));

  @override
  bool operator ==(other) => other is Term && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PaymentOption {
  static const allUpfront = PaymentOption._('AllUpfront');
  static const partialUpfront = PaymentOption._('PartialUpfront');
  static const noUpfront = PaymentOption._('NoUpfront');

  final String value;

  const PaymentOption._(this.value);

  static const values = [allUpfront, partialUpfront, noUpfront];

  static PaymentOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentOption._(value));

  @override
  bool operator ==(other) => other is PaymentOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EnrollmentStatus {
  static const active = EnrollmentStatus._('Active');
  static const inactive = EnrollmentStatus._('Inactive');

  final String value;

  const EnrollmentStatus._(this.value);

  static const values = [active, inactive];

  static EnrollmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnrollmentStatus._(value));

  @override
  bool operator ==(other) => other is EnrollmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The results or descriptions for the additional metrics, based on whether the
/// metrics were or were not requested.
///
/// @nodoc
class SummaryMetricsResult {
  /// The savings percentage based on your Amazon Web Services spend over the past
  /// 30 days.
  /// <note>
  /// Savings percentage is only supported when filtering by Region, account ID,
  /// or tags.
  /// </note>
  final String? savingsPercentage;

  SummaryMetricsResult({
    this.savingsPercentage,
  });

  factory SummaryMetricsResult.fromJson(Map<String, dynamic> json) {
    return SummaryMetricsResult(
      savingsPercentage: json['savingsPercentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPercentage = this.savingsPercentage;
    return {
      if (savingsPercentage != null) 'savingsPercentage': savingsPercentage,
    };
  }
}

/// The summary of rightsizing recommendations, including de-duped savings from
/// all types of recommendations.
///
/// @nodoc
class RecommendationSummary {
  /// The estimated total savings resulting from modifications, on a monthly
  /// basis.
  final double? estimatedMonthlySavings;

  /// The grouping of recommendations.
  final String? group;

  /// The total number of instance recommendations.
  final int? recommendationCount;

  RecommendationSummary({
    this.estimatedMonthlySavings,
    this.group,
    this.recommendationCount,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      group: json['group'] as String?,
      recommendationCount: json['recommendationCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final group = this.group;
    final recommendationCount = this.recommendationCount;
    return {
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (group != null) 'group': group,
      if (recommendationCount != null)
        'recommendationCount': recommendationCount,
    };
  }
}

/// Describes a filter that returns a more specific list of recommendations.
/// Filters recommendations by different dimensions.
///
/// @nodoc
class Filter {
  /// The account to which the recommendation applies.
  final List<String>? accountIds;

  /// The type of action you can take by adopting the recommendation.
  final List<ActionType>? actionTypes;

  /// The effort required to implement the recommendation.
  final List<ImplementationEffort>? implementationEfforts;

  /// The IDs for the recommendations.
  final List<String>? recommendationIds;

  /// The Amazon Web Services Region of the resource.
  final List<String>? regions;

  /// The Amazon Resource Name (ARN) of the recommendation.
  final List<String>? resourceArns;

  /// The resource ID of the recommendation.
  final List<String>? resourceIds;

  /// The resource type of the recommendation.
  final List<ResourceType>? resourceTypes;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// A list of tags assigned to the recommendation.
  final List<Tag>? tags;

  Filter({
    this.accountIds,
    this.actionTypes,
    this.implementationEfforts,
    this.recommendationIds,
    this.regions,
    this.resourceArns,
    this.resourceIds,
    this.resourceTypes,
    this.restartNeeded,
    this.rollbackPossible,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final actionTypes = this.actionTypes;
    final implementationEfforts = this.implementationEfforts;
    final recommendationIds = this.recommendationIds;
    final regions = this.regions;
    final resourceArns = this.resourceArns;
    final resourceIds = this.resourceIds;
    final resourceTypes = this.resourceTypes;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final tags = this.tags;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (actionTypes != null)
        'actionTypes': actionTypes.map((e) => e.value).toList(),
      if (implementationEfforts != null)
        'implementationEfforts':
            implementationEfforts.map((e) => e.value).toList(),
      if (recommendationIds != null) 'recommendationIds': recommendationIds,
      if (regions != null) 'regions': regions,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class SummaryMetrics {
  static const savingsPercentage = SummaryMetrics._('SavingsPercentage');

  final String value;

  const SummaryMetrics._(this.value);

  static const values = [savingsPercentage];

  static SummaryMetrics fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SummaryMetrics._(value));

  @override
  bool operator ==(other) => other is SummaryMetrics && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tag structure that contains a tag key and value.
///
/// @nodoc
class Tag {
  /// The key that's associated with the tag.
  final String? key;

  /// The value that's associated with the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class ActionType {
  static const rightsize = ActionType._('Rightsize');
  static const stop = ActionType._('Stop');
  static const upgrade = ActionType._('Upgrade');
  static const purchaseSavingsPlans = ActionType._('PurchaseSavingsPlans');
  static const purchaseReservedInstances =
      ActionType._('PurchaseReservedInstances');
  static const migrateToGraviton = ActionType._('MigrateToGraviton');
  static const delete = ActionType._('Delete');
  static const scaleIn = ActionType._('ScaleIn');

  final String value;

  const ActionType._(this.value);

  static const values = [
    rightsize,
    stop,
    upgrade,
    purchaseSavingsPlans,
    purchaseReservedInstances,
    migrateToGraviton,
    delete,
    scaleIn
  ];

  static ActionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionType._(value));

  @override
  bool operator ==(other) => other is ActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceType {
  static const ec2Instance = ResourceType._('Ec2Instance');
  static const lambdaFunction = ResourceType._('LambdaFunction');
  static const ebsVolume = ResourceType._('EbsVolume');
  static const ecsService = ResourceType._('EcsService');
  static const ec2AutoScalingGroup = ResourceType._('Ec2AutoScalingGroup');
  static const ec2InstanceSavingsPlans =
      ResourceType._('Ec2InstanceSavingsPlans');
  static const computeSavingsPlans = ResourceType._('ComputeSavingsPlans');
  static const sageMakerSavingsPlans = ResourceType._('SageMakerSavingsPlans');
  static const ec2ReservedInstances = ResourceType._('Ec2ReservedInstances');
  static const rdsReservedInstances = ResourceType._('RdsReservedInstances');
  static const openSearchReservedInstances =
      ResourceType._('OpenSearchReservedInstances');
  static const redshiftReservedInstances =
      ResourceType._('RedshiftReservedInstances');
  static const elastiCacheReservedInstances =
      ResourceType._('ElastiCacheReservedInstances');
  static const rdsDbInstanceStorage = ResourceType._('RdsDbInstanceStorage');
  static const rdsDbInstance = ResourceType._('RdsDbInstance');
  static const auroraDbClusterStorage =
      ResourceType._('AuroraDbClusterStorage');
  static const dynamoDbReservedCapacity =
      ResourceType._('DynamoDbReservedCapacity');
  static const memoryDbReservedInstances =
      ResourceType._('MemoryDbReservedInstances');
  static const natGateway = ResourceType._('NatGateway');

  final String value;

  const ResourceType._(this.value);

  static const values = [
    ec2Instance,
    lambdaFunction,
    ebsVolume,
    ecsService,
    ec2AutoScalingGroup,
    ec2InstanceSavingsPlans,
    computeSavingsPlans,
    sageMakerSavingsPlans,
    ec2ReservedInstances,
    rdsReservedInstances,
    openSearchReservedInstances,
    redshiftReservedInstances,
    elastiCacheReservedInstances,
    rdsDbInstanceStorage,
    rdsDbInstance,
    auroraDbClusterStorage,
    dynamoDbReservedCapacity,
    memoryDbReservedInstances,
    natGateway
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

/// @nodoc
class ImplementationEffort {
  static const veryLow = ImplementationEffort._('VeryLow');
  static const low = ImplementationEffort._('Low');
  static const medium = ImplementationEffort._('Medium');
  static const high = ImplementationEffort._('High');
  static const veryHigh = ImplementationEffort._('VeryHigh');

  final String value;

  const ImplementationEffort._(this.value);

  static const values = [veryLow, low, medium, high, veryHigh];

  static ImplementationEffort fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImplementationEffort._(value));

  @override
  bool operator ==(other) =>
      other is ImplementationEffort && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a recommendation.
///
/// @nodoc
class Recommendation {
  /// The account to which the recommendation applies.
  final String? accountId;

  /// The type of tasks that can be carried out by this action.
  final String? actionType;

  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// Describes the current resource.
  final String? currentResourceSummary;

  /// The current resource type.
  final String? currentResourceType;

  /// The estimated monthly cost of the current resource. For Reserved Instances
  /// and Savings Plans, it refers to the cost for eligible usage.
  final double? estimatedMonthlyCost;

  /// The estimated monthly savings amount for the recommendation.
  final double? estimatedMonthlySavings;

  /// The estimated savings percentage relative to the total cost over the cost
  /// calculation lookback period.
  final double? estimatedSavingsPercentage;

  /// The effort required to implement the recommendation.
  final String? implementationEffort;

  /// The time when the recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The ID for the recommendation.
  final String? recommendationId;

  /// The lookback period that's used to generate the recommendation.
  final int? recommendationLookbackPeriodInDays;

  /// Describes the recommended resource.
  final String? recommendedResourceSummary;

  /// The recommended resource type.
  final String? recommendedResourceType;

  /// The Amazon Web Services Region of the resource.
  final String? region;

  /// The Amazon Resource Name (ARN) for the recommendation.
  final String? resourceArn;

  /// The resource ID for the recommendation.
  final String? resourceId;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// The source of the recommendation.
  final Source? source;

  /// A list of tags assigned to the recommendation.
  final List<Tag>? tags;

  Recommendation({
    this.accountId,
    this.actionType,
    this.currencyCode,
    this.currentResourceSummary,
    this.currentResourceType,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.estimatedSavingsPercentage,
    this.implementationEffort,
    this.lastRefreshTimestamp,
    this.recommendationId,
    this.recommendationLookbackPeriodInDays,
    this.recommendedResourceSummary,
    this.recommendedResourceType,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.restartNeeded,
    this.rollbackPossible,
    this.source,
    this.tags,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      accountId: json['accountId'] as String?,
      actionType: json['actionType'] as String?,
      currencyCode: json['currencyCode'] as String?,
      currentResourceSummary: json['currentResourceSummary'] as String?,
      currentResourceType: json['currentResourceType'] as String?,
      estimatedMonthlyCost: json['estimatedMonthlyCost'] as double?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      estimatedSavingsPercentage: json['estimatedSavingsPercentage'] as double?,
      implementationEffort: json['implementationEffort'] as String?,
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      recommendationId: json['recommendationId'] as String?,
      recommendationLookbackPeriodInDays:
          json['recommendationLookbackPeriodInDays'] as int?,
      recommendedResourceSummary: json['recommendedResourceSummary'] as String?,
      recommendedResourceType: json['recommendedResourceType'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      restartNeeded: json['restartNeeded'] as bool?,
      rollbackPossible: json['rollbackPossible'] as bool?,
      source: (json['source'] as String?)?.let(Source.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionType = this.actionType;
    final currencyCode = this.currencyCode;
    final currentResourceSummary = this.currentResourceSummary;
    final currentResourceType = this.currentResourceType;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final implementationEffort = this.implementationEffort;
    final lastRefreshTimestamp = this.lastRefreshTimestamp;
    final recommendationId = this.recommendationId;
    final recommendationLookbackPeriodInDays =
        this.recommendationLookbackPeriodInDays;
    final recommendedResourceSummary = this.recommendedResourceSummary;
    final recommendedResourceType = this.recommendedResourceType;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final source = this.source;
    final tags = this.tags;
    return {
      if (accountId != null) 'accountId': accountId,
      if (actionType != null) 'actionType': actionType,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (currentResourceSummary != null)
        'currentResourceSummary': currentResourceSummary,
      if (currentResourceType != null)
        'currentResourceType': currentResourceType,
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': estimatedMonthlyCost,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (estimatedSavingsPercentage != null)
        'estimatedSavingsPercentage': estimatedSavingsPercentage,
      if (implementationEffort != null)
        'implementationEffort': implementationEffort,
      if (lastRefreshTimestamp != null)
        'lastRefreshTimestamp': unixTimestampToJson(lastRefreshTimestamp),
      if (recommendationId != null) 'recommendationId': recommendationId,
      if (recommendationLookbackPeriodInDays != null)
        'recommendationLookbackPeriodInDays':
            recommendationLookbackPeriodInDays,
      if (recommendedResourceSummary != null)
        'recommendedResourceSummary': recommendedResourceSummary,
      if (recommendedResourceType != null)
        'recommendedResourceType': recommendedResourceType,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (source != null) 'source': source.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class Source {
  static const computeOptimizer = Source._('ComputeOptimizer');
  static const costExplorer = Source._('CostExplorer');

  final String value;

  const Source._(this.value);

  static const values = [computeOptimizer, costExplorer];

  static Source fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Source._(value));

  @override
  bool operator ==(other) => other is Source && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines how rows will be sorted in the response.
///
/// @nodoc
class OrderBy {
  /// Sorts by dimension values.
  final String? dimension;

  /// The order that's used to sort the data.
  final Order? order;

  OrderBy({
    this.dimension,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final order = this.order;
    return {
      if (dimension != null) 'dimension': dimension,
      if (order != null) 'order': order.value,
    };
  }
}

/// @nodoc
class Order {
  static const asc = Order._('Asc');
  static const desc = Order._('Desc');

  final String value;

  const Order._(this.value);

  static const values = [asc, desc];

  static Order fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Order._(value));

  @override
  bool operator ==(other) => other is Order && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the enrollment status of an organization's member accounts in Cost
/// Optimization Hub.
///
/// @nodoc
class AccountEnrollmentStatus {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The time when the account enrollment status was created.
  final DateTime? createdTimestamp;

  /// The time when the account enrollment status was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The account enrollment status.
  final EnrollmentStatus? status;

  AccountEnrollmentStatus({
    this.accountId,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.status,
  });

  factory AccountEnrollmentStatus.fromJson(Map<String, dynamic> json) {
    return AccountEnrollmentStatus(
      accountId: json['accountId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      status: (json['status'] as String?)?.let(EnrollmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains cost efficiency metrics for a specific group over time. The group
/// is defined by the grouping dimension specified in the request, such as
/// account ID, Amazon Web Services Region.
///
/// @nodoc
class EfficiencyMetricsByGroup {
  /// The value of the grouping dimension for this set of metrics. For example, if
  /// grouped by account ID, this field contains the account ID. If no grouping is
  /// specified, this field is empty.
  final String? group;

  /// An explanation of why efficiency metrics could not be calculated for this
  /// group when the metricsByTime field is null. Common reasons include
  /// insufficient or inconclusive cost and usage data during the specified time
  /// period. This field is null or empty when metrics are successfully
  /// calculated.
  final String? message;

  /// A list of time-series data points containing efficiency metrics for this
  /// group. Each data point includes an efficiency score, estimated savings,
  /// spending, and a timestamp corresponding to the specified granularity. This
  /// field is null when efficiency metrics cannot be calculated for the group, in
  /// which case the message field provides an explanation.
  final List<MetricsByTime>? metricsByTime;

  EfficiencyMetricsByGroup({
    this.group,
    this.message,
    this.metricsByTime,
  });

  factory EfficiencyMetricsByGroup.fromJson(Map<String, dynamic> json) {
    return EfficiencyMetricsByGroup(
      group: json['group'] as String?,
      message: json['message'] as String?,
      metricsByTime: (json['metricsByTime'] as List?)
          ?.nonNulls
          .map((e) => MetricsByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final message = this.message;
    final metricsByTime = this.metricsByTime;
    return {
      if (group != null) 'group': group,
      if (message != null) 'message': message,
      if (metricsByTime != null) 'metricsByTime': metricsByTime,
    };
  }
}

/// Contains efficiency metrics for a specific point in time, including an
/// efficiency score, potential savings, optimizable spend, and timestamp.
///
/// @nodoc
class MetricsByTime {
  /// The estimated savings amount for this time period, representing the
  /// potential cost reduction achieved through optimization recommendations.
  final double? savings;

  /// The efficiency score for this time period. The score represents a measure of
  /// how effectively the cloud resources are being optimized, with higher scores
  /// indicating better optimization performance.
  final double? score;

  /// The total spending amount for this time period.
  final double? spend;

  /// The timestamp for this data point. The format depends on the granularity:
  /// YYYY-MM-DD for daily metrics, or YYYY-MM for monthly metrics.
  final String? timestamp;

  MetricsByTime({
    this.savings,
    this.score,
    this.spend,
    this.timestamp,
  });

  factory MetricsByTime.fromJson(Map<String, dynamic> json) {
    return MetricsByTime(
      savings: json['savings'] as double?,
      score: json['score'] as double?,
      spend: json['spend'] as double?,
      timestamp: json['timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savings = this.savings;
    final score = this.score;
    final spend = this.spend;
    final timestamp = this.timestamp;
    return {
      if (savings != null) 'savings': savings,
      if (score != null) 'score': score,
      if (spend != null) 'spend': spend,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// The time granularity for aggregating the cost efficiency metrics.
///
/// @nodoc
class GranularityType {
  static const daily = GranularityType._('Daily');
  static const monthly = GranularityType._('Monthly');

  final String value;

  const GranularityType._(this.value);

  static const values = [daily, monthly];

  static GranularityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GranularityType._(value));

  @override
  bool operator ==(other) => other is GranularityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a date range for retrieving efficiency metrics. The start date is
/// inclusive and the end date is exclusive.
///
/// @nodoc
class TimePeriod {
  /// The end of the time period (exclusive). Specify the date in ISO 8601 format,
  /// such as 2024-12-31.
  final String end;

  /// The beginning of the time period (inclusive). Specify the date in ISO 8601
  /// format, such as 2024-01-01.
  final String start;

  TimePeriod({
    required this.end,
    required this.start,
  });

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'end': end,
      'start': start,
    };
  }
}

/// Contains detailed information about the specified resource.
///
/// @nodoc
class ResourceDetails {
  /// The Aurora DB cluster storage recommendation details.
  final AuroraDbClusterStorage? auroraDbClusterStorage;

  /// The Compute Savings Plans recommendation details.
  final ComputeSavingsPlans? computeSavingsPlans;

  /// The DynamoDB reserved capacity recommendation details.
  final DynamoDbReservedCapacity? dynamoDbReservedCapacity;

  /// The Amazon Elastic Block Store volume recommendation details.
  final EbsVolume? ebsVolume;

  /// The EC2 Auto Scaling group recommendation details.
  final Ec2AutoScalingGroup? ec2AutoScalingGroup;

  /// The EC2 instance recommendation details.
  final Ec2Instance? ec2Instance;

  /// The EC2 instance Savings Plans recommendation details.
  final Ec2InstanceSavingsPlans? ec2InstanceSavingsPlans;

  /// The EC2 reserved instances recommendation details.
  final Ec2ReservedInstances? ec2ReservedInstances;

  /// The ECS service recommendation details.
  final EcsService? ecsService;

  /// The ElastiCache reserved instances recommendation details.
  final ElastiCacheReservedInstances? elastiCacheReservedInstances;

  /// The Lambda function recommendation details.
  final LambdaFunction? lambdaFunction;

  /// The MemoryDB reserved instances recommendation details.
  final MemoryDbReservedInstances? memoryDbReservedInstances;

  /// The NAT Gateway recommendation details.
  final NatGateway? natGateway;

  /// The OpenSearch reserved instances recommendation details.
  final OpenSearchReservedInstances? openSearchReservedInstances;

  /// The DB instance recommendation details.
  final RdsDbInstance? rdsDbInstance;

  /// The DB instance storage recommendation details.
  final RdsDbInstanceStorage? rdsDbInstanceStorage;

  /// The RDS reserved instances recommendation details.
  final RdsReservedInstances? rdsReservedInstances;

  /// The Redshift reserved instances recommendation details.
  final RedshiftReservedInstances? redshiftReservedInstances;

  /// The SageMaker AI Savings Plans recommendation details.
  final SageMakerSavingsPlans? sageMakerSavingsPlans;

  ResourceDetails({
    this.auroraDbClusterStorage,
    this.computeSavingsPlans,
    this.dynamoDbReservedCapacity,
    this.ebsVolume,
    this.ec2AutoScalingGroup,
    this.ec2Instance,
    this.ec2InstanceSavingsPlans,
    this.ec2ReservedInstances,
    this.ecsService,
    this.elastiCacheReservedInstances,
    this.lambdaFunction,
    this.memoryDbReservedInstances,
    this.natGateway,
    this.openSearchReservedInstances,
    this.rdsDbInstance,
    this.rdsDbInstanceStorage,
    this.rdsReservedInstances,
    this.redshiftReservedInstances,
    this.sageMakerSavingsPlans,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      auroraDbClusterStorage: json['auroraDbClusterStorage'] != null
          ? AuroraDbClusterStorage.fromJson(
              json['auroraDbClusterStorage'] as Map<String, dynamic>)
          : null,
      computeSavingsPlans: json['computeSavingsPlans'] != null
          ? ComputeSavingsPlans.fromJson(
              json['computeSavingsPlans'] as Map<String, dynamic>)
          : null,
      dynamoDbReservedCapacity: json['dynamoDbReservedCapacity'] != null
          ? DynamoDbReservedCapacity.fromJson(
              json['dynamoDbReservedCapacity'] as Map<String, dynamic>)
          : null,
      ebsVolume: json['ebsVolume'] != null
          ? EbsVolume.fromJson(json['ebsVolume'] as Map<String, dynamic>)
          : null,
      ec2AutoScalingGroup: json['ec2AutoScalingGroup'] != null
          ? Ec2AutoScalingGroup.fromJson(
              json['ec2AutoScalingGroup'] as Map<String, dynamic>)
          : null,
      ec2Instance: json['ec2Instance'] != null
          ? Ec2Instance.fromJson(json['ec2Instance'] as Map<String, dynamic>)
          : null,
      ec2InstanceSavingsPlans: json['ec2InstanceSavingsPlans'] != null
          ? Ec2InstanceSavingsPlans.fromJson(
              json['ec2InstanceSavingsPlans'] as Map<String, dynamic>)
          : null,
      ec2ReservedInstances: json['ec2ReservedInstances'] != null
          ? Ec2ReservedInstances.fromJson(
              json['ec2ReservedInstances'] as Map<String, dynamic>)
          : null,
      ecsService: json['ecsService'] != null
          ? EcsService.fromJson(json['ecsService'] as Map<String, dynamic>)
          : null,
      elastiCacheReservedInstances: json['elastiCacheReservedInstances'] != null
          ? ElastiCacheReservedInstances.fromJson(
              json['elastiCacheReservedInstances'] as Map<String, dynamic>)
          : null,
      lambdaFunction: json['lambdaFunction'] != null
          ? LambdaFunction.fromJson(
              json['lambdaFunction'] as Map<String, dynamic>)
          : null,
      memoryDbReservedInstances: json['memoryDbReservedInstances'] != null
          ? MemoryDbReservedInstances.fromJson(
              json['memoryDbReservedInstances'] as Map<String, dynamic>)
          : null,
      natGateway: json['natGateway'] != null
          ? NatGateway.fromJson(json['natGateway'] as Map<String, dynamic>)
          : null,
      openSearchReservedInstances: json['openSearchReservedInstances'] != null
          ? OpenSearchReservedInstances.fromJson(
              json['openSearchReservedInstances'] as Map<String, dynamic>)
          : null,
      rdsDbInstance: json['rdsDbInstance'] != null
          ? RdsDbInstance.fromJson(
              json['rdsDbInstance'] as Map<String, dynamic>)
          : null,
      rdsDbInstanceStorage: json['rdsDbInstanceStorage'] != null
          ? RdsDbInstanceStorage.fromJson(
              json['rdsDbInstanceStorage'] as Map<String, dynamic>)
          : null,
      rdsReservedInstances: json['rdsReservedInstances'] != null
          ? RdsReservedInstances.fromJson(
              json['rdsReservedInstances'] as Map<String, dynamic>)
          : null,
      redshiftReservedInstances: json['redshiftReservedInstances'] != null
          ? RedshiftReservedInstances.fromJson(
              json['redshiftReservedInstances'] as Map<String, dynamic>)
          : null,
      sageMakerSavingsPlans: json['sageMakerSavingsPlans'] != null
          ? SageMakerSavingsPlans.fromJson(
              json['sageMakerSavingsPlans'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final auroraDbClusterStorage = this.auroraDbClusterStorage;
    final computeSavingsPlans = this.computeSavingsPlans;
    final dynamoDbReservedCapacity = this.dynamoDbReservedCapacity;
    final ebsVolume = this.ebsVolume;
    final ec2AutoScalingGroup = this.ec2AutoScalingGroup;
    final ec2Instance = this.ec2Instance;
    final ec2InstanceSavingsPlans = this.ec2InstanceSavingsPlans;
    final ec2ReservedInstances = this.ec2ReservedInstances;
    final ecsService = this.ecsService;
    final elastiCacheReservedInstances = this.elastiCacheReservedInstances;
    final lambdaFunction = this.lambdaFunction;
    final memoryDbReservedInstances = this.memoryDbReservedInstances;
    final natGateway = this.natGateway;
    final openSearchReservedInstances = this.openSearchReservedInstances;
    final rdsDbInstance = this.rdsDbInstance;
    final rdsDbInstanceStorage = this.rdsDbInstanceStorage;
    final rdsReservedInstances = this.rdsReservedInstances;
    final redshiftReservedInstances = this.redshiftReservedInstances;
    final sageMakerSavingsPlans = this.sageMakerSavingsPlans;
    return {
      if (auroraDbClusterStorage != null)
        'auroraDbClusterStorage': auroraDbClusterStorage,
      if (computeSavingsPlans != null)
        'computeSavingsPlans': computeSavingsPlans,
      if (dynamoDbReservedCapacity != null)
        'dynamoDbReservedCapacity': dynamoDbReservedCapacity,
      if (ebsVolume != null) 'ebsVolume': ebsVolume,
      if (ec2AutoScalingGroup != null)
        'ec2AutoScalingGroup': ec2AutoScalingGroup,
      if (ec2Instance != null) 'ec2Instance': ec2Instance,
      if (ec2InstanceSavingsPlans != null)
        'ec2InstanceSavingsPlans': ec2InstanceSavingsPlans,
      if (ec2ReservedInstances != null)
        'ec2ReservedInstances': ec2ReservedInstances,
      if (ecsService != null) 'ecsService': ecsService,
      if (elastiCacheReservedInstances != null)
        'elastiCacheReservedInstances': elastiCacheReservedInstances,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
      if (memoryDbReservedInstances != null)
        'memoryDbReservedInstances': memoryDbReservedInstances,
      if (natGateway != null) 'natGateway': natGateway,
      if (openSearchReservedInstances != null)
        'openSearchReservedInstances': openSearchReservedInstances,
      if (rdsDbInstance != null) 'rdsDbInstance': rdsDbInstance,
      if (rdsDbInstanceStorage != null)
        'rdsDbInstanceStorage': rdsDbInstanceStorage,
      if (rdsReservedInstances != null)
        'rdsReservedInstances': rdsReservedInstances,
      if (redshiftReservedInstances != null)
        'redshiftReservedInstances': redshiftReservedInstances,
      if (sageMakerSavingsPlans != null)
        'sageMakerSavingsPlans': sageMakerSavingsPlans,
    };
  }
}

/// The Lambda function recommendation details.
///
/// @nodoc
class LambdaFunction {
  /// The Lambda function configuration used for recommendations.
  final LambdaFunctionConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  LambdaFunction({
    this.configuration,
    this.costCalculation,
  });

  factory LambdaFunction.fromJson(Map<String, dynamic> json) {
    return LambdaFunction(
      configuration: json['configuration'] != null
          ? LambdaFunctionConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The ECS service recommendation details.
///
/// @nodoc
class EcsService {
  /// The ECS service configuration used for recommendations.
  final EcsServiceConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  EcsService({
    this.configuration,
    this.costCalculation,
  });

  factory EcsService.fromJson(Map<String, dynamic> json) {
    return EcsService(
      configuration: json['configuration'] != null
          ? EcsServiceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// Describes the EC2 instance configuration of the current and recommended
/// resource configuration for a recommendation.
///
/// @nodoc
class Ec2Instance {
  /// The EC2 instance configuration used for recommendations.
  final Ec2InstanceConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  Ec2Instance({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2Instance.fromJson(Map<String, dynamic> json) {
    return Ec2Instance(
      configuration: json['configuration'] != null
          ? Ec2InstanceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// Describes the Amazon Elastic Block Store volume configuration of the current
/// and recommended resource configuration for a recommendation.
///
/// @nodoc
class EbsVolume {
  /// The Amazon Elastic Block Store volume configuration used for
  /// recommendations.
  final EbsVolumeConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  EbsVolume({
    this.configuration,
    this.costCalculation,
  });

  factory EbsVolume.fromJson(Map<String, dynamic> json) {
    return EbsVolume(
      configuration: json['configuration'] != null
          ? EbsVolumeConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 Auto Scaling group recommendation details.
///
/// @nodoc
class Ec2AutoScalingGroup {
  /// The EC2 Auto Scaling group configuration used for recommendations.
  final Ec2AutoScalingGroupConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  Ec2AutoScalingGroup({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2AutoScalingGroup.fromJson(Map<String, dynamic> json) {
    return Ec2AutoScalingGroup(
      configuration: json['configuration'] != null
          ? Ec2AutoScalingGroupConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 reserved instances recommendation details.
///
/// @nodoc
class Ec2ReservedInstances {
  /// The EC2 reserved instances configuration used for recommendations.
  final Ec2ReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  Ec2ReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2ReservedInstances.fromJson(Map<String, dynamic> json) {
    return Ec2ReservedInstances(
      configuration: json['configuration'] != null
          ? Ec2ReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The RDS reserved instances recommendation details.
///
/// @nodoc
class RdsReservedInstances {
  /// The RDS reserved instances configuration used for recommendations.
  final RdsReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  RdsReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory RdsReservedInstances.fromJson(Map<String, dynamic> json) {
    return RdsReservedInstances(
      configuration: json['configuration'] != null
          ? RdsReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The ElastiCache reserved instances recommendation details.
///
/// @nodoc
class ElastiCacheReservedInstances {
  /// The ElastiCache reserved instances configuration used for recommendations.
  final ElastiCacheReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  ElastiCacheReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory ElastiCacheReservedInstances.fromJson(Map<String, dynamic> json) {
    return ElastiCacheReservedInstances(
      configuration: json['configuration'] != null
          ? ElastiCacheReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The OpenSearch reserved instances recommendation details.
///
/// @nodoc
class OpenSearchReservedInstances {
  /// The OpenSearch reserved instances configuration used for recommendations.
  final OpenSearchReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  OpenSearchReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory OpenSearchReservedInstances.fromJson(Map<String, dynamic> json) {
    return OpenSearchReservedInstances(
      configuration: json['configuration'] != null
          ? OpenSearchReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Redshift reserved instances recommendation details.
///
/// @nodoc
class RedshiftReservedInstances {
  /// The Redshift reserved instances configuration used for recommendations.
  final RedshiftReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  RedshiftReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory RedshiftReservedInstances.fromJson(Map<String, dynamic> json) {
    return RedshiftReservedInstances(
      configuration: json['configuration'] != null
          ? RedshiftReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 instance Savings Plans recommendation details.
///
/// @nodoc
class Ec2InstanceSavingsPlans {
  /// The EC2 instance Savings Plans configuration used for recommendations.
  final Ec2InstanceSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  Ec2InstanceSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2InstanceSavingsPlans.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceSavingsPlans(
      configuration: json['configuration'] != null
          ? Ec2InstanceSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Compute Savings Plans recommendation details.
///
/// @nodoc
class ComputeSavingsPlans {
  /// Configuration details of the Compute Savings Plans to purchase.
  final ComputeSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  ComputeSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory ComputeSavingsPlans.fromJson(Map<String, dynamic> json) {
    return ComputeSavingsPlans(
      configuration: json['configuration'] != null
          ? ComputeSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The SageMaker Savings Plans recommendation details.
///
/// @nodoc
class SageMakerSavingsPlans {
  /// The SageMaker Savings Plans configuration used for recommendations.
  final SageMakerSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  SageMakerSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory SageMakerSavingsPlans.fromJson(Map<String, dynamic> json) {
    return SageMakerSavingsPlans(
      configuration: json['configuration'] != null
          ? SageMakerSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// Contains the details of an Amazon RDS DB instance.
///
/// @nodoc
class RdsDbInstance {
  /// The Amazon RDS DB instance configuration used for recommendations.
  final RdsDbInstanceConfiguration? configuration;
  final ResourceCostCalculation? costCalculation;

  RdsDbInstance({
    this.configuration,
    this.costCalculation,
  });

  factory RdsDbInstance.fromJson(Map<String, dynamic> json) {
    return RdsDbInstance(
      configuration: json['configuration'] != null
          ? RdsDbInstanceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// Contains the details of an Amazon RDS DB instance storage.
///
/// @nodoc
class RdsDbInstanceStorage {
  /// The Amazon RDS DB instance storage configuration used for recommendations.
  final RdsDbInstanceStorageConfiguration? configuration;
  final ResourceCostCalculation? costCalculation;

  RdsDbInstanceStorage({
    this.configuration,
    this.costCalculation,
  });

  factory RdsDbInstanceStorage.fromJson(Map<String, dynamic> json) {
    return RdsDbInstanceStorage(
      configuration: json['configuration'] != null
          ? RdsDbInstanceStorageConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// Contains the details of an Aurora DB cluster storage.
///
/// @nodoc
class AuroraDbClusterStorage {
  /// The Aurora DB cluster storage configuration used for recommendations.
  final AuroraDbClusterStorageConfiguration? configuration;
  final ResourceCostCalculation? costCalculation;

  AuroraDbClusterStorage({
    this.configuration,
    this.costCalculation,
  });

  factory AuroraDbClusterStorage.fromJson(Map<String, dynamic> json) {
    return AuroraDbClusterStorage(
      configuration: json['configuration'] != null
          ? AuroraDbClusterStorageConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The DynamoDB reserved capacity recommendation details.
///
/// @nodoc
class DynamoDbReservedCapacity {
  /// The DynamoDB reserved capacity configuration used for recommendations.
  final DynamoDbReservedCapacityConfiguration? configuration;
  final ReservedInstancesCostCalculation? costCalculation;

  DynamoDbReservedCapacity({
    this.configuration,
    this.costCalculation,
  });

  factory DynamoDbReservedCapacity.fromJson(Map<String, dynamic> json) {
    return DynamoDbReservedCapacity(
      configuration: json['configuration'] != null
          ? DynamoDbReservedCapacityConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The MemoryDB reserved instances recommendation details.
/// <note>
/// While the API reference uses "MemoryDB reserved instances", the user guide
/// and other documentation refer to them as "MemoryDB reserved nodes", as the
/// terms are used interchangeably.
/// </note>
///
/// @nodoc
class MemoryDbReservedInstances {
  /// The MemoryDB reserved instances configuration used for recommendations.
  final MemoryDbReservedInstancesConfiguration? configuration;
  final ReservedInstancesCostCalculation? costCalculation;

  MemoryDbReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory MemoryDbReservedInstances.fromJson(Map<String, dynamic> json) {
    return MemoryDbReservedInstances(
      configuration: json['configuration'] != null
          ? MemoryDbReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The NAT Gateway recommendation details.
///
/// @nodoc
class NatGateway {
  /// The NAT Gateway configuration used for recommendations.
  final NatGatewayConfiguration? configuration;
  final ResourceCostCalculation? costCalculation;

  NatGateway({
    this.configuration,
    this.costCalculation,
  });

  factory NatGateway.fromJson(Map<String, dynamic> json) {
    return NatGateway(
      configuration: json['configuration'] != null
          ? NatGatewayConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The NAT Gateway configuration used for recommendations.
///
/// @nodoc
class NatGatewayConfiguration {
  /// The number of active connections through the NAT Gateway.
  final int? activeConnectionCount;

  /// The number of packets received from the destination through the NAT Gateway.
  final int? packetsInFromDestination;

  /// The number of packets received from the source through the NAT Gateway.
  final int? packetsInFromSource;

  NatGatewayConfiguration({
    this.activeConnectionCount,
    this.packetsInFromDestination,
    this.packetsInFromSource,
  });

  factory NatGatewayConfiguration.fromJson(Map<String, dynamic> json) {
    return NatGatewayConfiguration(
      activeConnectionCount: json['activeConnectionCount'] as int?,
      packetsInFromDestination: json['packetsInFromDestination'] as int?,
      packetsInFromSource: json['packetsInFromSource'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeConnectionCount = this.activeConnectionCount;
    final packetsInFromDestination = this.packetsInFromDestination;
    final packetsInFromSource = this.packetsInFromSource;
    return {
      if (activeConnectionCount != null)
        'activeConnectionCount': activeConnectionCount,
      if (packetsInFromDestination != null)
        'packetsInFromDestination': packetsInFromDestination,
      if (packetsInFromSource != null)
        'packetsInFromSource': packetsInFromSource,
    };
  }
}

/// Cost impact of the resource recommendation.
///
/// @nodoc
class ResourceCostCalculation {
  /// Pricing details of the resource recommendation.
  final ResourcePricing? pricing;

  /// Usage details of the resource recommendation.
  final List<Usage>? usages;

  ResourceCostCalculation({
    this.pricing,
    this.usages,
  });

  factory ResourceCostCalculation.fromJson(Map<String, dynamic> json) {
    return ResourceCostCalculation(
      pricing: json['pricing'] != null
          ? ResourcePricing.fromJson(json['pricing'] as Map<String, dynamic>)
          : null,
      usages: (json['usages'] as List?)
          ?.nonNulls
          .map((e) => Usage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    final usages = this.usages;
    return {
      if (pricing != null) 'pricing': pricing,
      if (usages != null) 'usages': usages,
    };
  }
}

/// Contains pricing information about the specified resource.
///
/// @nodoc
class ResourcePricing {
  /// The savings estimate incorporating all discounts with Amazon Web Services,
  /// such as Reserved Instances and Savings Plans.
  final double? estimatedCostAfterDiscounts;

  /// The savings estimate using Amazon Web Services public pricing without
  /// incorporating any discounts.
  final double? estimatedCostBeforeDiscounts;

  /// The estimated discounts for a recommendation.
  final EstimatedDiscounts? estimatedDiscounts;

  /// The estimated net unused amortized commitment for the recommendation.
  final double? estimatedNetUnusedAmortizedCommitments;

  ResourcePricing({
    this.estimatedCostAfterDiscounts,
    this.estimatedCostBeforeDiscounts,
    this.estimatedDiscounts,
    this.estimatedNetUnusedAmortizedCommitments,
  });

  factory ResourcePricing.fromJson(Map<String, dynamic> json) {
    return ResourcePricing(
      estimatedCostAfterDiscounts:
          json['estimatedCostAfterDiscounts'] as double?,
      estimatedCostBeforeDiscounts:
          json['estimatedCostBeforeDiscounts'] as double?,
      estimatedDiscounts: json['estimatedDiscounts'] != null
          ? EstimatedDiscounts.fromJson(
              json['estimatedDiscounts'] as Map<String, dynamic>)
          : null,
      estimatedNetUnusedAmortizedCommitments:
          json['estimatedNetUnusedAmortizedCommitments'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedCostAfterDiscounts = this.estimatedCostAfterDiscounts;
    final estimatedCostBeforeDiscounts = this.estimatedCostBeforeDiscounts;
    final estimatedDiscounts = this.estimatedDiscounts;
    final estimatedNetUnusedAmortizedCommitments =
        this.estimatedNetUnusedAmortizedCommitments;
    return {
      if (estimatedCostAfterDiscounts != null)
        'estimatedCostAfterDiscounts': estimatedCostAfterDiscounts,
      if (estimatedCostBeforeDiscounts != null)
        'estimatedCostBeforeDiscounts': estimatedCostBeforeDiscounts,
      if (estimatedDiscounts != null) 'estimatedDiscounts': estimatedDiscounts,
      if (estimatedNetUnusedAmortizedCommitments != null)
        'estimatedNetUnusedAmortizedCommitments':
            estimatedNetUnusedAmortizedCommitments,
    };
  }
}

/// Estimated discount details of the current and recommended resource
/// configuration for a recommendation.
///
/// @nodoc
class EstimatedDiscounts {
  /// Estimated other discounts include all discounts that are not itemized.
  /// Itemized discounts include <code>reservedInstanceDiscount</code> and
  /// <code>savingsPlansDiscount</code>.
  final double? otherDiscount;

  /// Estimated reserved instance discounts.
  final double? reservedInstancesDiscount;

  /// Estimated Savings Plans discounts.
  final double? savingsPlansDiscount;

  EstimatedDiscounts({
    this.otherDiscount,
    this.reservedInstancesDiscount,
    this.savingsPlansDiscount,
  });

  factory EstimatedDiscounts.fromJson(Map<String, dynamic> json) {
    return EstimatedDiscounts(
      otherDiscount: json['otherDiscount'] as double?,
      reservedInstancesDiscount: json['reservedInstancesDiscount'] as double?,
      savingsPlansDiscount: json['savingsPlansDiscount'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final otherDiscount = this.otherDiscount;
    final reservedInstancesDiscount = this.reservedInstancesDiscount;
    final savingsPlansDiscount = this.savingsPlansDiscount;
    return {
      if (otherDiscount != null) 'otherDiscount': otherDiscount,
      if (reservedInstancesDiscount != null)
        'reservedInstancesDiscount': reservedInstancesDiscount,
      if (savingsPlansDiscount != null)
        'savingsPlansDiscount': savingsPlansDiscount,
    };
  }
}

/// Details about the usage.
///
/// @nodoc
class Usage {
  /// The operation value.
  final String? operation;

  /// The product code.
  final String? productCode;

  /// The usage unit.
  final String? unit;

  /// The usage amount.
  final double? usageAmount;

  /// The usage type.
  final String? usageType;

  Usage({
    this.operation,
    this.productCode,
    this.unit,
    this.usageAmount,
    this.usageType,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      operation: json['operation'] as String?,
      productCode: json['productCode'] as String?,
      unit: json['unit'] as String?,
      usageAmount: json['usageAmount'] as double?,
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final productCode = this.productCode;
    final unit = this.unit;
    final usageAmount = this.usageAmount;
    final usageType = this.usageType;
    return {
      if (operation != null) 'operation': operation,
      if (productCode != null) 'productCode': productCode,
      if (unit != null) 'unit': unit,
      if (usageAmount != null) 'usageAmount': usageAmount,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

/// The MemoryDB reserved instances configuration used for recommendations.
/// <note>
/// While the API reference uses "MemoryDB reserved instances", the user guide
/// and other documentation refer to them as "MemoryDB reserved nodes", as the
/// terms are used interchangeably.
/// </note>
///
/// @nodoc
class MemoryDbReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing these reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing these reserved instances costs you upfront.
  final String? upfrontCost;

  MemoryDbReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory MemoryDbReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MemoryDbReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// Cost impact of the purchase recommendation.
///
/// @nodoc
class ReservedInstancesCostCalculation {
  /// Pricing details of the purchase recommendation.
  final ReservedInstancesPricing? pricing;

  ReservedInstancesCostCalculation({
    this.pricing,
  });

  factory ReservedInstancesCostCalculation.fromJson(Map<String, dynamic> json) {
    return ReservedInstancesCostCalculation(
      pricing: json['pricing'] != null
          ? ReservedInstancesPricing.fromJson(
              json['pricing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    return {
      if (pricing != null) 'pricing': pricing,
    };
  }
}

/// Pricing details for your recommended reserved instance.
///
/// @nodoc
class ReservedInstancesPricing {
  /// The estimated cost of your recurring monthly fees for the recommended
  /// reserved instance across the month.
  final double? estimatedMonthlyAmortizedReservationCost;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// reserved instance, over the length of the lookback period.
  final double? estimatedOnDemandCost;

  /// The cost of paying for the recommended reserved instance monthly.
  final double? monthlyReservationEligibleCost;

  /// The savings percentage relative to the total On-Demand costs that are
  /// associated with this instance.
  final double? savingsPercentage;

  ReservedInstancesPricing({
    this.estimatedMonthlyAmortizedReservationCost,
    this.estimatedOnDemandCost,
    this.monthlyReservationEligibleCost,
    this.savingsPercentage,
  });

  factory ReservedInstancesPricing.fromJson(Map<String, dynamic> json) {
    return ReservedInstancesPricing(
      estimatedMonthlyAmortizedReservationCost:
          json['estimatedMonthlyAmortizedReservationCost'] as double?,
      estimatedOnDemandCost: json['estimatedOnDemandCost'] as double?,
      monthlyReservationEligibleCost:
          json['monthlyReservationEligibleCost'] as double?,
      savingsPercentage: json['savingsPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlyAmortizedReservationCost =
        this.estimatedMonthlyAmortizedReservationCost;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final monthlyReservationEligibleCost = this.monthlyReservationEligibleCost;
    final savingsPercentage = this.savingsPercentage;
    return {
      if (estimatedMonthlyAmortizedReservationCost != null)
        'estimatedMonthlyAmortizedReservationCost':
            estimatedMonthlyAmortizedReservationCost,
      if (estimatedOnDemandCost != null)
        'estimatedOnDemandCost': estimatedOnDemandCost,
      if (monthlyReservationEligibleCost != null)
        'monthlyReservationEligibleCost': monthlyReservationEligibleCost,
      if (savingsPercentage != null) 'savingsPercentage': savingsPercentage,
    };
  }
}

/// The DynamoDB reserved capacity configuration used for recommendations.
///
/// @nodoc
class DynamoDbReservedCapacityConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// The capacity unit of the recommended reservation.
  final String? capacityUnits;

  /// How much purchasing this reserved capacity costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of reserved capacity units that Amazon Web Services recommends
  /// that you purchase.
  final String? numberOfCapacityUnitsToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// The reserved capacity recommendation term in years.
  final String? term;

  /// How much purchasing this reserved capacity costs you upfront.
  final String? upfrontCost;

  DynamoDbReservedCapacityConfiguration({
    this.accountScope,
    this.capacityUnits,
    this.monthlyRecurringCost,
    this.numberOfCapacityUnitsToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.term,
    this.upfrontCost,
  });

  factory DynamoDbReservedCapacityConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DynamoDbReservedCapacityConfiguration(
      accountScope: json['accountScope'] as String?,
      capacityUnits: json['capacityUnits'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      numberOfCapacityUnitsToPurchase:
          json['numberOfCapacityUnitsToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final capacityUnits = this.capacityUnits;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final numberOfCapacityUnitsToPurchase =
        this.numberOfCapacityUnitsToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (capacityUnits != null) 'capacityUnits': capacityUnits,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (numberOfCapacityUnitsToPurchase != null)
        'numberOfCapacityUnitsToPurchase': numberOfCapacityUnitsToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The Aurora DB cluster storage configuration used for recommendations.
///
/// @nodoc
class AuroraDbClusterStorageConfiguration {
  /// The storage type to associate with the Aurora DB cluster.
  final String? storageType;

  AuroraDbClusterStorageConfiguration({
    this.storageType,
  });

  factory AuroraDbClusterStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AuroraDbClusterStorageConfiguration(
      storageType: json['storageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageType = this.storageType;
    return {
      if (storageType != null) 'storageType': storageType,
    };
  }
}

/// The Amazon RDS DB instance storage configuration used for recommendations.
///
/// @nodoc
class RdsDbInstanceStorageConfiguration {
  /// The new amount of storage in GB to allocate for the DB instance.
  final double? allocatedStorageInGb;

  /// The amount of Provisioned IOPS (input/output operations per second) to be
  /// initially allocated for the DB instance.
  final double? iops;

  /// The storage throughput for the DB instance.
  final double? storageThroughput;

  /// The storage type to associate with the DB instance.
  final String? storageType;

  RdsDbInstanceStorageConfiguration({
    this.allocatedStorageInGb,
    this.iops,
    this.storageThroughput,
    this.storageType,
  });

  factory RdsDbInstanceStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsDbInstanceStorageConfiguration(
      allocatedStorageInGb: json['allocatedStorageInGb'] as double?,
      iops: json['iops'] as double?,
      storageThroughput: json['storageThroughput'] as double?,
      storageType: json['storageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorageInGb = this.allocatedStorageInGb;
    final iops = this.iops;
    final storageThroughput = this.storageThroughput;
    final storageType = this.storageType;
    return {
      if (allocatedStorageInGb != null)
        'allocatedStorageInGb': allocatedStorageInGb,
      if (iops != null) 'iops': iops,
      if (storageThroughput != null) 'storageThroughput': storageThroughput,
      if (storageType != null) 'storageType': storageType,
    };
  }
}

/// The Amazon RDS DB instance configuration used for recommendations.
///
/// @nodoc
class RdsDbInstanceConfiguration {
  /// Details about the instance configuration.
  final DbInstanceConfiguration? instance;

  RdsDbInstanceConfiguration({
    this.instance,
  });

  factory RdsDbInstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return RdsDbInstanceConfiguration(
      instance: json['instance'] != null
          ? DbInstanceConfiguration.fromJson(
              json['instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'instance': instance,
    };
  }
}

/// The DB instance configuration used for recommendations.
///
/// @nodoc
class DbInstanceConfiguration {
  /// The DB instance class of the DB instance.
  final String? dbInstanceClass;

  DbInstanceConfiguration({
    this.dbInstanceClass,
  });

  factory DbInstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return DbInstanceConfiguration(
      dbInstanceClass: json['dbInstanceClass'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbInstanceClass = this.dbInstanceClass;
    return {
      if (dbInstanceClass != null) 'dbInstanceClass': dbInstanceClass,
    };
  }
}

/// The SageMaker Savings Plans configuration used for recommendations.
///
/// @nodoc
class SageMakerSavingsPlansConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Savings Plans recommendation term in years.
  final String? term;

  SageMakerSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.paymentOption,
    this.term,
  });

  factory SageMakerSavingsPlansConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SageMakerSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      paymentOption: json['paymentOption'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final paymentOption = this.paymentOption;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (term != null) 'term': term,
    };
  }
}

/// Cost impact of the purchase recommendation.
///
/// @nodoc
class SavingsPlansCostCalculation {
  /// Pricing details of the purchase recommendation.
  final SavingsPlansPricing? pricing;

  SavingsPlansCostCalculation({
    this.pricing,
  });

  factory SavingsPlansCostCalculation.fromJson(Map<String, dynamic> json) {
    return SavingsPlansCostCalculation(
      pricing: json['pricing'] != null
          ? SavingsPlansPricing.fromJson(
              json['pricing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    return {
      if (pricing != null) 'pricing': pricing,
    };
  }
}

/// Pricing information about a Savings Plans.
///
/// @nodoc
class SavingsPlansPricing {
  /// Estimated monthly commitment for the Savings Plans.
  final double? estimatedMonthlyCommitment;

  /// Estimated On-Demand cost you will pay after buying the Savings Plans.
  final double? estimatedOnDemandCost;

  /// The cost of paying for the recommended Savings Plans monthly.
  final double? monthlySavingsPlansEligibleCost;

  /// Estimated savings as a percentage of your overall costs after buying the
  /// Savings Plans.
  final double? savingsPercentage;

  SavingsPlansPricing({
    this.estimatedMonthlyCommitment,
    this.estimatedOnDemandCost,
    this.monthlySavingsPlansEligibleCost,
    this.savingsPercentage,
  });

  factory SavingsPlansPricing.fromJson(Map<String, dynamic> json) {
    return SavingsPlansPricing(
      estimatedMonthlyCommitment: json['estimatedMonthlyCommitment'] as double?,
      estimatedOnDemandCost: json['estimatedOnDemandCost'] as double?,
      monthlySavingsPlansEligibleCost:
          json['monthlySavingsPlansEligibleCost'] as double?,
      savingsPercentage: json['savingsPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlyCommitment = this.estimatedMonthlyCommitment;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final monthlySavingsPlansEligibleCost =
        this.monthlySavingsPlansEligibleCost;
    final savingsPercentage = this.savingsPercentage;
    return {
      if (estimatedMonthlyCommitment != null)
        'estimatedMonthlyCommitment': estimatedMonthlyCommitment,
      if (estimatedOnDemandCost != null)
        'estimatedOnDemandCost': estimatedOnDemandCost,
      if (monthlySavingsPlansEligibleCost != null)
        'monthlySavingsPlansEligibleCost': monthlySavingsPlansEligibleCost,
      if (savingsPercentage != null) 'savingsPercentage': savingsPercentage,
    };
  }
}

/// The Compute Savings Plans configuration used for recommendations.
///
/// @nodoc
class ComputeSavingsPlansConfiguration {
  /// The account scope for which you want recommendations. Amazon Web Services
  /// calculates recommendations including the management account and member
  /// accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual member
  /// accounts only.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Savings Plans recommendation term in years.
  final String? term;

  ComputeSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.paymentOption,
    this.term,
  });

  factory ComputeSavingsPlansConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      paymentOption: json['paymentOption'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final paymentOption = this.paymentOption;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (term != null) 'term': term,
    };
  }
}

/// The EC2 instance Savings Plans configuration used for recommendations.
///
/// @nodoc
class Ec2InstanceSavingsPlansConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The instance family of the recommended Savings Plans.
  final String? instanceFamily;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? savingsPlansRegion;

  /// The Savings Plans recommendation term in years.
  final String? term;

  Ec2InstanceSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.instanceFamily,
    this.paymentOption,
    this.savingsPlansRegion,
    this.term,
  });

  factory Ec2InstanceSavingsPlansConfiguration.fromJson(
      Map<String, dynamic> json) {
    return Ec2InstanceSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      paymentOption: json['paymentOption'] as String?,
      savingsPlansRegion: json['savingsPlansRegion'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final instanceFamily = this.instanceFamily;
    final paymentOption = this.paymentOption;
    final savingsPlansRegion = this.savingsPlansRegion;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (savingsPlansRegion != null) 'savingsPlansRegion': savingsPlansRegion,
      if (term != null) 'term': term,
    };
  }
}

/// The Redshift reserved instances configuration used for recommendations.
///
/// @nodoc
class RedshiftReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing these reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  RedshiftReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory RedshiftReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The OpenSearch reserved instances configuration used for recommendations.
///
/// @nodoc
class OpenSearchReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing these reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  OpenSearchReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory OpenSearchReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenSearchReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The ElastiCache reserved instances configuration used for recommendations.
///
/// @nodoc
class ElastiCacheReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing these reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  ElastiCacheReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory ElastiCacheReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ElastiCacheReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The RDS reserved instances configuration used for recommendations.
///
/// @nodoc
class RdsReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The database edition that the recommended reservation supports.
  final String? databaseEdition;

  /// The database engine that the recommended reservation supports.
  final String? databaseEngine;

  /// Determines whether the recommendation is for a reservation in a single
  /// Availability Zone or a reservation with a backup in a second Availability
  /// Zone.
  final String? deploymentOption;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// The license model that the recommended reservation supports.
  final String? licenseModel;

  /// How much purchasing this instance costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  RdsReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.databaseEdition,
    this.databaseEngine,
    this.deploymentOption,
    this.instanceFamily,
    this.instanceType,
    this.licenseModel,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory RdsReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      databaseEdition: json['databaseEdition'] as String?,
      databaseEngine: json['databaseEngine'] as String?,
      deploymentOption: json['deploymentOption'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      licenseModel: json['licenseModel'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final databaseEdition = this.databaseEdition;
    final databaseEngine = this.databaseEngine;
    final deploymentOption = this.deploymentOption;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final licenseModel = this.licenseModel;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (databaseEdition != null) 'databaseEdition': databaseEdition,
      if (databaseEngine != null) 'databaseEngine': databaseEngine,
      if (deploymentOption != null) 'deploymentOption': deploymentOption,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (licenseModel != null) 'licenseModel': licenseModel,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The EC2 reserved instances configuration used for recommendations.
///
/// @nodoc
class Ec2ReservedInstancesConfiguration {
  /// The account scope for which you want recommendations.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing these reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// Indicates whether the recommendation is for standard or convertible
  /// reservations.
  final String? offeringClass;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The platform of the recommended reservation. The platform is the specific
  /// combination of operating system, license model, and software on an instance.
  final String? platform;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service for which you want recommendations.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// Determines whether the recommended reservation is dedicated or shared.
  final String? tenancy;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  Ec2ReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.offeringClass,
    this.paymentOption,
    this.platform,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.tenancy,
    this.term,
    this.upfrontCost,
  });

  factory Ec2ReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return Ec2ReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      offeringClass: json['offeringClass'] as String?,
      paymentOption: json['paymentOption'] as String?,
      platform: json['platform'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      tenancy: json['tenancy'] as String?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final offeringClass = this.offeringClass;
    final paymentOption = this.paymentOption;
    final platform = this.platform;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final tenancy = this.tenancy;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (offeringClass != null) 'offeringClass': offeringClass,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (platform != null) 'platform': platform,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (tenancy != null) 'tenancy': tenancy,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The EC2 Auto Scaling group configuration used for recommendations.
///
/// @nodoc
class Ec2AutoScalingGroupConfiguration {
  /// The strategy used for allocating instances, based on a predefined priority
  /// order or based on the lowest available price.
  final AllocationStrategy? allocationStrategy;

  /// Details about the instance for the EC2 Auto Scaling group with a single
  /// instance type.
  final InstanceConfiguration? instance;

  /// A list of instance types for an EC2 Auto Scaling group with mixed instance
  /// types.
  final List<MixedInstanceConfiguration>? mixedInstances;

  /// The type of EC2 Auto Scaling group, showing whether it consists of a single
  /// instance type or mixed instance types.
  final Ec2AutoScalingGroupType? type;

  Ec2AutoScalingGroupConfiguration({
    this.allocationStrategy,
    this.instance,
    this.mixedInstances,
    this.type,
  });

  factory Ec2AutoScalingGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return Ec2AutoScalingGroupConfiguration(
      allocationStrategy: (json['allocationStrategy'] as String?)
          ?.let(AllocationStrategy.fromString),
      instance: json['instance'] != null
          ? InstanceConfiguration.fromJson(
              json['instance'] as Map<String, dynamic>)
          : null,
      mixedInstances: (json['mixedInstances'] as List?)
          ?.nonNulls
          .map((e) =>
              MixedInstanceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.let(Ec2AutoScalingGroupType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    final instance = this.instance;
    final mixedInstances = this.mixedInstances;
    final type = this.type;
    return {
      if (allocationStrategy != null)
        'allocationStrategy': allocationStrategy.value,
      if (instance != null) 'instance': instance,
      if (mixedInstances != null) 'mixedInstances': mixedInstances,
      if (type != null) 'type': type.value,
    };
  }
}

/// The instance configuration used for recommendations.
///
/// @nodoc
class InstanceConfiguration {
  /// The instance type of the configuration.
  final String? type;

  InstanceConfiguration({
    this.type,
  });

  factory InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return InstanceConfiguration(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// @nodoc
class Ec2AutoScalingGroupType {
  static const singleInstanceType =
      Ec2AutoScalingGroupType._('SingleInstanceType');
  static const mixedInstanceTypes =
      Ec2AutoScalingGroupType._('MixedInstanceTypes');

  final String value;

  const Ec2AutoScalingGroupType._(this.value);

  static const values = [singleInstanceType, mixedInstanceTypes];

  static Ec2AutoScalingGroupType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2AutoScalingGroupType._(value));

  @override
  bool operator ==(other) =>
      other is Ec2AutoScalingGroupType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AllocationStrategy {
  static const prioritized = AllocationStrategy._('Prioritized');
  static const lowestPrice = AllocationStrategy._('LowestPrice');

  final String value;

  const AllocationStrategy._(this.value);

  static const values = [prioritized, lowestPrice];

  static AllocationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AllocationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is AllocationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for the EC2 Auto Scaling group with mixed instance types.
///
/// @nodoc
class MixedInstanceConfiguration {
  /// The instance type of the configuration.
  final String? type;

  MixedInstanceConfiguration({
    this.type,
  });

  factory MixedInstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return MixedInstanceConfiguration(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// The Amazon Elastic Block Store volume configuration used for
/// recommendations.
///
/// @nodoc
class EbsVolumeConfiguration {
  /// The Amazon Elastic Block Store attachment state.
  final String? attachmentState;

  /// The Amazon Elastic Block Store performance configuration.
  final BlockStoragePerformanceConfiguration? performance;

  /// The disk storage of the Amazon Elastic Block Store volume.
  final StorageConfiguration? storage;

  EbsVolumeConfiguration({
    this.attachmentState,
    this.performance,
    this.storage,
  });

  factory EbsVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return EbsVolumeConfiguration(
      attachmentState: json['attachmentState'] as String?,
      performance: json['performance'] != null
          ? BlockStoragePerformanceConfiguration.fromJson(
              json['performance'] as Map<String, dynamic>)
          : null,
      storage: json['storage'] != null
          ? StorageConfiguration.fromJson(
              json['storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentState = this.attachmentState;
    final performance = this.performance;
    final storage = this.storage;
    return {
      if (attachmentState != null) 'attachmentState': attachmentState,
      if (performance != null) 'performance': performance,
      if (storage != null) 'storage': storage,
    };
  }
}

/// The storage configuration used for recommendations.
///
/// @nodoc
class StorageConfiguration {
  /// The storage volume.
  final double? sizeInGb;

  /// The storage type.
  final String? type;

  StorageConfiguration({
    this.sizeInGb,
    this.type,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      sizeInGb: json['sizeInGb'] as double?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGb = this.sizeInGb;
    final type = this.type;
    return {
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (type != null) 'type': type,
    };
  }
}

/// Describes the Amazon Elastic Block Store performance configuration of the
/// current and recommended resource configuration for a recommendation.
///
/// @nodoc
class BlockStoragePerformanceConfiguration {
  /// The number of I/O operations per second.
  final double? iops;

  /// The throughput that the volume supports.
  final double? throughput;

  BlockStoragePerformanceConfiguration({
    this.iops,
    this.throughput,
  });

  factory BlockStoragePerformanceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BlockStoragePerformanceConfiguration(
      iops: json['iops'] as double?,
      throughput: json['throughput'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final throughput = this.throughput;
    return {
      if (iops != null) 'iops': iops,
      if (throughput != null) 'throughput': throughput,
    };
  }
}

/// The EC2 instance configuration used for recommendations.
///
/// @nodoc
class Ec2InstanceConfiguration {
  /// Details about the instance.
  final InstanceConfiguration? instance;

  Ec2InstanceConfiguration({
    this.instance,
  });

  factory Ec2InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceConfiguration(
      instance: json['instance'] != null
          ? InstanceConfiguration.fromJson(
              json['instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'instance': instance,
    };
  }
}

/// The ECS service configuration used for recommendations.
///
/// @nodoc
class EcsServiceConfiguration {
  /// Details about the compute configuration.
  final ComputeConfiguration? compute;

  EcsServiceConfiguration({
    this.compute,
  });

  factory EcsServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return EcsServiceConfiguration(
      compute: json['compute'] != null
          ? ComputeConfiguration.fromJson(
              json['compute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compute = this.compute;
    return {
      if (compute != null) 'compute': compute,
    };
  }
}

/// Describes the performance configuration for compute services such as Amazon
/// EC2, Lambda, and ECS.
///
/// @nodoc
class ComputeConfiguration {
  /// The architecture of the resource.
  final String? architecture;

  /// The memory size of the resource.
  final int? memorySizeInMB;

  /// The platform of the resource. The platform is the specific combination of
  /// operating system, license model, and software on an instance.
  final String? platform;

  /// The number of vCPU cores in the resource.
  final double? vCpu;

  ComputeConfiguration({
    this.architecture,
    this.memorySizeInMB,
    this.platform,
    this.vCpu,
  });

  factory ComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeConfiguration(
      architecture: json['architecture'] as String?,
      memorySizeInMB: json['memorySizeInMB'] as int?,
      platform: json['platform'] as String?,
      vCpu: json['vCpu'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final memorySizeInMB = this.memorySizeInMB;
    final platform = this.platform;
    final vCpu = this.vCpu;
    return {
      if (architecture != null) 'architecture': architecture,
      if (memorySizeInMB != null) 'memorySizeInMB': memorySizeInMB,
      if (platform != null) 'platform': platform,
      if (vCpu != null) 'vCpu': vCpu,
    };
  }
}

/// The Lambda function configuration used for recommendations.
///
/// @nodoc
class LambdaFunctionConfiguration {
  /// Details about the compute configuration.
  final ComputeConfiguration? compute;

  LambdaFunctionConfiguration({
    this.compute,
  });

  factory LambdaFunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionConfiguration(
      compute: json['compute'] != null
          ? ComputeConfiguration.fromJson(
              json['compute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compute = this.compute;
    return {
      if (compute != null) 'compute': compute,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
