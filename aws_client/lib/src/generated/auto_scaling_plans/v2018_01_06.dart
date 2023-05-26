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

/// Use AWS Auto Scaling to create scaling plans for your applications to
/// automatically scale your scalable AWS resources.
class AutoScalingPlans {
  final _s.JsonProtocol _protocol;
  AutoScalingPlans({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'autoscaling-plans',
            signingName: 'autoscaling-plans',
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
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ApplicationSource.html">ApplicationSource</a>
  /// in the <i>AWS Auto Scaling API Reference</i>.
  ///
  /// Parameter [scalingInstructions] :
  /// The scaling instructions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ScalingInstruction.html">ScalingInstruction</a>
  /// in the <i>AWS Auto Scaling API Reference</i>.
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan. Names cannot contain vertical bars, colons,
  /// or forward slashes.
  Future<CreateScalingPlanResponse> createScalingPlan({
    required ApplicationSource applicationSource,
    required List<ScalingInstruction> scalingInstructions,
    required String scalingPlanName,
  }) async {
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
  /// The version number of the scaling plan. Currently, the only valid value is
  /// <code>1</code>.
  Future<void> deleteScalingPlan({
    required String scalingPlanName,
    required int scalingPlanVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleScalingPlannerFrontendService.DeleteScalingPlan'
    };
    await _protocol.send(
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
  /// The version number of the scaling plan. Currently, the only valid value is
  /// <code>1</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable resources to return. The value must be
  /// between 1 and 50. The default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<DescribeScalingPlanResourcesResponse> describeScalingPlanResources({
    required String scalingPlanName,
    required int scalingPlanVersion,
    int? maxResults,
    String? nextToken,
  }) async {
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
  /// The version number of the scaling plan. Currently, the only valid value is
  /// <code>1</code>.
  /// <note>
  /// If you specify a scaling plan version, you must also specify a scaling
  /// plan name.
  /// </note>
  Future<DescribeScalingPlansResponse> describeScalingPlans({
    List<ApplicationSource>? applicationSources,
    int? maxResults,
    String? nextToken,
    List<String>? scalingPlanNames,
    int? scalingPlanVersion,
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
  /// The ID of the resource. This string consists of a prefix
  /// (<code>autoScalingGroup</code>) followed by the name of a specified Auto
  /// Scaling group (<code>my-asg</code>). Example:
  /// <code>autoScalingGroup/my-asg</code>.
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension for the resource. The only valid value is
  /// <code>autoscaling:autoScalingGroup:DesiredCapacity</code>.
  ///
  /// Parameter [scalingPlanName] :
  /// The name of the scaling plan.
  ///
  /// Parameter [scalingPlanVersion] :
  /// The version number of the scaling plan. Currently, the only valid value is
  /// <code>1</code>.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service. The only valid value is
  /// <code>autoscaling</code>.
  ///
  /// Parameter [startTime] :
  /// The inclusive start time of the time range for the forecast data to get.
  /// The date and time can be at most 56 days before the current date and time.
  Future<GetScalingPlanResourceForecastDataResponse>
      getScalingPlanResourceForecastData({
    required DateTime endTime,
    required ForecastDataType forecastDataType,
    required String resourceId,
    required ScalableDimension scalableDimension,
    required String scalingPlanName,
    required int scalingPlanVersion,
    required ServiceNamespace serviceNamespace,
    required DateTime startTime,
  }) async {
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
        'ForecastDataType': forecastDataType.toValue(),
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ScalingPlanName': scalingPlanName,
        'ScalingPlanVersion': scalingPlanVersion,
        'ServiceNamespace': serviceNamespace.toValue(),
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
  /// The version number of the scaling plan. The only valid value is
  /// <code>1</code>. Currently, you cannot have multiple scaling plan versions.
  ///
  /// Parameter [applicationSource] :
  /// A CloudFormation stack or set of tags.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ApplicationSource.html">ApplicationSource</a>
  /// in the <i>AWS Auto Scaling API Reference</i>.
  ///
  /// Parameter [scalingInstructions] :
  /// The scaling instructions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ScalingInstruction.html">ScalingInstruction</a>
  /// in the <i>AWS Auto Scaling API Reference</i>.
  Future<void> updateScalingPlan({
    required String scalingPlanName,
    required int scalingPlanVersion,
    ApplicationSource? applicationSource,
    List<ScalingInstruction>? scalingInstructions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleScalingPlannerFrontendService.UpdateScalingPlan'
    };
    await _protocol.send(
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
  }
}

/// Represents an application source.
class ApplicationSource {
  /// The Amazon Resource Name (ARN) of a AWS CloudFormation stack.
  final String? cloudFormationStackARN;

  /// A set of tags (up to 50).
  final List<TagFilter>? tagFilters;

  ApplicationSource({
    this.cloudFormationStackARN,
    this.tagFilters,
  });

  factory ApplicationSource.fromJson(Map<String, dynamic> json) {
    return ApplicationSource(
      cloudFormationStackARN: json['CloudFormationStackARN'] as String?,
      tagFilters: (json['TagFilters'] as List?)
          ?.whereNotNull()
          .map((e) => TagFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormationStackARN = this.cloudFormationStackARN;
    final tagFilters = this.tagFilters;
    return {
      if (cloudFormationStackARN != null)
        'CloudFormationStackARN': cloudFormationStackARN,
      if (tagFilters != null) 'TagFilters': tagFilters,
    };
  }
}

class CreateScalingPlanResponse {
  /// The version number of the scaling plan. This value is always <code>1</code>.
  /// Currently, you cannot have multiple scaling plan versions.
  final int scalingPlanVersion;

  CreateScalingPlanResponse({
    required this.scalingPlanVersion,
  });

  factory CreateScalingPlanResponse.fromJson(Map<String, dynamic> json) {
    return CreateScalingPlanResponse(
      scalingPlanVersion: json['ScalingPlanVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final scalingPlanVersion = this.scalingPlanVersion;
    return {
      'ScalingPlanVersion': scalingPlanVersion,
    };
  }
}

/// Represents a CloudWatch metric of your choosing that can be used for
/// predictive scaling.
///
/// For predictive scaling to work with a customized load metric specification,
/// AWS Auto Scaling needs access to the <code>Sum</code> and
/// <code>Average</code> statistics that CloudWatch computes from metric data.
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
/// If you publish your own metrics, you can aggregate the data points at a
/// given interval and then publish the aggregated data points to CloudWatch.
/// Before AWS Auto Scaling generates the forecast, it sums up all the metric
/// data points that occurred within each hour to match the granularity period
/// that is used in the forecast (60 minutes).
///
/// For information about terminology, available metrics, or how to publish new
/// metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a> in the <i>Amazon CloudWatch User Guide</i>.
///
/// After creating your scaling plan, you can use the AWS Auto Scaling console
/// to visualize forecasts for the specified metric. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-create-scaling-plan.html#gs-view-resource">View
/// Scaling Information for a Resource</a> in the <i>AWS Auto Scaling User
/// Guide</i>.
class CustomizedLoadMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The statistic of the metric. The only valid value is <code>Sum</code>.
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your customized load metric specification.
  final List<MetricDimension>? dimensions;

  /// The unit of the metric.
  final String? unit;

  CustomizedLoadMetricSpecification({
    required this.metricName,
    required this.namespace,
    required this.statistic,
    this.dimensions,
    this.unit,
  });

  factory CustomizedLoadMetricSpecification.fromJson(
      Map<String, dynamic> json) {
    return CustomizedLoadMetricSpecification(
      metricName: json['MetricName'] as String,
      namespace: json['Namespace'] as String,
      statistic: (json['Statistic'] as String).toMetricStatistic(),
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final namespace = this.namespace;
    final statistic = this.statistic;
    final dimensions = this.dimensions;
    final unit = this.unit;
    return {
      'MetricName': metricName,
      'Namespace': namespace,
      'Statistic': statistic.toValue(),
      if (dimensions != null) 'Dimensions': dimensions,
      if (unit != null) 'Unit': unit,
    };
  }
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
/// For information about terminology, available metrics, or how to publish new
/// metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a> in the <i>Amazon CloudWatch User Guide</i>.
class CustomizedScalingMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The statistic of the metric.
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your customized scaling metric specification.
  final List<MetricDimension>? dimensions;

  /// The unit of the metric.
  final String? unit;

  CustomizedScalingMetricSpecification({
    required this.metricName,
    required this.namespace,
    required this.statistic,
    this.dimensions,
    this.unit,
  });

  factory CustomizedScalingMetricSpecification.fromJson(
      Map<String, dynamic> json) {
    return CustomizedScalingMetricSpecification(
      metricName: json['MetricName'] as String,
      namespace: json['Namespace'] as String,
      statistic: (json['Statistic'] as String).toMetricStatistic(),
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final namespace = this.namespace;
    final statistic = this.statistic;
    final dimensions = this.dimensions;
    final unit = this.unit;
    return {
      'MetricName': metricName,
      'Namespace': namespace,
      'Statistic': statistic.toValue(),
      if (dimensions != null) 'Dimensions': dimensions,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Represents a single value in the forecast data used for predictive scaling.
class Datapoint {
  /// The time stamp for the data point in UTC format.
  final DateTime? timestamp;

  /// The value of the data point.
  final double? value;

  Datapoint({
    this.timestamp,
    this.value,
  });

  factory Datapoint.fromJson(Map<String, dynamic> json) {
    return Datapoint(
      timestamp: timeStampFromJson(json['Timestamp']),
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (value != null) 'Value': value,
    };
  }
}

class DeleteScalingPlanResponse {
  DeleteScalingPlanResponse();

  factory DeleteScalingPlanResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScalingPlanResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeScalingPlanResourcesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// Information about the scalable resources.
  final List<ScalingPlanResource>? scalingPlanResources;

  DescribeScalingPlanResourcesResponse({
    this.nextToken,
    this.scalingPlanResources,
  });

  factory DescribeScalingPlanResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeScalingPlanResourcesResponse(
      nextToken: json['NextToken'] as String?,
      scalingPlanResources: (json['ScalingPlanResources'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingPlanResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingPlanResources = this.scalingPlanResources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalingPlanResources != null)
        'ScalingPlanResources': scalingPlanResources,
    };
  }
}

class DescribeScalingPlansResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// Information about the scaling plans.
  final List<ScalingPlan>? scalingPlans;

  DescribeScalingPlansResponse({
    this.nextToken,
    this.scalingPlans,
  });

  factory DescribeScalingPlansResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScalingPlansResponse(
      nextToken: json['NextToken'] as String?,
      scalingPlans: (json['ScalingPlans'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingPlans = this.scalingPlans;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalingPlans != null) 'ScalingPlans': scalingPlans,
    };
  }
}

enum ForecastDataType {
  capacityForecast,
  loadForecast,
  scheduledActionMinCapacity,
  scheduledActionMaxCapacity,
}

extension ForecastDataTypeValueExtension on ForecastDataType {
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
  }
}

extension ForecastDataTypeFromString on String {
  ForecastDataType toForecastDataType() {
    switch (this) {
      case 'CapacityForecast':
        return ForecastDataType.capacityForecast;
      case 'LoadForecast':
        return ForecastDataType.loadForecast;
      case 'ScheduledActionMinCapacity':
        return ForecastDataType.scheduledActionMinCapacity;
      case 'ScheduledActionMaxCapacity':
        return ForecastDataType.scheduledActionMaxCapacity;
    }
    throw Exception('$this is not known in enum ForecastDataType');
  }
}

class GetScalingPlanResourceForecastDataResponse {
  /// The data points to return.
  final List<Datapoint> datapoints;

  GetScalingPlanResourceForecastDataResponse({
    required this.datapoints,
  });

  factory GetScalingPlanResourceForecastDataResponse.fromJson(
      Map<String, dynamic> json) {
    return GetScalingPlanResourceForecastDataResponse(
      datapoints: (json['Datapoints'] as List)
          .whereNotNull()
          .map((e) => Datapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final datapoints = this.datapoints;
    return {
      'Datapoints': datapoints,
    };
  }
}

enum LoadMetricType {
  aSGTotalCPUUtilization,
  aSGTotalNetworkIn,
  aSGTotalNetworkOut,
  aLBTargetGroupRequestCount,
}

extension LoadMetricTypeValueExtension on LoadMetricType {
  String toValue() {
    switch (this) {
      case LoadMetricType.aSGTotalCPUUtilization:
        return 'ASGTotalCPUUtilization';
      case LoadMetricType.aSGTotalNetworkIn:
        return 'ASGTotalNetworkIn';
      case LoadMetricType.aSGTotalNetworkOut:
        return 'ASGTotalNetworkOut';
      case LoadMetricType.aLBTargetGroupRequestCount:
        return 'ALBTargetGroupRequestCount';
    }
  }
}

extension LoadMetricTypeFromString on String {
  LoadMetricType toLoadMetricType() {
    switch (this) {
      case 'ASGTotalCPUUtilization':
        return LoadMetricType.aSGTotalCPUUtilization;
      case 'ASGTotalNetworkIn':
        return LoadMetricType.aSGTotalNetworkIn;
      case 'ASGTotalNetworkOut':
        return LoadMetricType.aSGTotalNetworkOut;
      case 'ALBTargetGroupRequestCount':
        return LoadMetricType.aLBTargetGroupRequestCount;
    }
    throw Exception('$this is not known in enum LoadMetricType');
  }
}

/// Represents a dimension for a customized metric.
class MetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  MetricDimension({
    required this.name,
    required this.value,
  });

  factory MetricDimension.fromJson(Map<String, dynamic> json) {
    return MetricDimension(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

enum MetricStatistic {
  average,
  minimum,
  maximum,
  sampleCount,
  sum,
}

extension MetricStatisticValueExtension on MetricStatistic {
  String toValue() {
    switch (this) {
      case MetricStatistic.average:
        return 'Average';
      case MetricStatistic.minimum:
        return 'Minimum';
      case MetricStatistic.maximum:
        return 'Maximum';
      case MetricStatistic.sampleCount:
        return 'SampleCount';
      case MetricStatistic.sum:
        return 'Sum';
    }
  }
}

extension MetricStatisticFromString on String {
  MetricStatistic toMetricStatistic() {
    switch (this) {
      case 'Average':
        return MetricStatistic.average;
      case 'Minimum':
        return MetricStatistic.minimum;
      case 'Maximum':
        return MetricStatistic.maximum;
      case 'SampleCount':
        return MetricStatistic.sampleCount;
      case 'Sum':
        return MetricStatistic.sum;
    }
    throw Exception('$this is not known in enum MetricStatistic');
  }
}

enum PolicyType {
  targetTrackingScaling,
}

extension PolicyTypeValueExtension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.targetTrackingScaling:
        return 'TargetTrackingScaling';
    }
  }
}

extension PolicyTypeFromString on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'TargetTrackingScaling':
        return PolicyType.targetTrackingScaling;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

/// Represents a predefined metric that can be used for predictive scaling.
///
/// After creating your scaling plan, you can use the AWS Auto Scaling console
/// to visualize forecasts for the specified metric. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-create-scaling-plan.html#gs-view-resource">View
/// Scaling Information for a Resource</a> in the <i>AWS Auto Scaling User
/// Guide</i>.
class PredefinedLoadMetricSpecification {
  /// The metric type.
  final LoadMetricType predefinedLoadMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBTargetGroupRequestCount</code> and there is a target group for an
  /// Application Load Balancer attached to the Auto Scaling group.
  ///
  /// You create the resource label by appending the final portion of the load
  /// balancer ARN and the final portion of the target group ARN into a single
  /// value, separated by a forward slash (/). The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  /// This is an example:
  /// app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.
  ///
  /// To find the ARN for an Application Load Balancer, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// API operation. To find the ARN for the target group, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a>
  /// API operation.
  final String? resourceLabel;

  PredefinedLoadMetricSpecification({
    required this.predefinedLoadMetricType,
    this.resourceLabel,
  });

  factory PredefinedLoadMetricSpecification.fromJson(
      Map<String, dynamic> json) {
    return PredefinedLoadMetricSpecification(
      predefinedLoadMetricType:
          (json['PredefinedLoadMetricType'] as String).toLoadMetricType(),
      resourceLabel: json['ResourceLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predefinedLoadMetricType = this.predefinedLoadMetricType;
    final resourceLabel = this.resourceLabel;
    return {
      'PredefinedLoadMetricType': predefinedLoadMetricType.toValue(),
      if (resourceLabel != null) 'ResourceLabel': resourceLabel,
    };
  }
}

/// Represents a predefined metric that can be used for dynamic scaling as part
/// of a target tracking scaling policy.
class PredefinedScalingMetricSpecification {
  /// The metric type. The <code>ALBRequestCountPerTarget</code> metric type
  /// applies only to Auto Scaling groups, Spot Fleet requests, and ECS services.
  final ScalingMetricType predefinedScalingMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group for an
  /// Application Load Balancer attached to the Auto Scaling group, Spot Fleet
  /// request, or ECS service.
  ///
  /// You create the resource label by appending the final portion of the load
  /// balancer ARN and the final portion of the target group ARN into a single
  /// value, separated by a forward slash (/). The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  /// This is an example:
  /// app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.
  ///
  /// To find the ARN for an Application Load Balancer, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// API operation. To find the ARN for the target group, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a>
  /// API operation.
  final String? resourceLabel;

  PredefinedScalingMetricSpecification({
    required this.predefinedScalingMetricType,
    this.resourceLabel,
  });

  factory PredefinedScalingMetricSpecification.fromJson(
      Map<String, dynamic> json) {
    return PredefinedScalingMetricSpecification(
      predefinedScalingMetricType:
          (json['PredefinedScalingMetricType'] as String).toScalingMetricType(),
      resourceLabel: json['ResourceLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predefinedScalingMetricType = this.predefinedScalingMetricType;
    final resourceLabel = this.resourceLabel;
    return {
      'PredefinedScalingMetricType': predefinedScalingMetricType.toValue(),
      if (resourceLabel != null) 'ResourceLabel': resourceLabel,
    };
  }
}

enum PredictiveScalingMaxCapacityBehavior {
  setForecastCapacityToMaxCapacity,
  setMaxCapacityToForecastCapacity,
  setMaxCapacityAboveForecastCapacity,
}

extension PredictiveScalingMaxCapacityBehaviorValueExtension
    on PredictiveScalingMaxCapacityBehavior {
  String toValue() {
    switch (this) {
      case PredictiveScalingMaxCapacityBehavior
            .setForecastCapacityToMaxCapacity:
        return 'SetForecastCapacityToMaxCapacity';
      case PredictiveScalingMaxCapacityBehavior
            .setMaxCapacityToForecastCapacity:
        return 'SetMaxCapacityToForecastCapacity';
      case PredictiveScalingMaxCapacityBehavior
            .setMaxCapacityAboveForecastCapacity:
        return 'SetMaxCapacityAboveForecastCapacity';
    }
  }
}

extension PredictiveScalingMaxCapacityBehaviorFromString on String {
  PredictiveScalingMaxCapacityBehavior
      toPredictiveScalingMaxCapacityBehavior() {
    switch (this) {
      case 'SetForecastCapacityToMaxCapacity':
        return PredictiveScalingMaxCapacityBehavior
            .setForecastCapacityToMaxCapacity;
      case 'SetMaxCapacityToForecastCapacity':
        return PredictiveScalingMaxCapacityBehavior
            .setMaxCapacityToForecastCapacity;
      case 'SetMaxCapacityAboveForecastCapacity':
        return PredictiveScalingMaxCapacityBehavior
            .setMaxCapacityAboveForecastCapacity;
    }
    throw Exception(
        '$this is not known in enum PredictiveScalingMaxCapacityBehavior');
  }
}

enum PredictiveScalingMode {
  forecastAndScale,
  forecastOnly,
}

extension PredictiveScalingModeValueExtension on PredictiveScalingMode {
  String toValue() {
    switch (this) {
      case PredictiveScalingMode.forecastAndScale:
        return 'ForecastAndScale';
      case PredictiveScalingMode.forecastOnly:
        return 'ForecastOnly';
    }
  }
}

extension PredictiveScalingModeFromString on String {
  PredictiveScalingMode toPredictiveScalingMode() {
    switch (this) {
      case 'ForecastAndScale':
        return PredictiveScalingMode.forecastAndScale;
      case 'ForecastOnly':
        return PredictiveScalingMode.forecastOnly;
    }
    throw Exception('$this is not known in enum PredictiveScalingMode');
  }
}

enum ScalableDimension {
  autoscalingAutoScalingGroupDesiredCapacity,
  ecsServiceDesiredCount,
  ec2SpotFleetRequestTargetCapacity,
  rdsClusterReadReplicaCount,
  dynamodbTableReadCapacityUnits,
  dynamodbTableWriteCapacityUnits,
  dynamodbIndexReadCapacityUnits,
  dynamodbIndexWriteCapacityUnits,
}

extension ScalableDimensionValueExtension on ScalableDimension {
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
  }
}

extension ScalableDimensionFromString on String {
  ScalableDimension toScalableDimension() {
    switch (this) {
      case 'autoscaling:autoScalingGroup:DesiredCapacity':
        return ScalableDimension.autoscalingAutoScalingGroupDesiredCapacity;
      case 'ecs:service:DesiredCount':
        return ScalableDimension.ecsServiceDesiredCount;
      case 'ec2:spot-fleet-request:TargetCapacity':
        return ScalableDimension.ec2SpotFleetRequestTargetCapacity;
      case 'rds:cluster:ReadReplicaCount':
        return ScalableDimension.rdsClusterReadReplicaCount;
      case 'dynamodb:table:ReadCapacityUnits':
        return ScalableDimension.dynamodbTableReadCapacityUnits;
      case 'dynamodb:table:WriteCapacityUnits':
        return ScalableDimension.dynamodbTableWriteCapacityUnits;
      case 'dynamodb:index:ReadCapacityUnits':
        return ScalableDimension.dynamodbIndexReadCapacityUnits;
      case 'dynamodb:index:WriteCapacityUnits':
        return ScalableDimension.dynamodbIndexWriteCapacityUnits;
    }
    throw Exception('$this is not known in enum ScalableDimension');
  }
}

/// Describes a scaling instruction for a scalable resource in a scaling plan.
/// Each scaling instruction applies to one resource.
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
/// <important>
/// We recommend waiting a minimum of 24 hours after creating an Auto Scaling
/// group to configure predictive scaling. At minimum, there must be 24 hours of
/// historical data to generate a forecast. For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-best-practices.html">Best
/// Practices for AWS Auto Scaling</a> in the <i>AWS Auto Scaling User
/// Guide</i>.
/// </important>
class ScalingInstruction {
  /// The maximum capacity of the resource. The exception to this upper limit is
  /// if you specify a non-default setting for
  /// <b>PredictiveScalingMaxCapacityBehavior</b>.
  final int maxCapacity;

  /// The minimum capacity of the resource.
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
  final ScalableDimension scalableDimension;

  /// The namespace of the AWS service.
  final ServiceNamespace serviceNamespace;

  /// The target tracking configurations (up to 10). Each of these structures must
  /// specify a unique scaling metric and a target value for the metric.
  final List<TargetTrackingConfiguration> targetTrackingConfigurations;

  /// The customized load metric to use for predictive scaling. This parameter or
  /// a <b>PredefinedLoadMetricSpecification</b> is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  final CustomizedLoadMetricSpecification? customizedLoadMetricSpecification;

  /// Controls whether dynamic scaling by AWS Auto Scaling is disabled. When
  /// dynamic scaling is enabled, AWS Auto Scaling creates target tracking scaling
  /// policies based on the specified target tracking configurations.
  ///
  /// The default is enabled (<code>false</code>).
  final bool? disableDynamicScaling;

  /// The predefined load metric to use for predictive scaling. This parameter or
  /// a <b>CustomizedLoadMetricSpecification</b> is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  final PredefinedLoadMetricSpecification? predefinedLoadMetricSpecification;

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
  final PredictiveScalingMaxCapacityBehavior?
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
  final int? predictiveScalingMaxCapacityBuffer;

  /// The predictive scaling mode. The default value is
  /// <code>ForecastAndScale</code>. Otherwise, AWS Auto Scaling forecasts
  /// capacity but does not create any scheduled scaling actions based on the
  /// capacity forecast.
  final PredictiveScalingMode? predictiveScalingMode;

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
  final ScalingPolicyUpdateBehavior? scalingPolicyUpdateBehavior;

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
  final int? scheduledActionBufferTime;

  ScalingInstruction({
    required this.maxCapacity,
    required this.minCapacity,
    required this.resourceId,
    required this.scalableDimension,
    required this.serviceNamespace,
    required this.targetTrackingConfigurations,
    this.customizedLoadMetricSpecification,
    this.disableDynamicScaling,
    this.predefinedLoadMetricSpecification,
    this.predictiveScalingMaxCapacityBehavior,
    this.predictiveScalingMaxCapacityBuffer,
    this.predictiveScalingMode,
    this.scalingPolicyUpdateBehavior,
    this.scheduledActionBufferTime,
  });

  factory ScalingInstruction.fromJson(Map<String, dynamic> json) {
    return ScalingInstruction(
      maxCapacity: json['MaxCapacity'] as int,
      minCapacity: json['MinCapacity'] as int,
      resourceId: json['ResourceId'] as String,
      scalableDimension:
          (json['ScalableDimension'] as String).toScalableDimension(),
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      targetTrackingConfigurations: (json['TargetTrackingConfigurations']
              as List)
          .whereNotNull()
          .map((e) =>
              TargetTrackingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      customizedLoadMetricSpecification:
          json['CustomizedLoadMetricSpecification'] != null
              ? CustomizedLoadMetricSpecification.fromJson(
                  json['CustomizedLoadMetricSpecification']
                      as Map<String, dynamic>)
              : null,
      disableDynamicScaling: json['DisableDynamicScaling'] as bool?,
      predefinedLoadMetricSpecification:
          json['PredefinedLoadMetricSpecification'] != null
              ? PredefinedLoadMetricSpecification.fromJson(
                  json['PredefinedLoadMetricSpecification']
                      as Map<String, dynamic>)
              : null,
      predictiveScalingMaxCapacityBehavior:
          (json['PredictiveScalingMaxCapacityBehavior'] as String?)
              ?.toPredictiveScalingMaxCapacityBehavior(),
      predictiveScalingMaxCapacityBuffer:
          json['PredictiveScalingMaxCapacityBuffer'] as int?,
      predictiveScalingMode:
          (json['PredictiveScalingMode'] as String?)?.toPredictiveScalingMode(),
      scalingPolicyUpdateBehavior:
          (json['ScalingPolicyUpdateBehavior'] as String?)
              ?.toScalingPolicyUpdateBehavior(),
      scheduledActionBufferTime: json['ScheduledActionBufferTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    final resourceId = this.resourceId;
    final scalableDimension = this.scalableDimension;
    final serviceNamespace = this.serviceNamespace;
    final targetTrackingConfigurations = this.targetTrackingConfigurations;
    final customizedLoadMetricSpecification =
        this.customizedLoadMetricSpecification;
    final disableDynamicScaling = this.disableDynamicScaling;
    final predefinedLoadMetricSpecification =
        this.predefinedLoadMetricSpecification;
    final predictiveScalingMaxCapacityBehavior =
        this.predictiveScalingMaxCapacityBehavior;
    final predictiveScalingMaxCapacityBuffer =
        this.predictiveScalingMaxCapacityBuffer;
    final predictiveScalingMode = this.predictiveScalingMode;
    final scalingPolicyUpdateBehavior = this.scalingPolicyUpdateBehavior;
    final scheduledActionBufferTime = this.scheduledActionBufferTime;
    return {
      'MaxCapacity': maxCapacity,
      'MinCapacity': minCapacity,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension.toValue(),
      'ServiceNamespace': serviceNamespace.toValue(),
      'TargetTrackingConfigurations': targetTrackingConfigurations,
      if (customizedLoadMetricSpecification != null)
        'CustomizedLoadMetricSpecification': customizedLoadMetricSpecification,
      if (disableDynamicScaling != null)
        'DisableDynamicScaling': disableDynamicScaling,
      if (predefinedLoadMetricSpecification != null)
        'PredefinedLoadMetricSpecification': predefinedLoadMetricSpecification,
      if (predictiveScalingMaxCapacityBehavior != null)
        'PredictiveScalingMaxCapacityBehavior':
            predictiveScalingMaxCapacityBehavior.toValue(),
      if (predictiveScalingMaxCapacityBuffer != null)
        'PredictiveScalingMaxCapacityBuffer':
            predictiveScalingMaxCapacityBuffer,
      if (predictiveScalingMode != null)
        'PredictiveScalingMode': predictiveScalingMode.toValue(),
      if (scalingPolicyUpdateBehavior != null)
        'ScalingPolicyUpdateBehavior': scalingPolicyUpdateBehavior.toValue(),
      if (scheduledActionBufferTime != null)
        'ScheduledActionBufferTime': scheduledActionBufferTime,
    };
  }
}

enum ScalingMetricType {
  aSGAverageCPUUtilization,
  aSGAverageNetworkIn,
  aSGAverageNetworkOut,
  dynamoDBReadCapacityUtilization,
  dynamoDBWriteCapacityUtilization,
  eCSServiceAverageCPUUtilization,
  eCSServiceAverageMemoryUtilization,
  aLBRequestCountPerTarget,
  rDSReaderAverageCPUUtilization,
  rDSReaderAverageDatabaseConnections,
  eC2SpotFleetRequestAverageCPUUtilization,
  eC2SpotFleetRequestAverageNetworkIn,
  eC2SpotFleetRequestAverageNetworkOut,
}

extension ScalingMetricTypeValueExtension on ScalingMetricType {
  String toValue() {
    switch (this) {
      case ScalingMetricType.aSGAverageCPUUtilization:
        return 'ASGAverageCPUUtilization';
      case ScalingMetricType.aSGAverageNetworkIn:
        return 'ASGAverageNetworkIn';
      case ScalingMetricType.aSGAverageNetworkOut:
        return 'ASGAverageNetworkOut';
      case ScalingMetricType.dynamoDBReadCapacityUtilization:
        return 'DynamoDBReadCapacityUtilization';
      case ScalingMetricType.dynamoDBWriteCapacityUtilization:
        return 'DynamoDBWriteCapacityUtilization';
      case ScalingMetricType.eCSServiceAverageCPUUtilization:
        return 'ECSServiceAverageCPUUtilization';
      case ScalingMetricType.eCSServiceAverageMemoryUtilization:
        return 'ECSServiceAverageMemoryUtilization';
      case ScalingMetricType.aLBRequestCountPerTarget:
        return 'ALBRequestCountPerTarget';
      case ScalingMetricType.rDSReaderAverageCPUUtilization:
        return 'RDSReaderAverageCPUUtilization';
      case ScalingMetricType.rDSReaderAverageDatabaseConnections:
        return 'RDSReaderAverageDatabaseConnections';
      case ScalingMetricType.eC2SpotFleetRequestAverageCPUUtilization:
        return 'EC2SpotFleetRequestAverageCPUUtilization';
      case ScalingMetricType.eC2SpotFleetRequestAverageNetworkIn:
        return 'EC2SpotFleetRequestAverageNetworkIn';
      case ScalingMetricType.eC2SpotFleetRequestAverageNetworkOut:
        return 'EC2SpotFleetRequestAverageNetworkOut';
    }
  }
}

extension ScalingMetricTypeFromString on String {
  ScalingMetricType toScalingMetricType() {
    switch (this) {
      case 'ASGAverageCPUUtilization':
        return ScalingMetricType.aSGAverageCPUUtilization;
      case 'ASGAverageNetworkIn':
        return ScalingMetricType.aSGAverageNetworkIn;
      case 'ASGAverageNetworkOut':
        return ScalingMetricType.aSGAverageNetworkOut;
      case 'DynamoDBReadCapacityUtilization':
        return ScalingMetricType.dynamoDBReadCapacityUtilization;
      case 'DynamoDBWriteCapacityUtilization':
        return ScalingMetricType.dynamoDBWriteCapacityUtilization;
      case 'ECSServiceAverageCPUUtilization':
        return ScalingMetricType.eCSServiceAverageCPUUtilization;
      case 'ECSServiceAverageMemoryUtilization':
        return ScalingMetricType.eCSServiceAverageMemoryUtilization;
      case 'ALBRequestCountPerTarget':
        return ScalingMetricType.aLBRequestCountPerTarget;
      case 'RDSReaderAverageCPUUtilization':
        return ScalingMetricType.rDSReaderAverageCPUUtilization;
      case 'RDSReaderAverageDatabaseConnections':
        return ScalingMetricType.rDSReaderAverageDatabaseConnections;
      case 'EC2SpotFleetRequestAverageCPUUtilization':
        return ScalingMetricType.eC2SpotFleetRequestAverageCPUUtilization;
      case 'EC2SpotFleetRequestAverageNetworkIn':
        return ScalingMetricType.eC2SpotFleetRequestAverageNetworkIn;
      case 'EC2SpotFleetRequestAverageNetworkOut':
        return ScalingMetricType.eC2SpotFleetRequestAverageNetworkOut;
    }
    throw Exception('$this is not known in enum ScalingMetricType');
  }
}

/// Represents a scaling plan.
class ScalingPlan {
  /// A CloudFormation stack or a set of tags. You can create one scaling plan per
  /// application source.
  final ApplicationSource applicationSource;

  /// The scaling instructions.
  final List<ScalingInstruction> scalingInstructions;

  /// The name of the scaling plan.
  final String scalingPlanName;

  /// The version number of the scaling plan.
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
  final ScalingPlanStatusCode statusCode;

  /// The Unix time stamp when the scaling plan was created.
  final DateTime? creationTime;

  /// A simple message about the current status of the scaling plan.
  final String? statusMessage;

  /// The Unix time stamp when the scaling plan entered the current status.
  final DateTime? statusStartTime;

  ScalingPlan({
    required this.applicationSource,
    required this.scalingInstructions,
    required this.scalingPlanName,
    required this.scalingPlanVersion,
    required this.statusCode,
    this.creationTime,
    this.statusMessage,
    this.statusStartTime,
  });

  factory ScalingPlan.fromJson(Map<String, dynamic> json) {
    return ScalingPlan(
      applicationSource: ApplicationSource.fromJson(
          json['ApplicationSource'] as Map<String, dynamic>),
      scalingInstructions: (json['ScalingInstructions'] as List)
          .whereNotNull()
          .map((e) => ScalingInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalingPlanName: json['ScalingPlanName'] as String,
      scalingPlanVersion: json['ScalingPlanVersion'] as int,
      statusCode: (json['StatusCode'] as String).toScalingPlanStatusCode(),
      creationTime: timeStampFromJson(json['CreationTime']),
      statusMessage: json['StatusMessage'] as String?,
      statusStartTime: timeStampFromJson(json['StatusStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSource = this.applicationSource;
    final scalingInstructions = this.scalingInstructions;
    final scalingPlanName = this.scalingPlanName;
    final scalingPlanVersion = this.scalingPlanVersion;
    final statusCode = this.statusCode;
    final creationTime = this.creationTime;
    final statusMessage = this.statusMessage;
    final statusStartTime = this.statusStartTime;
    return {
      'ApplicationSource': applicationSource,
      'ScalingInstructions': scalingInstructions,
      'ScalingPlanName': scalingPlanName,
      'ScalingPlanVersion': scalingPlanVersion,
      'StatusCode': statusCode.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (statusStartTime != null)
        'StatusStartTime': unixTimestampToJson(statusStartTime),
    };
  }
}

/// Represents a scalable resource.
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
  final ScalableDimension scalableDimension;

  /// The name of the scaling plan.
  final String scalingPlanName;

  /// The version number of the scaling plan.
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
  final ScalingStatusCode scalingStatusCode;

  /// The namespace of the AWS service.
  final ServiceNamespace serviceNamespace;

  /// The scaling policies.
  final List<ScalingPolicy>? scalingPolicies;

  /// A simple message about the current scaling status of the resource.
  final String? scalingStatusMessage;

  ScalingPlanResource({
    required this.resourceId,
    required this.scalableDimension,
    required this.scalingPlanName,
    required this.scalingPlanVersion,
    required this.scalingStatusCode,
    required this.serviceNamespace,
    this.scalingPolicies,
    this.scalingStatusMessage,
  });

  factory ScalingPlanResource.fromJson(Map<String, dynamic> json) {
    return ScalingPlanResource(
      resourceId: json['ResourceId'] as String,
      scalableDimension:
          (json['ScalableDimension'] as String).toScalableDimension(),
      scalingPlanName: json['ScalingPlanName'] as String,
      scalingPlanVersion: json['ScalingPlanVersion'] as int,
      scalingStatusCode:
          (json['ScalingStatusCode'] as String).toScalingStatusCode(),
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      scalingPolicies: (json['ScalingPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalingStatusMessage: json['ScalingStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final scalableDimension = this.scalableDimension;
    final scalingPlanName = this.scalingPlanName;
    final scalingPlanVersion = this.scalingPlanVersion;
    final scalingStatusCode = this.scalingStatusCode;
    final serviceNamespace = this.serviceNamespace;
    final scalingPolicies = this.scalingPolicies;
    final scalingStatusMessage = this.scalingStatusMessage;
    return {
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension.toValue(),
      'ScalingPlanName': scalingPlanName,
      'ScalingPlanVersion': scalingPlanVersion,
      'ScalingStatusCode': scalingStatusCode.toValue(),
      'ServiceNamespace': serviceNamespace.toValue(),
      if (scalingPolicies != null) 'ScalingPolicies': scalingPolicies,
      if (scalingStatusMessage != null)
        'ScalingStatusMessage': scalingStatusMessage,
    };
  }
}

enum ScalingPlanStatusCode {
  active,
  activeWithProblems,
  creationInProgress,
  creationFailed,
  deletionInProgress,
  deletionFailed,
  updateInProgress,
  updateFailed,
}

extension ScalingPlanStatusCodeValueExtension on ScalingPlanStatusCode {
  String toValue() {
    switch (this) {
      case ScalingPlanStatusCode.active:
        return 'Active';
      case ScalingPlanStatusCode.activeWithProblems:
        return 'ActiveWithProblems';
      case ScalingPlanStatusCode.creationInProgress:
        return 'CreationInProgress';
      case ScalingPlanStatusCode.creationFailed:
        return 'CreationFailed';
      case ScalingPlanStatusCode.deletionInProgress:
        return 'DeletionInProgress';
      case ScalingPlanStatusCode.deletionFailed:
        return 'DeletionFailed';
      case ScalingPlanStatusCode.updateInProgress:
        return 'UpdateInProgress';
      case ScalingPlanStatusCode.updateFailed:
        return 'UpdateFailed';
    }
  }
}

extension ScalingPlanStatusCodeFromString on String {
  ScalingPlanStatusCode toScalingPlanStatusCode() {
    switch (this) {
      case 'Active':
        return ScalingPlanStatusCode.active;
      case 'ActiveWithProblems':
        return ScalingPlanStatusCode.activeWithProblems;
      case 'CreationInProgress':
        return ScalingPlanStatusCode.creationInProgress;
      case 'CreationFailed':
        return ScalingPlanStatusCode.creationFailed;
      case 'DeletionInProgress':
        return ScalingPlanStatusCode.deletionInProgress;
      case 'DeletionFailed':
        return ScalingPlanStatusCode.deletionFailed;
      case 'UpdateInProgress':
        return ScalingPlanStatusCode.updateInProgress;
      case 'UpdateFailed':
        return ScalingPlanStatusCode.updateFailed;
    }
    throw Exception('$this is not known in enum ScalingPlanStatusCode');
  }
}

/// Represents a scaling policy.
class ScalingPolicy {
  /// The name of the scaling policy.
  final String policyName;

  /// The type of scaling policy.
  final PolicyType policyType;

  /// The target tracking scaling policy. Includes support for predefined or
  /// customized metrics.
  final TargetTrackingConfiguration? targetTrackingConfiguration;

  ScalingPolicy({
    required this.policyName,
    required this.policyType,
    this.targetTrackingConfiguration,
  });

  factory ScalingPolicy.fromJson(Map<String, dynamic> json) {
    return ScalingPolicy(
      policyName: json['PolicyName'] as String,
      policyType: (json['PolicyType'] as String).toPolicyType(),
      targetTrackingConfiguration: json['TargetTrackingConfiguration'] != null
          ? TargetTrackingConfiguration.fromJson(
              json['TargetTrackingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final policyType = this.policyType;
    final targetTrackingConfiguration = this.targetTrackingConfiguration;
    return {
      'PolicyName': policyName,
      'PolicyType': policyType.toValue(),
      if (targetTrackingConfiguration != null)
        'TargetTrackingConfiguration': targetTrackingConfiguration,
    };
  }
}

enum ScalingPolicyUpdateBehavior {
  keepExternalPolicies,
  replaceExternalPolicies,
}

extension ScalingPolicyUpdateBehaviorValueExtension
    on ScalingPolicyUpdateBehavior {
  String toValue() {
    switch (this) {
      case ScalingPolicyUpdateBehavior.keepExternalPolicies:
        return 'KeepExternalPolicies';
      case ScalingPolicyUpdateBehavior.replaceExternalPolicies:
        return 'ReplaceExternalPolicies';
    }
  }
}

extension ScalingPolicyUpdateBehaviorFromString on String {
  ScalingPolicyUpdateBehavior toScalingPolicyUpdateBehavior() {
    switch (this) {
      case 'KeepExternalPolicies':
        return ScalingPolicyUpdateBehavior.keepExternalPolicies;
      case 'ReplaceExternalPolicies':
        return ScalingPolicyUpdateBehavior.replaceExternalPolicies;
    }
    throw Exception('$this is not known in enum ScalingPolicyUpdateBehavior');
  }
}

enum ScalingStatusCode {
  inactive,
  partiallyActive,
  active,
}

extension ScalingStatusCodeValueExtension on ScalingStatusCode {
  String toValue() {
    switch (this) {
      case ScalingStatusCode.inactive:
        return 'Inactive';
      case ScalingStatusCode.partiallyActive:
        return 'PartiallyActive';
      case ScalingStatusCode.active:
        return 'Active';
    }
  }
}

extension ScalingStatusCodeFromString on String {
  ScalingStatusCode toScalingStatusCode() {
    switch (this) {
      case 'Inactive':
        return ScalingStatusCode.inactive;
      case 'PartiallyActive':
        return ScalingStatusCode.partiallyActive;
      case 'Active':
        return ScalingStatusCode.active;
    }
    throw Exception('$this is not known in enum ScalingStatusCode');
  }
}

enum ServiceNamespace {
  autoscaling,
  ecs,
  ec2,
  rds,
  dynamodb,
}

extension ServiceNamespaceValueExtension on ServiceNamespace {
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
  }
}

extension ServiceNamespaceFromString on String {
  ServiceNamespace toServiceNamespace() {
    switch (this) {
      case 'autoscaling':
        return ServiceNamespace.autoscaling;
      case 'ecs':
        return ServiceNamespace.ecs;
      case 'ec2':
        return ServiceNamespace.ec2;
      case 'rds':
        return ServiceNamespace.rds;
      case 'dynamodb':
        return ServiceNamespace.dynamodb;
    }
    throw Exception('$this is not known in enum ServiceNamespace');
  }
}

/// Represents a tag.
class TagFilter {
  /// The tag key.
  final String? key;

  /// The tag values (0 to 20).
  final List<String>? values;

  TagFilter({
    this.key,
    this.values,
  });

  factory TagFilter.fromJson(Map<String, dynamic> json) {
    return TagFilter(
      key: json['Key'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (values != null) 'Values': values,
    };
  }
}

/// Describes a target tracking configuration to use with AWS Auto Scaling. Used
/// with <a>ScalingInstruction</a> and <a>ScalingPolicy</a>.
class TargetTrackingConfiguration {
  /// The target value for the metric. Although this property accepts numbers of
  /// type Double, it won't accept values that are either too small or too large.
  /// Values must be in the range of -2^360 to 2^360.
  final double targetValue;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  final CustomizedScalingMetricSpecification?
      customizedScalingMetricSpecification;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is <code>true</code>, scale in is disabled and the
  /// target tracking scaling policy doesn't remove capacity from the scalable
  /// resource. Otherwise, scale in is enabled and the target tracking scaling
  /// policy can remove capacity from the scalable resource.
  ///
  /// The default value is <code>false</code>.
  final bool? disableScaleIn;

  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics. This value is used only if the
  /// resource is an Auto Scaling group.
  final int? estimatedInstanceWarmup;

  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  final PredefinedScalingMetricSpecification?
      predefinedScalingMetricSpecification;

  /// The amount of time, in seconds, after a scale-in activity completes before
  /// another scale-in activity can start. This property is not used if the
  /// scalable resource is an Auto Scaling group.
  ///
  /// With the <i>scale-in cooldown period</i>, the intention is to scale in
  /// conservatively to protect your application’s availability, so scale-in
  /// activities are blocked until the cooldown period has expired. However, if
  /// another alarm triggers a scale-out activity during the scale-in cooldown
  /// period, Auto Scaling scales out the target immediately. In this case, the
  /// scale-in cooldown period stops and doesn't complete.
  final int? scaleInCooldown;

  /// The amount of time, in seconds, to wait for a previous scale-out activity to
  /// take effect. This property is not used if the scalable resource is an Auto
  /// Scaling group.
  ///
  /// With the <i>scale-out cooldown period</i>, the intention is to continuously
  /// (but not excessively) scale out. After Auto Scaling successfully scales out
  /// using a target tracking scaling policy, it starts to calculate the cooldown
  /// time. The scaling policy won't increase the desired capacity again unless
  /// either a larger scale out is triggered or the cooldown period ends.
  final int? scaleOutCooldown;

  TargetTrackingConfiguration({
    required this.targetValue,
    this.customizedScalingMetricSpecification,
    this.disableScaleIn,
    this.estimatedInstanceWarmup,
    this.predefinedScalingMetricSpecification,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory TargetTrackingConfiguration.fromJson(Map<String, dynamic> json) {
    return TargetTrackingConfiguration(
      targetValue: json['TargetValue'] as double,
      customizedScalingMetricSpecification:
          json['CustomizedScalingMetricSpecification'] != null
              ? CustomizedScalingMetricSpecification.fromJson(
                  json['CustomizedScalingMetricSpecification']
                      as Map<String, dynamic>)
              : null,
      disableScaleIn: json['DisableScaleIn'] as bool?,
      estimatedInstanceWarmup: json['EstimatedInstanceWarmup'] as int?,
      predefinedScalingMetricSpecification:
          json['PredefinedScalingMetricSpecification'] != null
              ? PredefinedScalingMetricSpecification.fromJson(
                  json['PredefinedScalingMetricSpecification']
                      as Map<String, dynamic>)
              : null,
      scaleInCooldown: json['ScaleInCooldown'] as int?,
      scaleOutCooldown: json['ScaleOutCooldown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    final customizedScalingMetricSpecification =
        this.customizedScalingMetricSpecification;
    final disableScaleIn = this.disableScaleIn;
    final estimatedInstanceWarmup = this.estimatedInstanceWarmup;
    final predefinedScalingMetricSpecification =
        this.predefinedScalingMetricSpecification;
    final scaleInCooldown = this.scaleInCooldown;
    final scaleOutCooldown = this.scaleOutCooldown;
    return {
      'TargetValue': targetValue,
      if (customizedScalingMetricSpecification != null)
        'CustomizedScalingMetricSpecification':
            customizedScalingMetricSpecification,
      if (disableScaleIn != null) 'DisableScaleIn': disableScaleIn,
      if (estimatedInstanceWarmup != null)
        'EstimatedInstanceWarmup': estimatedInstanceWarmup,
      if (predefinedScalingMetricSpecification != null)
        'PredefinedScalingMetricSpecification':
            predefinedScalingMetricSpecification,
      if (scaleInCooldown != null) 'ScaleInCooldown': scaleInCooldown,
      if (scaleOutCooldown != null) 'ScaleOutCooldown': scaleOutCooldown,
    };
  }
}

class UpdateScalingPlanResponse {
  UpdateScalingPlanResponse();

  factory UpdateScalingPlanResponse.fromJson(Map<String, dynamic> _) {
    return UpdateScalingPlanResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConcurrentUpdateException extends _s.GenericAwsException {
  ConcurrentUpdateException({String? type, String? message})
      : super(type: type, code: 'ConcurrentUpdateException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String? type, String? message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
