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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'compute-optimizer-2019-11-01.g.dart';

/// AWS Compute Optimizer is a service that analyzes the configuration and
/// utilization metrics of your AWS resources, such as EC2 instances and Auto
/// Scaling groups. It reports whether your resources are optimal, and generates
/// optimization recommendations to reduce the cost and improve the performance
/// of your workloads. Compute Optimizer also provides recent utilization metric
/// data, as well as projected utilization metric data for the recommendations,
/// which you can use to evaluate which recommendation provides the best
/// price-performance trade-off. The analysis of your usage patterns can help
/// you decide when to move or resize your running resources, and still meet
/// your performance and capacity requirements. For more information about
/// Compute Optimizer, see the <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/">AWS Compute
/// Optimizer User Guide</a>.
class ComputeOptimizer {
  final _s.JsonProtocol _protocol;
  ComputeOptimizer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'compute-optimizer',
            signingName: 'compute-optimizer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns Auto Scaling group recommendations.
  ///
  /// AWS Compute Optimizer currently generates recommendations for Auto Scaling
  /// groups that are configured to run instances of the M, C, R, T, and X
  /// instance families. The service does not generate recommendations for Auto
  /// Scaling groups that have a scaling policy attached to them, or that do not
  /// have the same values for desired, minimum, and maximum capacity. In order
  /// for Compute Optimizer to analyze your Auto Scaling groups, they must be of
  /// a fixed size. For more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS
  /// Compute Optimizer User Guide</a>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The AWS account IDs for which to return Auto Scaling group
  /// recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [autoScalingGroupArns] :
  /// The Amazon Resource Name (ARN) of the Auto Scaling groups for which to
  /// return recommendations.
  ///
  /// Parameter [filters] :
  /// An array of objects that describe a filter that returns a more specific
  /// list of Auto Scaling group recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Auto Scaling group recommendations to return with a
  /// single call.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of Auto Scaling group
  /// recommendations.
  Future<GetAutoScalingGroupRecommendationsResponse>
      getAutoScalingGroupRecommendations({
    List<String> accountIds,
    List<String> autoScalingGroupArns,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetAutoScalingGroupRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (autoScalingGroupArns != null)
          'autoScalingGroupArns': autoScalingGroupArns,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetAutoScalingGroupRecommendationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns Amazon EC2 instance recommendations.
  ///
  /// AWS Compute Optimizer currently generates recommendations for Amazon
  /// Elastic Compute Cloud (Amazon EC2) and Amazon EC2 Auto Scaling. It
  /// generates recommendations for M, C, R, T, and X instance families. For
  /// more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS
  /// Compute Optimizer User Guide</a>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The AWS account IDs for which to return instance recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [filters] :
  /// An array of objects that describe a filter that returns a more specific
  /// list of instance recommendations.
  ///
  /// Parameter [instanceArns] :
  /// The Amazon Resource Name (ARN) of the instances for which to return
  /// recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instance recommendations to return with a single
  /// call.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of instance recommendations.
  Future<GetEC2InstanceRecommendationsResponse> getEC2InstanceRecommendations({
    List<String> accountIds,
    List<Filter> filters,
    List<String> instanceArns,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetEC2InstanceRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (instanceArns != null) 'instanceArns': instanceArns,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetEC2InstanceRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the projected utilization metrics of Amazon EC2 instance
  /// recommendations.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endTime] :
  /// The time stamp of the last projected metrics data point to return.
  ///
  /// Parameter [instanceArn] :
  /// The Amazon Resource Name (ARN) of the instances for which to return
  /// recommendation projected metrics.
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the projected metrics data points.
  ///
  /// Parameter [startTime] :
  /// The time stamp of the first projected metrics data point to return.
  ///
  /// Parameter [stat] :
  /// The statistic of the projected metrics.
  Future<GetEC2RecommendationProjectedMetricsResponse>
      getEC2RecommendationProjectedMetrics({
    @_s.required DateTime endTime,
    @_s.required String instanceArn,
    @_s.required int period,
    @_s.required DateTime startTime,
    @_s.required MetricStatistic stat,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(instanceArn, 'instanceArn');
    ArgumentError.checkNotNull(period, 'period');
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(stat, 'stat');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetEC2RecommendationProjectedMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'instanceArn': instanceArn,
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'stat': stat?.toValue() ?? '',
      },
    );

    return GetEC2RecommendationProjectedMetricsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the enrollment (opt in) status of an account to the AWS Compute
  /// Optimizer service.
  ///
  /// If the account is a master account of an organization, this operation also
  /// confirms the enrollment status of member accounts within the organization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  Future<GetEnrollmentStatusResponse> getEnrollmentStatus() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns the optimization findings for an account.
  ///
  /// For example, it returns the number of Amazon EC2 instances in an account
  /// that are under-provisioned, over-provisioned, or optimized. It also
  /// returns the number of Auto Scaling groups in an account that are not
  /// optimized, or optimized.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The AWS account IDs for which to return recommendation summaries.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendation summaries to return with a single
  /// call.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of recommendation summaries.
  Future<GetRecommendationSummariesResponse> getRecommendationSummaries({
    List<String> accountIds,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetRecommendationSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetRecommendationSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Updates the enrollment (opt in) status of an account to the AWS Compute
  /// Optimizer service.
  ///
  /// If the account is a master account of an organization, this operation can
  /// also enroll member accounts within the organization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [status] :
  /// The new enrollment status of the account.
  ///
  /// Accepted options are <code>Active</code> or <code>Inactive</code>. You
  /// will get an error if <code>Pending</code> or <code>Failed</code> are
  /// specified.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to enroll member accounts within the organization, if
  /// the account is a master account of an organization.
  Future<UpdateEnrollmentStatusResponse> updateEnrollmentStatus({
    @_s.required Status status,
    bool includeMemberAccounts,
  }) async {
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.UpdateEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'status': status?.toValue() ?? '',
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return UpdateEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }
}

/// Describes the configuration of an Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingGroupConfiguration {
  /// The desired capacity, or number of instances, for the Auto Scaling group.
  @_s.JsonKey(name: 'desiredCapacity')
  final int desiredCapacity;

  /// The instance type for the Auto Scaling group.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The maximum size, or maximum number of instances, for the Auto Scaling
  /// group.
  @_s.JsonKey(name: 'maxSize')
  final int maxSize;

  /// The minimum size, or minimum number of instances, for the Auto Scaling
  /// group.
  @_s.JsonKey(name: 'minSize')
  final int minSize;

  AutoScalingGroupConfiguration({
    this.desiredCapacity,
    this.instanceType,
    this.maxSize,
    this.minSize,
  });
  factory AutoScalingGroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingGroupConfigurationFromJson(json);
}

/// Describes an Auto Scaling group recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingGroupRecommendation {
  /// The AWS account ID of the Auto Scaling group.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the Auto Scaling group.
  @_s.JsonKey(name: 'autoScalingGroupArn')
  final String autoScalingGroupArn;

  /// The name of the Auto Scaling group.
  @_s.JsonKey(name: 'autoScalingGroupName')
  final String autoScalingGroupName;

  /// An array of objects that describe the current configuration of the Auto
  /// Scaling group.
  @_s.JsonKey(name: 'currentConfiguration')
  final AutoScalingGroupConfiguration currentConfiguration;

  /// The finding classification for the Auto Scaling group.
  ///
  /// Findings for Auto Scaling groups include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>NotOptimized</code> </b>—An Auto Scaling group is considered not
  /// optimized when AWS Compute Optimizer identifies a recommendation that can
  /// provide better performance for your workload.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b>—An Auto Scaling group is considered
  /// optimized when Compute Optimizer determines that the group is correctly
  /// provisioned to run your workload based on the chosen instance type. For
  /// optimized resources, Compute Optimizer might recommend a new generation
  /// instance type.
  /// </li>
  /// </ul> <note>
  /// The values that are returned might be <code>NOT_OPTIMIZED</code> or
  /// <code>OPTIMIZED</code>.
  /// </note>
  @_s.JsonKey(name: 'finding')
  final Finding finding;

  /// The time stamp of when the Auto Scaling group recommendation was last
  /// refreshed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastRefreshTimestamp')
  final DateTime lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the Auto
  /// Scaling group.
  @_s.JsonKey(name: 'lookBackPeriodInDays')
  final double lookBackPeriodInDays;

  /// An array of objects that describe the recommendation options for the Auto
  /// Scaling group.
  @_s.JsonKey(name: 'recommendationOptions')
  final List<AutoScalingGroupRecommendationOption> recommendationOptions;

  /// An array of objects that describe the utilization metrics of the Auto
  /// Scaling group.
  @_s.JsonKey(name: 'utilizationMetrics')
  final List<UtilizationMetric> utilizationMetrics;

  AutoScalingGroupRecommendation({
    this.accountId,
    this.autoScalingGroupArn,
    this.autoScalingGroupName,
    this.currentConfiguration,
    this.finding,
    this.lastRefreshTimestamp,
    this.lookBackPeriodInDays,
    this.recommendationOptions,
    this.utilizationMetrics,
  });
  factory AutoScalingGroupRecommendation.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingGroupRecommendationFromJson(json);
}

/// Describes a recommendation option for an Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingGroupRecommendationOption {
  /// An array of objects that describe an Auto Scaling group configuration.
  @_s.JsonKey(name: 'configuration')
  final AutoScalingGroupConfiguration configuration;

  /// The performance risk of the Auto Scaling group configuration recommendation.
  ///
  /// Performance risk is the likelihood of the recommended instance type not
  /// meeting the performance requirement of your workload.
  ///
  /// The lowest performance risk is categorized as <code>0</code>, and the
  /// highest as <code>5</code>.
  @_s.JsonKey(name: 'performanceRisk')
  final double performanceRisk;

  /// An array of objects that describe the projected utilization metrics of the
  /// Auto Scaling group recommendation option.
  @_s.JsonKey(name: 'projectedUtilizationMetrics')
  final List<UtilizationMetric> projectedUtilizationMetrics;

  /// The rank of the Auto Scaling group recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  @_s.JsonKey(name: 'rank')
  final int rank;

  AutoScalingGroupRecommendationOption({
    this.configuration,
    this.performanceRisk,
    this.projectedUtilizationMetrics,
    this.rank,
  });
  factory AutoScalingGroupRecommendationOption.fromJson(
          Map<String, dynamic> json) =>
      _$AutoScalingGroupRecommendationOptionFromJson(json);
}

/// Describes a filter that returns a more specific list of recommendations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to filter the results to a specific findings
  /// classification.
  ///
  /// Specify <code>RecommendationSourceType</code> to filter the results to a
  /// specific resource type.
  @_s.JsonKey(name: 'name')
  final FilterName name;

  /// The value of the filter.
  ///
  /// If you specify the <code>name</code> parameter as <code>Finding</code>, and
  /// you're recommendations for an <i>instance</i>, then the valid values are
  /// <code>Underprovisioned</code>, <code>Overprovisioned</code>,
  /// <code>NotOptimized</code>, or <code>Optimized</code>.
  ///
  /// If you specify the <code>name</code> parameter as <code>Finding</code>, and
  /// you're recommendations for an <i>Auto Scaling group</i>, then the valid
  /// values are <code>Optimized</code>, or <code>NotOptimized</code>.
  ///
  /// If you specify the <code>name</code> parameter as
  /// <code>RecommendationSourceType</code>, then the valid values are
  /// <code>EC2Instance</code>, or <code>AutoScalingGroup</code>.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

enum FilterName {
  @_s.JsonValue('Finding')
  finding,
  @_s.JsonValue('RecommendationSourceType')
  recommendationSourceType,
}

enum Finding {
  @_s.JsonValue('Underprovisioned')
  underprovisioned,
  @_s.JsonValue('Overprovisioned')
  overprovisioned,
  @_s.JsonValue('Optimized')
  optimized,
  @_s.JsonValue('NotOptimized')
  notOptimized,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAutoScalingGroupRecommendationsResponse {
  /// An array of objects that describe Auto Scaling group recommendations.
  @_s.JsonKey(name: 'autoScalingGroupRecommendations')
  final List<AutoScalingGroupRecommendation> autoScalingGroupRecommendations;

  /// An array of objects that describe errors of the request.
  ///
  /// For example, an error is returned if you request recommendations for an
  /// unsupported Auto Scaling group.
  @_s.JsonKey(name: 'errors')
  final List<GetRecommendationError> errors;

  /// The token to use to advance to the next page of Auto Scaling group
  /// recommendations.
  ///
  /// This value is null when there are no more pages of Auto Scaling group
  /// recommendations to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetAutoScalingGroupRecommendationsResponse({
    this.autoScalingGroupRecommendations,
    this.errors,
    this.nextToken,
  });
  factory GetAutoScalingGroupRecommendationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAutoScalingGroupRecommendationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEC2InstanceRecommendationsResponse {
  /// An array of objects that describe errors of the request.
  ///
  /// For example, an error is returned if you request recommendations for an
  /// instance of an unsupported instance family.
  @_s.JsonKey(name: 'errors')
  final List<GetRecommendationError> errors;

  /// An array of objects that describe instance recommendations.
  @_s.JsonKey(name: 'instanceRecommendations')
  final List<InstanceRecommendation> instanceRecommendations;

  /// The token to use to advance to the next page of instance recommendations.
  ///
  /// This value is null when there are no more pages of instance recommendations
  /// to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEC2InstanceRecommendationsResponse({
    this.errors,
    this.instanceRecommendations,
    this.nextToken,
  });
  factory GetEC2InstanceRecommendationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEC2InstanceRecommendationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEC2RecommendationProjectedMetricsResponse {
  /// An array of objects that describe a projected metrics.
  @_s.JsonKey(name: 'recommendedOptionProjectedMetrics')
  final List<RecommendedOptionProjectedMetric>
      recommendedOptionProjectedMetrics;

  GetEC2RecommendationProjectedMetricsResponse({
    this.recommendedOptionProjectedMetrics,
  });
  factory GetEC2RecommendationProjectedMetricsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEC2RecommendationProjectedMetricsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEnrollmentStatusResponse {
  /// Confirms the enrollment status of member accounts within the organization,
  /// if the account is a master account of an organization.
  @_s.JsonKey(name: 'memberAccountsEnrolled')
  final bool memberAccountsEnrolled;

  /// The enrollment status of the account.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The reason for the enrollment status of the account.
  ///
  /// For example, an account might show a status of <code>Pending</code> because
  /// member accounts of an organization require more time to be enrolled in the
  /// service.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  GetEnrollmentStatusResponse({
    this.memberAccountsEnrolled,
    this.status,
    this.statusReason,
  });
  factory GetEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEnrollmentStatusResponseFromJson(json);
}

/// Describes an error experienced when getting recommendations.
///
/// For example, an error is returned if you request recommendations for an
/// unsupported Auto Scaling group, or if you request recommendations for an
/// instance of an unsupported instance family.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommendationError {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The ID of the error.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// The message, or reason, for the error.
  @_s.JsonKey(name: 'message')
  final String message;

  GetRecommendationError({
    this.code,
    this.identifier,
    this.message,
  });
  factory GetRecommendationError.fromJson(Map<String, dynamic> json) =>
      _$GetRecommendationErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommendationSummariesResponse {
  /// The token to use to advance to the next page of recommendation summaries.
  ///
  /// This value is null when there are no more pages of recommendation summaries
  /// to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that summarize a recommendation.
  @_s.JsonKey(name: 'recommendationSummaries')
  final List<RecommendationSummary> recommendationSummaries;

  GetRecommendationSummariesResponse({
    this.nextToken,
    this.recommendationSummaries,
  });
  factory GetRecommendationSummariesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRecommendationSummariesResponseFromJson(json);
}

/// Describes an Amazon EC2 instance recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceRecommendation {
  /// The AWS account ID of the instance recommendation.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The instance type of the current instance.
  @_s.JsonKey(name: 'currentInstanceType')
  final String currentInstanceType;

  /// The finding classification for the instance.
  ///
  /// Findings for instances include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Underprovisioned</code> </b>—An instance is considered
  /// under-provisioned when at least one specification of your instance, such as
  /// CPU, memory, or network, does not meet the performance requirements of your
  /// workload. Under-provisioned instances may lead to poor application
  /// performance.
  /// </li>
  /// <li>
  /// <b> <code>Overprovisioned</code> </b>—An instance is considered
  /// over-provisioned when at least one specification of your instance, such as
  /// CPU, memory, or network, can be sized down while still meeting the
  /// performance requirements of your workload, and no specification is
  /// under-provisioned. Over-provisioned instances may lead to unnecessary
  /// infrastructure cost.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b>—An instance is considered optimized when all
  /// specifications of your instance, such as CPU, memory, and network, meet the
  /// performance requirements of your workload and is not over provisioned. An
  /// optimized instance runs your workloads with optimal performance and
  /// infrastructure cost. For optimized resources, AWS Compute Optimizer might
  /// recommend a new generation instance type.
  /// </li>
  /// </ul> <note>
  /// The values that are returned might be <code>UNDER_PROVISIONED</code>,
  /// <code>OVER_PROVISIONED</code>, or <code>OPTIMIZED</code>.
  /// </note>
  @_s.JsonKey(name: 'finding')
  final Finding finding;

  /// The Amazon Resource Name (ARN) of the current instance.
  @_s.JsonKey(name: 'instanceArn')
  final String instanceArn;

  /// The name of the current instance.
  @_s.JsonKey(name: 'instanceName')
  final String instanceName;

  /// The time stamp of when the instance recommendation was last refreshed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastRefreshTimestamp')
  final DateTime lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the
  /// instance.
  @_s.JsonKey(name: 'lookBackPeriodInDays')
  final double lookBackPeriodInDays;

  /// An array of objects that describe the recommendation options for the
  /// instance.
  @_s.JsonKey(name: 'recommendationOptions')
  final List<InstanceRecommendationOption> recommendationOptions;

  /// An array of objects that describe the source resource of the recommendation.
  @_s.JsonKey(name: 'recommendationSources')
  final List<RecommendationSource> recommendationSources;

  /// An array of objects that describe the utilization metrics of the instance.
  @_s.JsonKey(name: 'utilizationMetrics')
  final List<UtilizationMetric> utilizationMetrics;

  InstanceRecommendation({
    this.accountId,
    this.currentInstanceType,
    this.finding,
    this.instanceArn,
    this.instanceName,
    this.lastRefreshTimestamp,
    this.lookBackPeriodInDays,
    this.recommendationOptions,
    this.recommendationSources,
    this.utilizationMetrics,
  });
  factory InstanceRecommendation.fromJson(Map<String, dynamic> json) =>
      _$InstanceRecommendationFromJson(json);
}

/// Describes a recommendation option for an Amazon EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceRecommendationOption {
  /// The instance type of the instance recommendation.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The performance risk of the instance recommendation option.
  ///
  /// Performance risk is the likelihood of the recommended instance type not
  /// meeting the performance requirement of your workload.
  ///
  /// The lowest performance risk is categorized as <code>0</code>, and the
  /// highest as <code>5</code>.
  @_s.JsonKey(name: 'performanceRisk')
  final double performanceRisk;

  /// An array of objects that describe the projected utilization metrics of the
  /// instance recommendation option.
  @_s.JsonKey(name: 'projectedUtilizationMetrics')
  final List<UtilizationMetric> projectedUtilizationMetrics;

  /// The rank of the instance recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  @_s.JsonKey(name: 'rank')
  final int rank;

  InstanceRecommendationOption({
    this.instanceType,
    this.performanceRisk,
    this.projectedUtilizationMetrics,
    this.rank,
  });
  factory InstanceRecommendationOption.fromJson(Map<String, dynamic> json) =>
      _$InstanceRecommendationOptionFromJson(json);
}

enum MetricName {
  @_s.JsonValue('Cpu')
  cpu,
  @_s.JsonValue('Memory')
  memory,
}

enum MetricStatistic {
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('Average')
  average,
}

extension on MetricStatistic {
  String toValue() {
    switch (this) {
      case MetricStatistic.maximum:
        return 'Maximum';
      case MetricStatistic.average:
        return 'Average';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a projected utilization metric of a recommendation option, such as
/// an Amazon EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectedMetric {
  /// The name of the projected utilization metric.
  /// <note>
  /// Memory metrics are only returned for resources that have the unified
  /// CloudWatch agent installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note>
  @_s.JsonKey(name: 'name')
  final MetricName name;

  /// The time stamps of the projected utilization metric.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamps')
  final List<DateTime> timestamps;

  /// The values of the projected utilization metrics.
  @_s.JsonKey(name: 'values')
  final List<double> values;

  ProjectedMetric({
    this.name,
    this.timestamps,
    this.values,
  });
  factory ProjectedMetric.fromJson(Map<String, dynamic> json) =>
      _$ProjectedMetricFromJson(json);
}

/// Describes the source of a recommendation, such as an Amazon EC2 instance or
/// Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationSource {
  /// The Amazon Resource Name (ARN) of the recommendation source.
  @_s.JsonKey(name: 'recommendationSourceArn')
  final String recommendationSourceArn;

  /// The resource type of the recommendation source.
  @_s.JsonKey(name: 'recommendationSourceType')
  final RecommendationSourceType recommendationSourceType;

  RecommendationSource({
    this.recommendationSourceArn,
    this.recommendationSourceType,
  });
  factory RecommendationSource.fromJson(Map<String, dynamic> json) =>
      _$RecommendationSourceFromJson(json);
}

enum RecommendationSourceType {
  @_s.JsonValue('Ec2Instance')
  ec2Instance,
  @_s.JsonValue('AutoScalingGroup')
  autoScalingGroup,
}

/// A summary of a recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationSummary {
  /// The AWS account ID of the recommendation summary.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The resource type of the recommendation.
  @_s.JsonKey(name: 'recommendationResourceType')
  final RecommendationSourceType recommendationResourceType;

  /// An array of objects that describe a recommendation summary.
  @_s.JsonKey(name: 'summaries')
  final List<Summary> summaries;

  RecommendationSummary({
    this.accountId,
    this.recommendationResourceType,
    this.summaries,
  });
  factory RecommendationSummary.fromJson(Map<String, dynamic> json) =>
      _$RecommendationSummaryFromJson(json);
}

/// Describes a projected utilization metric of a recommendation option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendedOptionProjectedMetric {
  /// An array of objects that describe a projected utilization metric.
  @_s.JsonKey(name: 'projectedMetrics')
  final List<ProjectedMetric> projectedMetrics;

  /// The rank of the recommendation option projected metric.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  ///
  /// The projected metric rank correlates to the recommendation option rank. For
  /// example, the projected metric ranked as <code>1</code> is related to the
  /// recommendation option that is also ranked as <code>1</code> in the same
  /// response.
  @_s.JsonKey(name: 'rank')
  final int rank;

  /// The recommended instance type.
  @_s.JsonKey(name: 'recommendedInstanceType')
  final String recommendedInstanceType;

  RecommendedOptionProjectedMetric({
    this.projectedMetrics,
    this.rank,
    this.recommendedInstanceType,
  });
  factory RecommendedOptionProjectedMetric.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendedOptionProjectedMetricFromJson(json);
}

enum Status {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inactive')
  inactive,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Failed')
  failed,
}

extension on Status {
  String toValue() {
    switch (this) {
      case Status.active:
        return 'Active';
      case Status.inactive:
        return 'Inactive';
      case Status.pending:
        return 'Pending';
      case Status.failed:
        return 'Failed';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The summary of a recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Summary {
  /// The finding classification of the recommendation.
  @_s.JsonKey(name: 'name')
  final Finding name;

  /// The value of the recommendation summary.
  @_s.JsonKey(name: 'value')
  final double value;

  Summary({
    this.name,
    this.value,
  });
  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEnrollmentStatusResponse {
  /// The enrollment status of the account.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The reason for the enrollment status of the account. For example, an account
  /// might show a status of <code>Pending</code> because member accounts of an
  /// organization require more time to be enrolled in the service.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  UpdateEnrollmentStatusResponse({
    this.status,
    this.statusReason,
  });
  factory UpdateEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEnrollmentStatusResponseFromJson(json);
}

/// Describes a utilization metric of a resource, such as an Amazon EC2
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UtilizationMetric {
  /// The name of the utilization metric.
  /// <note>
  /// Memory metrics are only returned for resources that have the unified
  /// CloudWatch agent installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note>
  @_s.JsonKey(name: 'name')
  final MetricName name;

  /// The statistic of the utilization metric.
  @_s.JsonKey(name: 'statistic')
  final MetricStatistic statistic;

  /// The value of the utilization metric.
  @_s.JsonKey(name: 'value')
  final double value;

  UtilizationMetric({
    this.name,
    this.statistic,
    this.value,
  });
  factory UtilizationMetric.fromJson(Map<String, dynamic> json) =>
      _$UtilizationMetricFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class MissingAuthenticationToken extends _s.GenericAwsException {
  MissingAuthenticationToken({String type, String message})
      : super(type: type, code: 'MissingAuthenticationToken', message: message);
}

class OptInRequiredException extends _s.GenericAwsException {
  OptInRequiredException({String type, String message})
      : super(type: type, code: 'OptInRequiredException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'MissingAuthenticationToken': (type, message) =>
      MissingAuthenticationToken(type: type, message: message),
  'OptInRequiredException': (type, message) =>
      OptInRequiredException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
