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

  /// Used to ingest training metrics into SageMaker. These metrics can be
  /// visualized in SageMaker Studio and retrieved with the
  /// <code>GetMetrics</code> API.
  ///
  /// Parameter [metricData] :
  /// A list of raw metric values to put.
  ///
  /// Parameter [trialComponentName] :
  /// The name of the Trial Component to associate with the metrics.
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
      code: (json['Code'] as String?)?.toPutMetricsErrorCode(),
      metricIndex: json['MetricIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final metricIndex = this.metricIndex;
    return {
      if (code != null) 'Code': code.toValue(),
      if (metricIndex != null) 'MetricIndex': metricIndex,
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
          ?.whereNotNull()
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

enum PutMetricsErrorCode {
  metricLimitExceeded,
  internalError,
  validationError,
  conflictError,
}

extension PutMetricsErrorCodeValueExtension on PutMetricsErrorCode {
  String toValue() {
    switch (this) {
      case PutMetricsErrorCode.metricLimitExceeded:
        return 'METRIC_LIMIT_EXCEEDED';
      case PutMetricsErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case PutMetricsErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case PutMetricsErrorCode.conflictError:
        return 'CONFLICT_ERROR';
    }
  }
}

extension PutMetricsErrorCodeFromString on String {
  PutMetricsErrorCode toPutMetricsErrorCode() {
    switch (this) {
      case 'METRIC_LIMIT_EXCEEDED':
        return PutMetricsErrorCode.metricLimitExceeded;
      case 'INTERNAL_ERROR':
        return PutMetricsErrorCode.internalError;
      case 'VALIDATION_ERROR':
        return PutMetricsErrorCode.validationError;
      case 'CONFLICT_ERROR':
        return PutMetricsErrorCode.conflictError;
    }
    throw Exception('$this is not known in enum PutMetricsErrorCode');
  }
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

final _exceptionFns = <String, _s.AwsExceptionFn>{};
