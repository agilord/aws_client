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

/// SageMaker Edge Manager dataplane service for communicating with active
/// agents.
class SagemakerEdgeManager {
  final _s.RestJsonProtocol _protocol;
  SagemakerEdgeManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Use to get the active deployments from a device.
  ///
  /// May throw [InternalServiceException].
  ///
  /// Parameter [deviceFleetName] :
  /// The name of the fleet that the device belongs to.
  ///
  /// Parameter [deviceName] :
  /// The unique name of the device you want to get the configuration of active
  /// deployments from.
  Future<GetDeploymentsResult> getDeployments({
    required String deviceFleetName,
    required String deviceName,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceFleetName': deviceFleetName,
      'DeviceName': deviceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetDeployments',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentsResult.fromJson(response);
  }

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
  /// Parameter [deploymentResult] :
  /// Returns the result of a deployment on the device.
  ///
  /// Parameter [models] :
  /// Returns a list of models deployed on the the device.
  Future<void> sendHeartbeat({
    required String agentVersion,
    required String deviceFleetName,
    required String deviceName,
    List<EdgeMetric>? agentMetrics,
    DeploymentResult? deploymentResult,
    List<Model>? models,
  }) async {
    final $payload = <String, dynamic>{
      'AgentVersion': agentVersion,
      'DeviceFleetName': deviceFleetName,
      'DeviceName': deviceName,
      if (agentMetrics != null) 'AgentMetrics': agentMetrics,
      if (deploymentResult != null) 'DeploymentResult': deploymentResult,
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

/// Information about the checksum of a model deployed on a device.
class Checksum {
  /// The checksum of the model.
  final String? sum;

  /// The type of the checksum.
  final ChecksumType? type;

  Checksum({
    this.sum,
    this.type,
  });

  factory Checksum.fromJson(Map<String, dynamic> json) {
    return Checksum(
      sum: json['Sum'] as String?,
      type: (json['Type'] as String?)?.let(ChecksumType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final sum = this.sum;
    final type = this.type;
    return {
      if (sum != null) 'Sum': sum,
      if (type != null) 'Type': type.value,
    };
  }
}

enum ChecksumType {
  sha1('SHA1'),
  ;

  final String value;

  const ChecksumType(this.value);

  static ChecksumType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ChecksumType'));
}

/// <p/>
class Definition {
  /// The checksum information of the model.
  final Checksum? checksum;

  /// The unique model handle.
  final String? modelHandle;

  /// The absolute S3 location of the model.
  final String? s3Url;

  /// The desired state of the model.
  final ModelState? state;

  Definition({
    this.checksum,
    this.modelHandle,
    this.s3Url,
    this.state,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      checksum: json['Checksum'] != null
          ? Checksum.fromJson(json['Checksum'] as Map<String, dynamic>)
          : null,
      modelHandle: json['ModelHandle'] as String?,
      s3Url: json['S3Url'] as String?,
      state: (json['State'] as String?)?.let(ModelState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final modelHandle = this.modelHandle;
    final s3Url = this.s3Url;
    final state = this.state;
    return {
      if (checksum != null) 'Checksum': checksum,
      if (modelHandle != null) 'ModelHandle': modelHandle,
      if (s3Url != null) 'S3Url': s3Url,
      if (state != null) 'State': state.value,
    };
  }
}

/// <p/>
class DeploymentModel {
  /// The desired state of the model.
  final ModelState? desiredState;

  /// The unique handle of the model.
  final String? modelHandle;

  /// The name of the model.
  final String? modelName;

  /// The version of the model.
  final String? modelVersion;

  /// Returns the error message if there is a rollback.
  final String? rollbackFailureReason;

  /// Returns the current state of the model.
  final ModelState? state;

  /// Returns the deployment status of the model.
  final DeploymentStatus? status;

  /// Returns the error message for the deployment status result.
  final String? statusReason;

  DeploymentModel({
    this.desiredState,
    this.modelHandle,
    this.modelName,
    this.modelVersion,
    this.rollbackFailureReason,
    this.state,
    this.status,
    this.statusReason,
  });

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final modelHandle = this.modelHandle;
    final modelName = this.modelName;
    final modelVersion = this.modelVersion;
    final rollbackFailureReason = this.rollbackFailureReason;
    final state = this.state;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (desiredState != null) 'DesiredState': desiredState.value,
      if (modelHandle != null) 'ModelHandle': modelHandle,
      if (modelName != null) 'ModelName': modelName,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (rollbackFailureReason != null)
        'RollbackFailureReason': rollbackFailureReason,
      if (state != null) 'State': state.value,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Information about the result of a deployment on an edge device that is
/// registered with SageMaker Edge Manager.
class DeploymentResult {
  /// The timestamp of when the deployment was ended, and the agent got the
  /// deployment results.
  final DateTime? deploymentEndTime;

  /// Returns a list of models deployed on the agent.
  final List<DeploymentModel>? deploymentModels;

  /// The name and unique ID of the deployment.
  final String? deploymentName;

  /// The timestamp of when the deployment was started on the agent.
  final DateTime? deploymentStartTime;

  /// Returns the bucket error code.
  final String? deploymentStatus;

  /// Returns the detailed error message.
  final String? deploymentStatusMessage;

  DeploymentResult({
    this.deploymentEndTime,
    this.deploymentModels,
    this.deploymentName,
    this.deploymentStartTime,
    this.deploymentStatus,
    this.deploymentStatusMessage,
  });

  Map<String, dynamic> toJson() {
    final deploymentEndTime = this.deploymentEndTime;
    final deploymentModels = this.deploymentModels;
    final deploymentName = this.deploymentName;
    final deploymentStartTime = this.deploymentStartTime;
    final deploymentStatus = this.deploymentStatus;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    return {
      if (deploymentEndTime != null)
        'DeploymentEndTime': unixTimestampToJson(deploymentEndTime),
      if (deploymentModels != null) 'DeploymentModels': deploymentModels,
      if (deploymentName != null) 'DeploymentName': deploymentName,
      if (deploymentStartTime != null)
        'DeploymentStartTime': unixTimestampToJson(deploymentStartTime),
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (deploymentStatusMessage != null)
        'DeploymentStatusMessage': deploymentStatusMessage,
    };
  }
}

enum DeploymentStatus {
  success('SUCCESS'),
  fail('FAIL'),
  ;

  final String value;

  const DeploymentStatus(this.value);

  static DeploymentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeploymentStatus'));
}

enum DeploymentType {
  model('Model'),
  ;

  final String value;

  const DeploymentType(this.value);

  static DeploymentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeploymentType'));
}

/// Information about a deployment on an edge device that is registered with
/// SageMaker Edge Manager.
class EdgeDeployment {
  /// Returns a list of Definition objects.
  final List<Definition>? definitions;

  /// The name and unique ID of the deployment.
  final String? deploymentName;

  /// Determines whether to rollback to previous configuration if deployment
  /// fails.
  final FailureHandlingPolicy? failureHandlingPolicy;

  /// The type of the deployment.
  final DeploymentType? type;

  EdgeDeployment({
    this.definitions,
    this.deploymentName,
    this.failureHandlingPolicy,
    this.type,
  });

  factory EdgeDeployment.fromJson(Map<String, dynamic> json) {
    return EdgeDeployment(
      definitions: (json['Definitions'] as List?)
          ?.nonNulls
          .map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      deploymentName: json['DeploymentName'] as String?,
      failureHandlingPolicy: (json['FailureHandlingPolicy'] as String?)
          ?.let(FailureHandlingPolicy.fromString),
      type: (json['Type'] as String?)?.let(DeploymentType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final deploymentName = this.deploymentName;
    final failureHandlingPolicy = this.failureHandlingPolicy;
    final type = this.type;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (deploymentName != null) 'DeploymentName': deploymentName,
      if (failureHandlingPolicy != null)
        'FailureHandlingPolicy': failureHandlingPolicy.value,
      if (type != null) 'Type': type.value,
    };
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

enum FailureHandlingPolicy {
  rollbackOnFailure('ROLLBACK_ON_FAILURE'),
  doNothing('DO_NOTHING'),
  ;

  final String value;

  const FailureHandlingPolicy(this.value);

  static FailureHandlingPolicy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FailureHandlingPolicy'));
}

class GetDeploymentsResult {
  /// Returns a list of the configurations of the active deployments on the
  /// device.
  final List<EdgeDeployment>? deployments;

  GetDeploymentsResult({
    this.deployments,
  });

  factory GetDeploymentsResult.fromJson(Map<String, dynamic> json) {
    return GetDeploymentsResult(
      deployments: (json['Deployments'] as List?)
          ?.nonNulls
          .map((e) => EdgeDeployment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    return {
      if (deployments != null) 'Deployments': deployments,
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

enum ModelState {
  deploy('DEPLOY'),
  undeploy('UNDEPLOY'),
  ;

  final String value;

  const ModelState(this.value);

  static ModelState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ModelState'));
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
};
