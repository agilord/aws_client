// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Contains all data plane API operations and data types for Amazon SageMaker
/// Metrics. Use these APIs to put and retrieve (get) features related to your
/// training run.
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_metrics_BatchPutMetrics.html">BatchPutMetrics</a>
/// </li>
/// </ul>
class SageMakerMetrics {
  final _s.RestJsonProtocol _protocol;
  SageMakerMetrics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'metrics.sagemaker',
            signingName: 'sagemaker',
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

  /// Used to retrieve training metrics from SageMaker.
  ///
  /// Parameter [metricQueries] :
  /// Queries made to retrieve training metrics from SageMaker.
  Future<BatchGetMetricsResponse> batchGetMetrics({
    required List<MetricQuery> metricQueries,
  }) async {
    final $payload = <String, dynamic>{
      'MetricQueries': metricQueries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetMetrics',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetMetricsResponse.fromJson(response);
  }

  /// Used to ingest training metrics into SageMaker. These metrics can be
  /// visualized in SageMaker Studio.
  ///
  /// Parameter [metricData] :
  /// A list of raw metric values to put.
  ///
  /// Parameter [trialComponentName] :
  /// The name of the Trial Component to associate with the metrics. The Trial
  /// Component name must be entirely lowercase.
  Future<BatchPutMetricsResponse> batchPutMetrics({
    required List<RawMetricData> metricData,
    required String trialComponentName,
  }) async {
    final $payload = <String, dynamic>{
      'MetricData': metricData,
      'TrialComponentName': trialComponentName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/BatchPutMetrics',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutMetricsResponse.fromJson(response);
  }
}

class BatchGetMetricsResponse {
  /// The results of a query to retrieve training metrics from SageMaker.
  final List<MetricQueryResult>? metricQueryResults;

  BatchGetMetricsResponse({
    this.metricQueryResults,
  });

  factory BatchGetMetricsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetMetricsResponse(
      metricQueryResults: (json['MetricQueryResults'] as List?)
          ?.nonNulls
          .map((e) => MetricQueryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricQueryResults = this.metricQueryResults;
    return {
      if (metricQueryResults != null) 'MetricQueryResults': metricQueryResults,
    };
  }
}

class BatchPutMetricsResponse {
  /// Lists any errors that occur when inserting metric data.
  final List<BatchPutMetricsError>? errors;

  BatchPutMetricsResponse({
    this.errors,
  });

  factory BatchPutMetricsResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutMetricsResponse(
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => BatchPutMetricsError.fromJson(e as Map<String, dynamic>))
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

/// An error that occured when putting the metric data.
class BatchPutMetricsError {
  /// The error code of an error that occured when attempting to put metrics.
  ///
  /// <ul>
  /// <li>
  /// <code>METRIC_LIMIT_EXCEEDED</code>: The maximum amount of metrics per
  /// resource is exceeded.
  /// </li>
  /// <li>
  /// <code>INTERNAL_ERROR</code>: An internal error occured.
  /// </li>
  /// <li>
  /// <code>VALIDATION_ERROR</code>: The metric data failed validation.
  /// </li>
  /// <li>
  /// <code>CONFLICT_ERROR</code>: Multiple requests attempted to modify the same
  /// data simultaneously.
  /// </li>
  /// </ul>
  final PutMetricsErrorCode? code;

  /// An index that corresponds to the metric in the request.
  final int? metricIndex;

  BatchPutMetricsError({
    this.code,
    this.metricIndex,
  });

  factory BatchPutMetricsError.fromJson(Map<String, dynamic> json) {
    return BatchPutMetricsError(
      code: (json['Code'] as String?)?.let(PutMetricsErrorCode.fromString),
      metricIndex: json['MetricIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final metricIndex = this.metricIndex;
    return {
      if (code != null) 'Code': code.value,
      if (metricIndex != null) 'MetricIndex': metricIndex,
    };
  }
}

class PutMetricsErrorCode {
  static const metricLimitExceeded =
      PutMetricsErrorCode._('METRIC_LIMIT_EXCEEDED');
  static const internalError = PutMetricsErrorCode._('INTERNAL_ERROR');
  static const validationError = PutMetricsErrorCode._('VALIDATION_ERROR');
  static const conflictError = PutMetricsErrorCode._('CONFLICT_ERROR');

  final String value;

  const PutMetricsErrorCode._(this.value);

  static const values = [
    metricLimitExceeded,
    internalError,
    validationError,
    conflictError
  ];

  static PutMetricsErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PutMetricsErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is PutMetricsErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The raw metric data to associate with the resource.
class RawMetricData {
  /// The name of the metric.
  final String metricName;

  /// The time that the metric was recorded.
  final DateTime timestamp;

  /// The metric value.
  final double value;

  /// The metric step (epoch).
  final int? step;

  RawMetricData({
    required this.metricName,
    required this.timestamp,
    required this.value,
    this.step,
  });

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final timestamp = this.timestamp;
    final value = this.value;
    final step = this.step;
    return {
      'MetricName': metricName,
      'Timestamp': unixTimestampToJson(timestamp),
      'Value': value,
      if (step != null) 'Step': step,
    };
  }
}

/// The result of a query to retrieve training metrics from SageMaker.
class MetricQueryResult {
  /// The metric values retrieved by the query.
  final List<double> metricValues;

  /// The status of the metric query.
  final MetricQueryResultStatus status;

  /// The values for the x-axis of the metrics.
  final List<int> xAxisValues;

  /// A message describing the status of the metric query.
  final String? message;

  MetricQueryResult({
    required this.metricValues,
    required this.status,
    required this.xAxisValues,
    this.message,
  });

  factory MetricQueryResult.fromJson(Map<String, dynamic> json) {
    return MetricQueryResult(
      metricValues: ((json['MetricValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      status:
          MetricQueryResultStatus.fromString((json['Status'] as String?) ?? ''),
      xAxisValues: ((json['XAxisValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricValues = this.metricValues;
    final status = this.status;
    final xAxisValues = this.xAxisValues;
    final message = this.message;
    return {
      'MetricValues': metricValues,
      'Status': status.value,
      'XAxisValues': xAxisValues,
      if (message != null) 'Message': message,
    };
  }
}

class MetricQueryResultStatus {
  static const complete = MetricQueryResultStatus._('Complete');
  static const truncated = MetricQueryResultStatus._('Truncated');
  static const internalError = MetricQueryResultStatus._('InternalError');
  static const validationError = MetricQueryResultStatus._('ValidationError');

  final String value;

  const MetricQueryResultStatus._(this.value);

  static const values = [complete, truncated, internalError, validationError];

  static MetricQueryResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetricQueryResultStatus._(value));

  @override
  bool operator ==(other) =>
      other is MetricQueryResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a query to retrieve training metrics from SageMaker.
class MetricQuery {
  /// The name of the metric to retrieve.
  final String metricName;

  /// The metrics stat type of metrics to retrieve.
  final MetricStatistic metricStat;

  /// The time period of metrics to retrieve.
  final Period period;

  /// The ARN of the SageMaker resource to retrieve metrics for.
  final String resourceArn;

  /// The x-axis type of metrics to retrieve.
  final XAxisType xAxisType;

  /// The end time of metrics to retrieve.
  final int? end;

  /// The start time of metrics to retrieve.
  final int? start;

  MetricQuery({
    required this.metricName,
    required this.metricStat,
    required this.period,
    required this.resourceArn,
    required this.xAxisType,
    this.end,
    this.start,
  });

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricStat = this.metricStat;
    final period = this.period;
    final resourceArn = this.resourceArn;
    final xAxisType = this.xAxisType;
    final end = this.end;
    final start = this.start;
    return {
      'MetricName': metricName,
      'MetricStat': metricStat.value,
      'Period': period.value,
      'ResourceArn': resourceArn,
      'XAxisType': xAxisType.value,
      if (end != null) 'End': end,
      if (start != null) 'Start': start,
    };
  }
}

class MetricStatistic {
  static const min = MetricStatistic._('Min');
  static const max = MetricStatistic._('Max');
  static const avg = MetricStatistic._('Avg');
  static const count = MetricStatistic._('Count');
  static const stdDev = MetricStatistic._('StdDev');
  static const last = MetricStatistic._('Last');

  final String value;

  const MetricStatistic._(this.value);

  static const values = [min, max, avg, count, stdDev, last];

  static MetricStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetricStatistic._(value));

  @override
  bool operator ==(other) => other is MetricStatistic && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Period {
  static const oneMinute = Period._('OneMinute');
  static const fiveMinute = Period._('FiveMinute');
  static const oneHour = Period._('OneHour');
  static const iterationNumber = Period._('IterationNumber');

  final String value;

  const Period._(this.value);

  static const values = [oneMinute, fiveMinute, oneHour, iterationNumber];

  static Period fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Period._(value));

  @override
  bool operator ==(other) => other is Period && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class XAxisType {
  static const iterationNumber = XAxisType._('IterationNumber');
  static const timestamp = XAxisType._('Timestamp');

  final String value;

  const XAxisType._(this.value);

  static const values = [iterationNumber, timestamp];

  static XAxisType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => XAxisType._(value));

  @override
  bool operator ==(other) => other is XAxisType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
