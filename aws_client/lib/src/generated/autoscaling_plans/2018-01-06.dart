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

part '2018-01-06.g.dart';

/// Use AWS Auto Scaling to quickly discover all the scalable AWS resources for
/// your application and configure dynamic scaling and predictive scaling for
/// your resources using scaling plans. Use this service in conjunction with the
/// Amazon EC2 Auto Scaling, Application Auto Scaling, Amazon CloudWatch, and
/// AWS CloudFormation services.
class AutoScalingPlans {
  final _s.JsonProtocol _protocol;
  AutoScalingPlans({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'autoscaling-plans',
            signingName: 'autoscaling-plans',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a scaling plan.
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [applicationSource] :
  /// A CloudFormation stack or set of tags. You can create one scaling plan per
  /// application source.
  ///
  /// Parameter [scalingInstructions] :
  /// The scaling instructions.
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan. Names cannot contain vertical bars, colons,
  /// or forward slashes.
  Future<CreateScalingPlanResponse> createScalingPlan({
    @_s.required ApplicationSource applicationSource,
    @_s.required List<ScalingInstruction> scalingInstructions,
    @_s.required String scalingPlanName,
  }) async {
    ArgumentError.checkNotNull(applicationSource, 'applicationSource');
    ArgumentError.checkNotNull(scalingInstructions, 'scalingInstructions');
    ArgumentError.checkNotNull(scalingPlanName, 'scalingPlanName');
    _s.validateStringLength(
      'scalingPlanName',
      scalingPlanName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scalingPlanName',
      scalingPlanName,
      r'''[\p{Print}&&[^|:/]]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleScalingPlannerFrontendService.CreateScalingPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationSource': applicationSource,
        'ScalingInstructions': scalingInstructions,
        'ScalingPlanName': scalingPlanName,
      },
    );

    return CreateScalingPlanResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified scaling plan.
  ///
  /// Deleting a scaling plan deletes the underlying <a>ScalingInstruction</a>
  /// for all of the scalable resources that are covered by the plan.
  ///
  /// If the plan has launched resources or has scaling activities in progress,
  /// you must delete those resources separately.
  ///
  /// May throw [ValidationException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan.
  Future<void> deleteScalingPlan({
    @_s.required String scalingPlanName,
    @_s.required int scalingPlanVersion,
  }) async {
    ArgumentError.checkNotNull(scalingPlanName, 'scalingPlanName');
    _s.validateStringLength(
      'scalingPlanName',
      scalingPlanName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scalingPlanName',
      scalingPlanName,
      r'''[\p{Print}&&[^|:/]]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalingPlanVersion, 'scalingPlanVersion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleScalingPlannerFrontendService.DeleteScalingPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScalingPlanName': scalingPlanName,
        'ScalingPlanVersion': scalingPlanVersion,
      },
    );

    return DeleteScalingPlanResponse.fromJson(jsonResponse.body);
  }

  /// Describes the scalable resources in the specified scaling plan.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable resources to return. The value must be
  /// between 1 and 50. The default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<DescribeScalingPlanResourcesResponse> describeScalingPlanResources({
    @_s.required String scalingPlanName,
    @_s.required int scalingPlanVersion,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(scalingPlanName, 'scalingPlanName');
    _s.validateStringLength(
      'scalingPlanName',
      scalingPlanName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scalingPlanName',
      scalingPlanName,
      r'''[\p{Print}&&[^|:/]]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalingPlanVersion, 'scalingPlanVersion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AnyScaleScalingPlannerFrontendService.DescribeScalingPlanResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScalingPlanName': scalingPlanName,
        'ScalingPlanVersion': scalingPlanVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeScalingPlanResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more of your scaling plans.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [applicationSources] :
  /// The sources for the applications (up to 10). If you specify scaling plan
  /// names, you cannot specify application sources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable resources to return. This value can be
  /// between 1 and 50. The default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [scalingPlanNames] :
  /// The names of the scaling plans (up to 10). If you specify application
  /// sources, you cannot specify scaling plan names.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan. If you specify a scaling plan
  /// version, you must also specify a scaling plan name.
  Future<DescribeScalingPlansResponse> describeScalingPlans({
    List<ApplicationSource> applicationSources,
    int maxResults,
    String nextToken,
    List<String> scalingPlanNames,
    int scalingPlanVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AnyScaleScalingPlannerFrontendService.DescribeScalingPlans'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationSources != null)
          'ApplicationSources': applicationSources,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (scalingPlanNames != null) 'ScalingPlanNames': scalingPlanNames,
        if (scalingPlanVersion != null)
          'ScalingPlanVersion': scalingPlanVersion,
      },
    );

    return DescribeScalingPlansResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the forecast data for a scalable resource.
  ///
  /// Capacity forecasts are represented as predicted values, or data points,
  /// that are calculated using historical data points from a specified
  /// CloudWatch load metric. Data points are available for up to 56 days.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [endTime] :
  /// The exclusive end time of the time range for the forecast data to get. The
  /// maximum time duration between the start and end time is seven days.
  ///
  /// Although this parameter can accept a date and time that is more than two
  /// days in the future, the availability of forecast data has limits. AWS Auto
  /// Scaling only issues forecasts for periods of two days in advance.
  ///
  /// Parameter [forecastDataType] :
  /// The type of forecast data to get.
  ///
  /// <ul>
  /// <li>
  /// <code>LoadForecast</code>: The load metric forecast.
  /// </li>
  /// <li>
  /// <code>CapacityForecast</code>: The capacity forecast.
  /// </li>
  /// <li>
  /// <code>ScheduledActionMinCapacity</code>: The minimum capacity for each
  /// scheduled scaling action. This data is calculated as the larger of two
  /// values: the capacity forecast or the minimum capacity in the scaling
  /// instruction.
  /// </li>
  /// <li>
  /// <code>ScheduledActionMaxCapacity</code>: The maximum capacity for each
  /// scheduled scaling action. The calculation used is determined by the
  /// predictive scaling maximum capacity behavior setting in the scaling
  /// instruction.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource. This string consists of the resource type and
  /// unique identifier.
  ///
  /// <ul>
  /// <li>
  /// Auto Scaling group - The resource type is <code>autoScalingGroup</code>
  /// and the unique identifier is the name of the Auto Scaling group. Example:
  /// <code>autoScalingGroup/my-asg</code>.
  /// </li>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the resource ID. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension for the resource.
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service.
  ///
  /// Parameter [startTime] :
  /// The inclusive start time of the time range for the forecast data to get.
  /// The date and time can be at most 56 days before the current date and time.
  Future<GetScalingPlanResourceForecastDataResponse>
      getScalingPlanResourceForecastData({
    @_s.required DateTime endTime,
    @_s.required ForecastDataType forecastDataType,
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required String scalingPlanName,
    @_s.required int scalingPlanVersion,
    @_s.required ServiceNamespace serviceNamespace,
    @_s.required DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(forecastDataType, 'forecastDataType');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(scalingPlanName, 'scalingPlanName');
    _s.validateStringLength(
      'scalingPlanName',
      scalingPlanName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scalingPlanName',
      scalingPlanName,
      r'''[\p{Print}&&[^|:/]]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalingPlanVersion, 'scalingPlanVersion');
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    ArgumentError.checkNotNull(startTime, 'startTime');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AnyScaleScalingPlannerFrontendService.GetScalingPlanResourceForecastData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'ForecastDataType': forecastDataType?.toValue() ?? '',
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue() ?? '',
        'ScalingPlanName': scalingPlanName,
        'ScalingPlanVersion': scalingPlanVersion,
        'ServiceNamespace': serviceNamespace?.toValue() ?? '',
        'StartTime': unixTimestampToJson(startTime),
      },
    );

    return GetScalingPlanResourceForecastDataResponse.fromJson(
        jsonResponse.body);
  }

  /// Updates the specified scaling plan.
  ///
  /// You cannot update a scaling plan if it is in the process of being created,
  /// updated, or deleted.
  ///
  /// May throw [ValidationException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  /// May throw [ObjectNotFoundException].
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan.
  ///
  /// Parameter [applicationSource] :
  /// A CloudFormation stack or set of tags.
  ///
  /// Parameter [scalingInstructions] :
  /// The scaling instructions.
  Future<void> updateScalingPlan({
    @_s.required String scalingPlanName,
    @_s.required int scalingPlanVersion,
    ApplicationSource applicationSource,
    List<ScalingInstruction> scalingInstructions,
  }) async {
    ArgumentError.checkNotNull(scalingPlanName, 'scalingPlanName');
    _s.validateStringLength(
      'scalingPlanName',
      scalingPlanName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scalingPlanName',
      scalingPlanName,
      r'''[\p{Print}&&[^|:/]]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalingPlanVersion, 'scalingPlanVersion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleScalingPlannerFrontendService.UpdateScalingPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScalingPlanName': scalingPlanName,
        'ScalingPlanVersion': scalingPlanVersion,
        if (applicationSource != null) 'ApplicationSource': applicationSource,
        if (scalingInstructions != null)
          'ScalingInstructions': scalingInstructions,
      },
    );

    return UpdateScalingPlanResponse.fromJson(jsonResponse.body);
  }
}

/// Represents an application source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ApplicationSource {
  /// The Amazon Resource Name (ARN) of a AWS CloudFormation stack.
  @_s.JsonKey(name: 'CloudFormationStackARN')
  final String cloudFormationStackARN;

  /// A set of tags (up to 50).
  @_s.JsonKey(name: 'TagFilters')
  final List<TagFilter> tagFilters;

  ApplicationSource({
    this.cloudFormationStackARN,
    this.tagFilters,
  });
  factory ApplicationSource.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationSourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateScalingPlanResponse {
  /// The version number of the scaling plan. This value is always 1.
  ///
  /// Currently, you cannot specify multiple scaling plan versions.
  @_s.JsonKey(name: 'ScalingPlanVersion')
  final int scalingPlanVersion;

  CreateScalingPlanResponse({
    @_s.required this.scalingPlanVersion,
  });
  factory CreateScalingPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateScalingPlanResponseFromJson(json);
}

/// Represents a CloudWatch metric of your choosing that can be used for
/// predictive scaling.
///
/// For predictive scaling to work with a customized load metric specification,
/// AWS Auto Scaling needs access to the <code>Sum</code> and
/// <code>Average</code> statistics that CloudWatch computes from metric data.
/// Statistics are calculations used to aggregate data over specified time
/// periods.
///
/// When you choose a load metric, make sure that the required <code>Sum</code>
/// and <code>Average</code> statistics for your metric are available in
/// CloudWatch and that they provide relevant data for predictive scaling. The
/// <code>Sum</code> statistic must represent the total load on the resource,
/// and the <code>Average</code> statistic must represent the average load per
/// capacity unit of the resource. For example, there is a metric that counts
/// the number of requests processed by your Auto Scaling group. If the
/// <code>Sum</code> statistic represents the total request count processed by
/// the group, then the <code>Average</code> statistic for the specified metric
/// must represent the average request count processed by each instance of the
/// group.
///
/// For information about terminology, available metrics, or how to publish new
/// metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a> in the <i>Amazon CloudWatch User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomizedLoadMetricSpecification {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The statistic of the metric. Currently, the value must always be
  /// <code>Sum</code>.
  @_s.JsonKey(name: 'Statistic')
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your customized load metric specification.
  @_s.JsonKey(name: 'Dimensions')
  final List<MetricDimension> dimensions;

  /// The unit of the metric.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  CustomizedLoadMetricSpecification({
    @_s.required this.metricName,
    @_s.required this.namespace,
    @_s.required this.statistic,
    this.dimensions,
    this.unit,
  });
  factory CustomizedLoadMetricSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$CustomizedLoadMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomizedLoadMetricSpecificationToJson(this);
}

/// Represents a CloudWatch metric of your choosing that can be used for dynamic
/// scaling as part of a target tracking scaling policy.
///
/// To create your customized scaling metric specification:
///
/// <ul>
/// <li>
/// Add values for each required parameter from CloudWatch. You can use an
/// existing metric, or a new metric that you create. To use your own metric,
/// you must first publish the metric to CloudWatch. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publish
/// Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
/// </li>
/// <li>
/// Choose a metric that changes proportionally with capacity. The value of the
/// metric should increase or decrease in inverse proportion to the number of
/// capacity units. That is, the value of the metric should decrease when
/// capacity increases.
/// </li>
/// </ul>
/// For more information about CloudWatch, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomizedScalingMetricSpecification {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The statistic of the metric.
  @_s.JsonKey(name: 'Statistic')
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your customized scaling metric specification.
  @_s.JsonKey(name: 'Dimensions')
  final List<MetricDimension> dimensions;

  /// The unit of the metric.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  CustomizedScalingMetricSpecification({
    @_s.required this.metricName,
    @_s.required this.namespace,
    @_s.required this.statistic,
    this.dimensions,
    this.unit,
  });
  factory CustomizedScalingMetricSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$CustomizedScalingMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomizedScalingMetricSpecificationToJson(this);
}

/// Represents a single value in the forecast data used for predictive scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Datapoint {
  /// The time stamp for the data point in UTC format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// The value of the data point.
  @_s.JsonKey(name: 'Value')
  final double value;

  Datapoint({
    this.timestamp,
    this.value,
  });
  factory Datapoint.fromJson(Map<String, dynamic> json) =>
      _$DatapointFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScalingPlanResponse {
  DeleteScalingPlanResponse();
  factory DeleteScalingPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScalingPlanResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalingPlanResourcesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the scalable resources.
  @_s.JsonKey(name: 'ScalingPlanResources')
  final List<ScalingPlanResource> scalingPlanResources;

  DescribeScalingPlanResourcesResponse({
    this.nextToken,
    this.scalingPlanResources,
  });
  factory DescribeScalingPlanResourcesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeScalingPlanResourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalingPlansResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the scaling plans.
  @_s.JsonKey(name: 'ScalingPlans')
  final List<ScalingPlan> scalingPlans;

  DescribeScalingPlansResponse({
    this.nextToken,
    this.scalingPlans,
  });
  factory DescribeScalingPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScalingPlansResponseFromJson(json);
}

enum ForecastDataType {
  @_s.JsonValue('CapacityForecast')
  capacityForecast,
  @_s.JsonValue('LoadForecast')
  loadForecast,
  @_s.JsonValue('ScheduledActionMinCapacity')
  scheduledActionMinCapacity,
  @_s.JsonValue('ScheduledActionMaxCapacity')
  scheduledActionMaxCapacity,
}

extension on ForecastDataType {
  String toValue() {
    switch (this) {
      case ForecastDataType.capacityForecast:
        return 'CapacityForecast';
      case ForecastDataType.loadForecast:
        return 'LoadForecast';
      case ForecastDataType.scheduledActionMinCapacity:
        return 'ScheduledActionMinCapacity';
      case ForecastDataType.scheduledActionMaxCapacity:
        return 'ScheduledActionMaxCapacity';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetScalingPlanResourceForecastDataResponse {
  /// The data points to return.
  @_s.JsonKey(name: 'Datapoints')
  final List<Datapoint> datapoints;

  GetScalingPlanResourceForecastDataResponse({
    @_s.required this.datapoints,
  });
  factory GetScalingPlanResourceForecastDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetScalingPlanResourceForecastDataResponseFromJson(json);
}

enum LoadMetricType {
  @_s.JsonValue('ASGTotalCPUUtilization')
  aSGTotalCPUUtilization,
  @_s.JsonValue('ASGTotalNetworkIn')
  aSGTotalNetworkIn,
  @_s.JsonValue('ASGTotalNetworkOut')
  aSGTotalNetworkOut,
  @_s.JsonValue('ALBTargetGroupRequestCount')
  aLBTargetGroupRequestCount,
}

/// Represents a dimension for a customized metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDimension {
  /// The name of the dimension.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  MetricDimension({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory MetricDimension.fromJson(Map<String, dynamic> json) =>
      _$MetricDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

enum MetricStatistic {
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('SampleCount')
  sampleCount,
  @_s.JsonValue('Sum')
  sum,
}

enum PolicyType {
  @_s.JsonValue('TargetTrackingScaling')
  targetTrackingScaling,
}

/// Represents a predefined metric that can be used for predictive scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PredefinedLoadMetricSpecification {
  /// The metric type.
  @_s.JsonKey(name: 'PredefinedLoadMetricType')
  final LoadMetricType predefinedLoadMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group for an
  /// Application Load Balancer attached to the Auto Scaling group.
  ///
  /// The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN.
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceLabel')
  final String resourceLabel;

  PredefinedLoadMetricSpecification({
    @_s.required this.predefinedLoadMetricType,
    this.resourceLabel,
  });
  factory PredefinedLoadMetricSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$PredefinedLoadMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PredefinedLoadMetricSpecificationToJson(this);
}

/// Represents a predefined metric that can be used for dynamic scaling as part
/// of a target tracking scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PredefinedScalingMetricSpecification {
  /// The metric type. The <code>ALBRequestCountPerTarget</code> metric type
  /// applies only to Auto Scaling groups, Spot Fleet requests, and ECS services.
  @_s.JsonKey(name: 'PredefinedScalingMetricType')
  final ScalingMetricType predefinedScalingMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group for an
  /// Application Load Balancer attached to the Auto Scaling group, Spot Fleet
  /// request, or ECS service.
  ///
  /// The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN.
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceLabel')
  final String resourceLabel;

  PredefinedScalingMetricSpecification({
    @_s.required this.predefinedScalingMetricType,
    this.resourceLabel,
  });
  factory PredefinedScalingMetricSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$PredefinedScalingMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PredefinedScalingMetricSpecificationToJson(this);
}

enum PredictiveScalingMaxCapacityBehavior {
  @_s.JsonValue('SetForecastCapacityToMaxCapacity')
  setForecastCapacityToMaxCapacity,
  @_s.JsonValue('SetMaxCapacityToForecastCapacity')
  setMaxCapacityToForecastCapacity,
  @_s.JsonValue('SetMaxCapacityAboveForecastCapacity')
  setMaxCapacityAboveForecastCapacity,
}

enum PredictiveScalingMode {
  @_s.JsonValue('ForecastAndScale')
  forecastAndScale,
  @_s.JsonValue('ForecastOnly')
  forecastOnly,
}

enum ScalableDimension {
  @_s.JsonValue('autoscaling:autoScalingGroup:DesiredCapacity')
  autoscalingAutoScalingGroupDesiredCapacity,
  @_s.JsonValue('ecs:service:DesiredCount')
  ecsServiceDesiredCount,
  @_s.JsonValue('ec2:spot-fleet-request:TargetCapacity')
  ec2SpotFleetRequestTargetCapacity,
  @_s.JsonValue('rds:cluster:ReadReplicaCount')
  rdsClusterReadReplicaCount,
  @_s.JsonValue('dynamodb:table:ReadCapacityUnits')
  dynamodbTableReadCapacityUnits,
  @_s.JsonValue('dynamodb:table:WriteCapacityUnits')
  dynamodbTableWriteCapacityUnits,
  @_s.JsonValue('dynamodb:index:ReadCapacityUnits')
  dynamodbIndexReadCapacityUnits,
  @_s.JsonValue('dynamodb:index:WriteCapacityUnits')
  dynamodbIndexWriteCapacityUnits,
}

extension on ScalableDimension {
  String toValue() {
    switch (this) {
      case ScalableDimension.autoscalingAutoScalingGroupDesiredCapacity:
        return 'autoscaling:autoScalingGroup:DesiredCapacity';
      case ScalableDimension.ecsServiceDesiredCount:
        return 'ecs:service:DesiredCount';
      case ScalableDimension.ec2SpotFleetRequestTargetCapacity:
        return 'ec2:spot-fleet-request:TargetCapacity';
      case ScalableDimension.rdsClusterReadReplicaCount:
        return 'rds:cluster:ReadReplicaCount';
      case ScalableDimension.dynamodbTableReadCapacityUnits:
        return 'dynamodb:table:ReadCapacityUnits';
      case ScalableDimension.dynamodbTableWriteCapacityUnits:
        return 'dynamodb:table:WriteCapacityUnits';
      case ScalableDimension.dynamodbIndexReadCapacityUnits:
        return 'dynamodb:index:ReadCapacityUnits';
      case ScalableDimension.dynamodbIndexWriteCapacityUnits:
        return 'dynamodb:index:WriteCapacityUnits';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a scaling instruction for a scalable resource.
///
/// The scaling instruction is used in combination with a scaling plan, which is
/// a set of instructions for configuring dynamic scaling and predictive scaling
/// for the scalable resources in your application. Each scaling instruction
/// applies to one resource.
///
/// AWS Auto Scaling creates target tracking scaling policies based on the
/// scaling instructions. Target tracking scaling policies adjust the capacity
/// of your scalable resource as required to maintain resource utilization at
/// the target value that you specified.
///
/// AWS Auto Scaling also configures predictive scaling for your Amazon EC2 Auto
/// Scaling groups using a subset of parameters, including the load metric, the
/// scaling metric, the target value for the scaling metric, the predictive
/// scaling mode (forecast and scale or forecast only), and the desired behavior
/// when the forecast capacity exceeds the maximum capacity of the resource.
/// With predictive scaling, AWS Auto Scaling generates forecasts with traffic
/// predictions for the two days ahead and schedules scaling actions that
/// proactively add and remove resource capacity to match the forecast.
///
/// We recommend waiting a minimum of 24 hours after creating an Auto Scaling
/// group to configure predictive scaling. At minimum, there must be 24 hours of
/// historical data to generate a forecast.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/plans/userguide/auto-scaling-getting-started.html">Getting
/// Started with AWS Auto Scaling</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalingInstruction {
  /// The maximum capacity of the resource. The exception to this upper limit is
  /// if you specify a non-default setting for
  /// <b>PredictiveScalingMaxCapacityBehavior</b>.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The minimum capacity of the resource.
  @_s.JsonKey(name: 'MinCapacity')
  final int minCapacity;

  /// The ID of the resource. This string consists of the resource type and unique
  /// identifier.
  ///
  /// <ul>
  /// <li>
  /// Auto Scaling group - The resource type is <code>autoScalingGroup</code> and
  /// the unique identifier is the name of the Auto Scaling group. Example:
  /// <code>autoScalingGroup/my-asg</code>.
  /// </li>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the resource ID. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The scalable dimension associated with the resource.
  ///
  /// <ul>
  /// <li>
  /// <code>autoscaling:autoScalingGroup:DesiredCapacity</code> - The desired
  /// capacity of an Auto Scaling group.
  /// </li>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The namespace of the AWS service.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;

  /// The structure that defines new target tracking configurations (up to 10).
  /// Each of these structures includes a specific scaling metric and a target
  /// value for the metric, along with various parameters to use with dynamic
  /// scaling.
  ///
  /// With predictive scaling and dynamic scaling, the resource scales based on
  /// the target tracking configuration that provides the largest capacity for
  /// both scale in and scale out.
  ///
  /// Condition: The scaling metric must be unique across target tracking
  /// configurations.
  @_s.JsonKey(name: 'TargetTrackingConfigurations')
  final List<TargetTrackingConfiguration> targetTrackingConfigurations;

  /// The customized load metric to use for predictive scaling. This parameter or
  /// a <b>PredefinedLoadMetricSpecification</b> is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  @_s.JsonKey(name: 'CustomizedLoadMetricSpecification')
  final CustomizedLoadMetricSpecification customizedLoadMetricSpecification;

  /// Controls whether dynamic scaling by AWS Auto Scaling is disabled. When
  /// dynamic scaling is enabled, AWS Auto Scaling creates target tracking scaling
  /// policies based on the specified target tracking configurations.
  ///
  /// The default is enabled (<code>false</code>).
  @_s.JsonKey(name: 'DisableDynamicScaling')
  final bool disableDynamicScaling;

  /// The predefined load metric to use for predictive scaling. This parameter or
  /// a <b>CustomizedLoadMetricSpecification</b> is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  @_s.JsonKey(name: 'PredefinedLoadMetricSpecification')
  final PredefinedLoadMetricSpecification predefinedLoadMetricSpecification;

  /// Defines the behavior that should be applied if the forecast capacity
  /// approaches or exceeds the maximum capacity specified for the resource. The
  /// default value is <code>SetForecastCapacityToMaxCapacity</code>.
  ///
  /// The following are possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>SetForecastCapacityToMaxCapacity</code> - AWS Auto Scaling cannot
  /// scale resource capacity higher than the maximum capacity. The maximum
  /// capacity is enforced as a hard limit.
  /// </li>
  /// <li>
  /// <code>SetMaxCapacityToForecastCapacity</code> - AWS Auto Scaling may scale
  /// resource capacity higher than the maximum capacity to equal but not exceed
  /// forecast capacity.
  /// </li>
  /// <li>
  /// <code>SetMaxCapacityAboveForecastCapacity</code> - AWS Auto Scaling may
  /// scale resource capacity higher than the maximum capacity by a specified
  /// buffer value. The intention is to give the target tracking scaling policy
  /// extra capacity if unexpected traffic occurs.
  /// </li>
  /// </ul>
  /// Only valid when configuring predictive scaling.
  @_s.JsonKey(name: 'PredictiveScalingMaxCapacityBehavior')
  final PredictiveScalingMaxCapacityBehavior
      predictiveScalingMaxCapacityBehavior;

  /// The size of the capacity buffer to use when the forecast capacity is close
  /// to or exceeds the maximum capacity. The value is specified as a percentage
  /// relative to the forecast capacity. For example, if the buffer is 10, this
  /// means a 10 percent buffer, such that if the forecast capacity is 50, and the
  /// maximum capacity is 40, then the effective maximum capacity is 55.
  ///
  /// Only valid when configuring predictive scaling. Required if the
  /// <b>PredictiveScalingMaxCapacityBehavior</b> is set to
  /// <code>SetMaxCapacityAboveForecastCapacity</code>, and cannot be used
  /// otherwise.
  ///
  /// The range is 1-100.
  @_s.JsonKey(name: 'PredictiveScalingMaxCapacityBuffer')
  final int predictiveScalingMaxCapacityBuffer;

  /// The predictive scaling mode. The default value is
  /// <code>ForecastAndScale</code>. Otherwise, AWS Auto Scaling forecasts
  /// capacity but does not create any scheduled scaling actions based on the
  /// capacity forecast.
  @_s.JsonKey(name: 'PredictiveScalingMode')
  final PredictiveScalingMode predictiveScalingMode;

  /// Controls whether a resource's externally created scaling policies are kept
  /// or replaced.
  ///
  /// The default value is <code>KeepExternalPolicies</code>. If the parameter is
  /// set to <code>ReplaceExternalPolicies</code>, any scaling policies that are
  /// external to AWS Auto Scaling are deleted and new target tracking scaling
  /// policies created.
  ///
  /// Only valid when configuring dynamic scaling.
  ///
  /// Condition: The number of existing policies to be replaced must be less than
  /// or equal to 50. If there are more than 50 policies to be replaced, AWS Auto
  /// Scaling keeps all existing policies and does not create new ones.
  @_s.JsonKey(name: 'ScalingPolicyUpdateBehavior')
  final ScalingPolicyUpdateBehavior scalingPolicyUpdateBehavior;

  /// The amount of time, in seconds, to buffer the run time of scheduled scaling
  /// actions when scaling out. For example, if the forecast says to add capacity
  /// at 10:00 AM, and the buffer time is 5 minutes, then the run time of the
  /// corresponding scheduled scaling action will be 9:55 AM. The intention is to
  /// give resources time to be provisioned. For example, it can take a few
  /// minutes to launch an EC2 instance. The actual amount of time required
  /// depends on several factors, such as the size of the instance and whether
  /// there are startup scripts to complete.
  ///
  /// The value must be less than the forecast interval duration of 3600 seconds
  /// (60 minutes). The default is 300 seconds.
  ///
  /// Only valid when configuring predictive scaling.
  @_s.JsonKey(name: 'ScheduledActionBufferTime')
  final int scheduledActionBufferTime;

  ScalingInstruction({
    @_s.required this.maxCapacity,
    @_s.required this.minCapacity,
    @_s.required this.resourceId,
    @_s.required this.scalableDimension,
    @_s.required this.serviceNamespace,
    @_s.required this.targetTrackingConfigurations,
    this.customizedLoadMetricSpecification,
    this.disableDynamicScaling,
    this.predefinedLoadMetricSpecification,
    this.predictiveScalingMaxCapacityBehavior,
    this.predictiveScalingMaxCapacityBuffer,
    this.predictiveScalingMode,
    this.scalingPolicyUpdateBehavior,
    this.scheduledActionBufferTime,
  });
  factory ScalingInstruction.fromJson(Map<String, dynamic> json) =>
      _$ScalingInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$ScalingInstructionToJson(this);
}

enum ScalingMetricType {
  @_s.JsonValue('ASGAverageCPUUtilization')
  aSGAverageCPUUtilization,
  @_s.JsonValue('ASGAverageNetworkIn')
  aSGAverageNetworkIn,
  @_s.JsonValue('ASGAverageNetworkOut')
  aSGAverageNetworkOut,
  @_s.JsonValue('DynamoDBReadCapacityUtilization')
  dynamoDBReadCapacityUtilization,
  @_s.JsonValue('DynamoDBWriteCapacityUtilization')
  dynamoDBWriteCapacityUtilization,
  @_s.JsonValue('ECSServiceAverageCPUUtilization')
  eCSServiceAverageCPUUtilization,
  @_s.JsonValue('ECSServiceAverageMemoryUtilization')
  eCSServiceAverageMemoryUtilization,
  @_s.JsonValue('ALBRequestCountPerTarget')
  aLBRequestCountPerTarget,
  @_s.JsonValue('RDSReaderAverageCPUUtilization')
  rDSReaderAverageCPUUtilization,
  @_s.JsonValue('RDSReaderAverageDatabaseConnections')
  rDSReaderAverageDatabaseConnections,
  @_s.JsonValue('EC2SpotFleetRequestAverageCPUUtilization')
  eC2SpotFleetRequestAverageCPUUtilization,
  @_s.JsonValue('EC2SpotFleetRequestAverageNetworkIn')
  eC2SpotFleetRequestAverageNetworkIn,
  @_s.JsonValue('EC2SpotFleetRequestAverageNetworkOut')
  eC2SpotFleetRequestAverageNetworkOut,
}

/// Represents a scaling plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingPlan {
  /// The application source.
  @_s.JsonKey(name: 'ApplicationSource')
  final ApplicationSource applicationSource;

  /// The scaling instructions.
  @_s.JsonKey(name: 'ScalingInstructions')
  final List<ScalingInstruction> scalingInstructions;

  /// The name of the scaling plan.
  @_s.JsonKey(name: 'ScalingPlanName')
  final String scalingPlanName;

  /// The version number of the scaling plan.
  @_s.JsonKey(name: 'ScalingPlanVersion')
  final int scalingPlanVersion;

  /// The status of the scaling plan.
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code> - The scaling plan is active.
  /// </li>
  /// <li>
  /// <code>ActiveWithProblems</code> - The scaling plan is active, but the
  /// scaling configuration for one or more resources could not be applied.
  /// </li>
  /// <li>
  /// <code>CreationInProgress</code> - The scaling plan is being created.
  /// </li>
  /// <li>
  /// <code>CreationFailed</code> - The scaling plan could not be created.
  /// </li>
  /// <li>
  /// <code>DeletionInProgress</code> - The scaling plan is being deleted.
  /// </li>
  /// <li>
  /// <code>DeletionFailed</code> - The scaling plan could not be deleted.
  /// </li>
  /// <li>
  /// <code>UpdateInProgress</code> - The scaling plan is being updated.
  /// </li>
  /// <li>
  /// <code>UpdateFailed</code> - The scaling plan could not be updated.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusCode')
  final ScalingPlanStatusCode statusCode;

  /// The Unix time stamp when the scaling plan was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A simple message about the current status of the scaling plan.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The Unix time stamp when the scaling plan entered the current status.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StatusStartTime')
  final DateTime statusStartTime;

  ScalingPlan({
    @_s.required this.applicationSource,
    @_s.required this.scalingInstructions,
    @_s.required this.scalingPlanName,
    @_s.required this.scalingPlanVersion,
    @_s.required this.statusCode,
    this.creationTime,
    this.statusMessage,
    this.statusStartTime,
  });
  factory ScalingPlan.fromJson(Map<String, dynamic> json) =>
      _$ScalingPlanFromJson(json);
}

/// Represents a scalable resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingPlanResource {
  /// The ID of the resource. This string consists of the resource type and unique
  /// identifier.
  ///
  /// <ul>
  /// <li>
  /// Auto Scaling group - The resource type is <code>autoScalingGroup</code> and
  /// the unique identifier is the name of the Auto Scaling group. Example:
  /// <code>autoScalingGroup/my-asg</code>.
  /// </li>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the resource ID. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The scalable dimension for the resource.
  ///
  /// <ul>
  /// <li>
  /// <code>autoscaling:autoScalingGroup:DesiredCapacity</code> - The desired
  /// capacity of an Auto Scaling group.
  /// </li>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The name of the scaling plan.
  @_s.JsonKey(name: 'ScalingPlanName')
  final String scalingPlanName;

  /// The version number of the scaling plan.
  @_s.JsonKey(name: 'ScalingPlanVersion')
  final int scalingPlanVersion;

  /// The scaling status of the resource.
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code> - The scaling configuration is active.
  /// </li>
  /// <li>
  /// <code>Inactive</code> - The scaling configuration is not active because the
  /// scaling plan is being created or the scaling configuration could not be
  /// applied. Check the status message for more information.
  /// </li>
  /// <li>
  /// <code>PartiallyActive</code> - The scaling configuration is partially active
  /// because the scaling plan is being created or deleted or the scaling
  /// configuration could not be fully applied. Check the status message for more
  /// information.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalingStatusCode')
  final ScalingStatusCode scalingStatusCode;

  /// The namespace of the AWS service.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;

  /// The scaling policies.
  @_s.JsonKey(name: 'ScalingPolicies')
  final List<ScalingPolicy> scalingPolicies;

  /// A simple message about the current scaling status of the resource.
  @_s.JsonKey(name: 'ScalingStatusMessage')
  final String scalingStatusMessage;

  ScalingPlanResource({
    @_s.required this.resourceId,
    @_s.required this.scalableDimension,
    @_s.required this.scalingPlanName,
    @_s.required this.scalingPlanVersion,
    @_s.required this.scalingStatusCode,
    @_s.required this.serviceNamespace,
    this.scalingPolicies,
    this.scalingStatusMessage,
  });
  factory ScalingPlanResource.fromJson(Map<String, dynamic> json) =>
      _$ScalingPlanResourceFromJson(json);
}

enum ScalingPlanStatusCode {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('ActiveWithProblems')
  activeWithProblems,
  @_s.JsonValue('CreationInProgress')
  creationInProgress,
  @_s.JsonValue('CreationFailed')
  creationFailed,
  @_s.JsonValue('DeletionInProgress')
  deletionInProgress,
  @_s.JsonValue('DeletionFailed')
  deletionFailed,
  @_s.JsonValue('UpdateInProgress')
  updateInProgress,
  @_s.JsonValue('UpdateFailed')
  updateFailed,
}

/// Represents a scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingPolicy {
  /// The name of the scaling policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// The type of scaling policy.
  @_s.JsonKey(name: 'PolicyType')
  final PolicyType policyType;

  /// The target tracking scaling policy. Includes support for predefined or
  /// customized metrics.
  @_s.JsonKey(name: 'TargetTrackingConfiguration')
  final TargetTrackingConfiguration targetTrackingConfiguration;

  ScalingPolicy({
    @_s.required this.policyName,
    @_s.required this.policyType,
    this.targetTrackingConfiguration,
  });
  factory ScalingPolicy.fromJson(Map<String, dynamic> json) =>
      _$ScalingPolicyFromJson(json);
}

enum ScalingPolicyUpdateBehavior {
  @_s.JsonValue('KeepExternalPolicies')
  keepExternalPolicies,
  @_s.JsonValue('ReplaceExternalPolicies')
  replaceExternalPolicies,
}

enum ScalingStatusCode {
  @_s.JsonValue('Inactive')
  inactive,
  @_s.JsonValue('PartiallyActive')
  partiallyActive,
  @_s.JsonValue('Active')
  active,
}

enum ServiceNamespace {
  @_s.JsonValue('autoscaling')
  autoscaling,
  @_s.JsonValue('ecs')
  ecs,
  @_s.JsonValue('ec2')
  ec2,
  @_s.JsonValue('rds')
  rds,
  @_s.JsonValue('dynamodb')
  dynamodb,
}

extension on ServiceNamespace {
  String toValue() {
    switch (this) {
      case ServiceNamespace.autoscaling:
        return 'autoscaling';
      case ServiceNamespace.ecs:
        return 'ecs';
      case ServiceNamespace.ec2:
        return 'ec2';
      case ServiceNamespace.rds:
        return 'rds';
      case ServiceNamespace.dynamodb:
        return 'dynamodb';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagFilter {
  /// The tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag values (0 to 20).
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  TagFilter({
    this.key,
    this.values,
  });
  factory TagFilter.fromJson(Map<String, dynamic> json) =>
      _$TagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$TagFilterToJson(this);
}

/// Describes a target tracking configuration to use with AWS Auto Scaling. Used
/// with <a>ScalingInstruction</a> and <a>ScalingPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetTrackingConfiguration {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'CustomizedScalingMetricSpecification')
  final CustomizedScalingMetricSpecification
      customizedScalingMetricSpecification;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is <code>true</code>, scale in is disabled and the
  /// target tracking scaling policy doesn't remove capacity from the scalable
  /// resource. Otherwise, scale in is enabled and the target tracking scaling
  /// policy can remove capacity from the scalable resource.
  ///
  /// The default value is <code>false</code>.
  @_s.JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics. This value is used only if the
  /// resource is an Auto Scaling group.
  @_s.JsonKey(name: 'EstimatedInstanceWarmup')
  final int estimatedInstanceWarmup;

  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'PredefinedScalingMetricSpecification')
  final PredefinedScalingMetricSpecification
      predefinedScalingMetricSpecification;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. This value is not used if the scalable
  /// resource is an Auto Scaling group.
  ///
  /// The cooldown period is used to block subsequent scale in requests until it
  /// has expired. The intention is to scale in conservatively to protect your
  /// application's availability. However, if another alarm triggers a scale-out
  /// policy during the cooldown period after a scale-in, AWS Auto Scaling scales
  /// out your scalable target immediately.
  @_s.JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale-out activity completes before
  /// another scale-out activity can start. This value is not used if the scalable
  /// resource is an Auto Scaling group.
  ///
  /// While the cooldown period is in effect, the capacity that has been added by
  /// the previous scale-out event that initiated the cooldown is calculated as
  /// part of the desired capacity for the next scale out. The intention is to
  /// continuously (but not excessively) scale out.
  @_s.JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  TargetTrackingConfiguration({
    @_s.required this.targetValue,
    this.customizedScalingMetricSpecification,
    this.disableScaleIn,
    this.estimatedInstanceWarmup,
    this.predefinedScalingMetricSpecification,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });
  factory TargetTrackingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TargetTrackingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$TargetTrackingConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateScalingPlanResponse {
  UpdateScalingPlanResponse();
  factory UpdateScalingPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateScalingPlanResponseFromJson(json);
}

class ConcurrentUpdateException extends _s.GenericAwsException {
  ConcurrentUpdateException({String type, String message})
      : super(type: type, code: 'ConcurrentUpdateException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String type, String message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentUpdateException': (type, message) =>
      ConcurrentUpdateException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ObjectNotFoundException': (type, message) =>
      ObjectNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
