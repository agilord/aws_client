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

/// SageMaker Edge Manager dataplane service for communicating with active
/// agents.
class SagemakerEdgeManager {
  final _s.RestJsonProtocol _protocol;
  SagemakerEdgeManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'edge.sagemaker',
            signingName: 'sagemaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Use to check if a device is registered with SageMaker Edge Manager.
  ///
  /// May throw [InternalServiceException].
  ///
  /// Parameter [deviceFleetName] :
  /// The name of the fleet that the device belongs to.
  ///
  /// Parameter [deviceName] :
  /// The unique name of the device you want to get the registration status
  /// from.
  Future<GetDeviceRegistrationResult> getDeviceRegistration({
    required String deviceFleetName,
    required String deviceName,
  }) async {
    ArgumentError.checkNotNull(deviceFleetName, 'deviceFleetName');
    _s.validateStringLength(
      'deviceFleetName',
      deviceFleetName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceName, 'deviceName');
    _s.validateStringLength(
      'deviceName',
      deviceName,
      1,
      63,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DeviceFleetName': deviceFleetName,
      'DeviceName': deviceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetDeviceRegistration',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceRegistrationResult.fromJson(response);
  }

  /// Use to get the current status of devices registered on SageMaker Edge
  /// Manager.
  ///
  /// May throw [InternalServiceException].
  ///
  /// Parameter [agentVersion] :
  /// Returns the version of the agent.
  ///
  /// Parameter [deviceFleetName] :
  /// The name of the fleet that the device belongs to.
  ///
  /// Parameter [deviceName] :
  /// The unique name of the device.
  ///
  /// Parameter [agentMetrics] :
  /// For internal use. Returns a list of SageMaker Edge Manager agent operating
  /// metrics.
  ///
  /// Parameter [models] :
  /// Returns a list of models deployed on the the device.
  Future<void> sendHeartbeat({
    required String agentVersion,
    required String deviceFleetName,
    required String deviceName,
    List<EdgeMetric>? agentMetrics,
    List<Model>? models,
  }) async {
    ArgumentError.checkNotNull(agentVersion, 'agentVersion');
    _s.validateStringLength(
      'agentVersion',
      agentVersion,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceFleetName, 'deviceFleetName');
    _s.validateStringLength(
      'deviceFleetName',
      deviceFleetName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceName, 'deviceName');
    _s.validateStringLength(
      'deviceName',
      deviceName,
      1,
      63,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AgentVersion': agentVersion,
      'DeviceFleetName': deviceFleetName,
      'DeviceName': deviceName,
      if (agentMetrics != null) 'AgentMetrics': agentMetrics,
      if (models != null) 'Models': models,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SendHeartbeat',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Information required for edge device metrics.
class EdgeMetric {
  /// The dimension of metrics published.
  final String? dimension;

  /// Returns the name of the metric.
  final String? metricName;

  /// Timestamp of when the metric was requested.
  final DateTime? timestamp;

  /// Returns the value of the metric.
  final double? value;

  EdgeMetric({
    this.dimension,
    this.metricName,
    this.timestamp,
    this.value,
  });

  factory EdgeMetric.fromJson(Map<String, dynamic> json) {
    return EdgeMetric(
      dimension: json['Dimension'] as String?,
      metricName: json['MetricName'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final metricName = this.metricName;
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      if (dimension != null) 'Dimension': dimension,
      if (metricName != null) 'MetricName': metricName,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (value != null) 'Value': value,
    };
  }
}

class GetDeviceRegistrationResult {
  /// The amount of time, in seconds, that the registration status is stored on
  /// the device’s cache before it is refreshed.
  final String? cacheTTL;

  /// Describes if the device is currently registered with SageMaker Edge Manager.
  final String? deviceRegistration;

  GetDeviceRegistrationResult({
    this.cacheTTL,
    this.deviceRegistration,
  });

  factory GetDeviceRegistrationResult.fromJson(Map<String, dynamic> json) {
    return GetDeviceRegistrationResult(
      cacheTTL: json['CacheTTL'] as String?,
      deviceRegistration: json['DeviceRegistration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheTTL = this.cacheTTL;
    final deviceRegistration = this.deviceRegistration;
    return {
      if (cacheTTL != null) 'CacheTTL': cacheTTL,
      if (deviceRegistration != null) 'DeviceRegistration': deviceRegistration,
    };
  }
}

/// Information about a model deployed on an edge device that is registered with
/// SageMaker Edge Manager.
class Model {
  /// The timestamp of the last inference that was made.
  final DateTime? latestInference;

  /// The timestamp of the last data sample taken.
  final DateTime? latestSampleTime;

  /// Information required for model metrics.
  final List<EdgeMetric>? modelMetrics;

  /// The name of the model.
  final String? modelName;

  /// The version of the model.
  final String? modelVersion;

  Model({
    this.latestInference,
    this.latestSampleTime,
    this.modelMetrics,
    this.modelName,
    this.modelVersion,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      latestInference: timeStampFromJson(json['LatestInference']),
      latestSampleTime: timeStampFromJson(json['LatestSampleTime']),
      modelMetrics: (json['ModelMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => EdgeMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelName: json['ModelName'] as String?,
      modelVersion: json['ModelVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestInference = this.latestInference;
    final latestSampleTime = this.latestSampleTime;
    final modelMetrics = this.modelMetrics;
    final modelName = this.modelName;
    final modelVersion = this.modelVersion;
    return {
      if (latestInference != null)
        'LatestInference': unixTimestampToJson(latestInference),
      if (latestSampleTime != null)
        'LatestSampleTime': unixTimestampToJson(latestSampleTime),
      if (modelMetrics != null) 'ModelMetrics': modelMetrics,
      if (modelName != null) 'ModelName': modelName,
      if (modelVersion != null) 'ModelVersion': modelVersion,
    };
  }
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
};
