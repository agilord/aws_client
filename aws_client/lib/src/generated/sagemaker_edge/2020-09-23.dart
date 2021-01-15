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

part '2020-09-23.g.dart';

/// SageMaker Edge Manager dataplane service for communicating with active
/// agents.
class SagemakerEdgeManager {
  final _s.RestJsonProtocol _protocol;
  SagemakerEdgeManager({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String deviceFleetName,
    @_s.required String deviceName,
  }) async {
    ArgumentError.checkNotNull(deviceFleetName, 'deviceFleetName');
    _s.validateStringLength(
      'deviceFleetName',
      deviceFleetName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceFleetName',
      deviceFleetName,
      r'''^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$''',
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
    _s.validateStringPattern(
      'deviceName',
      deviceName,
      r'''^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$''',
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
    @_s.required String agentVersion,
    @_s.required String deviceFleetName,
    @_s.required String deviceName,
    List<EdgeMetric> agentMetrics,
    List<Model> models,
  }) async {
    ArgumentError.checkNotNull(agentVersion, 'agentVersion');
    _s.validateStringLength(
      'agentVersion',
      agentVersion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'agentVersion',
      agentVersion,
      r'''[a-zA-Z0-9\ \_\.]+''',
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
    _s.validateStringPattern(
      'deviceFleetName',
      deviceFleetName,
      r'''^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$''',
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
    _s.validateStringPattern(
      'deviceName',
      deviceName,
      r'''^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$''',
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EdgeMetric {
  /// The dimension of metrics published.
  @_s.JsonKey(name: 'Dimension')
  final String dimension;

  /// Returns the name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// Timestamp of when the metric was requested.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// Returns the value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  EdgeMetric({
    this.dimension,
    this.metricName,
    this.timestamp,
    this.value,
  });
  Map<String, dynamic> toJson() => _$EdgeMetricToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceRegistrationResult {
  /// The amount of time, in seconds, that the registration status is stored on
  /// the device’s cache before it is refreshed.
  @_s.JsonKey(name: 'CacheTTL')
  final String cacheTTL;

  /// Describes if the device is currently registered with SageMaker Edge Manager.
  @_s.JsonKey(name: 'DeviceRegistration')
  final String deviceRegistration;

  GetDeviceRegistrationResult({
    this.cacheTTL,
    this.deviceRegistration,
  });
  factory GetDeviceRegistrationResult.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceRegistrationResultFromJson(json);
}

/// Information about a model deployed on an edge device that is registered with
/// SageMaker Edge Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Model {
  /// The timestamp of the last inference that was made.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LatestInference')
  final DateTime latestInference;

  /// The timestamp of the last data sample taken.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LatestSampleTime')
  final DateTime latestSampleTime;

  /// Information required for model metrics.
  @_s.JsonKey(name: 'ModelMetrics')
  final List<EdgeMetric> modelMetrics;

  /// The name of the model.
  @_s.JsonKey(name: 'ModelName')
  final String modelName;

  /// The version of the model.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  Model({
    this.latestInference,
    this.latestSampleTime,
    this.modelMetrics,
    this.modelName,
    this.modelVersion,
  });
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
};
