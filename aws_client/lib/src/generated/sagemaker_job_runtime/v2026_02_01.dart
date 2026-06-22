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

import 'v2026_02_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Agentic RFT Runtime Service - manages trajectory and transition data for
/// reinforcement fine-tuning jobs.
class SagemakerJobRuntime {
  final _s.RestJsonProtocol _protocol;
  factory SagemakerJobRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'job-runtime.sagemaker',
      signingName: 'sagemaker',
    );
    return SagemakerJobRuntime._(
      protocol: _s.RestJsonProtocol(
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
  SagemakerJobRuntime._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Marks a rollout as complete, indicating that no further turns will be
  /// appended to the trajectory. After calling this operation, the trajectory
  /// is sealed and eligible for reward submission via the UpdateReward
  /// operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The job ARN.
  ///
  /// Parameter [trajectoryId] :
  /// The trajectory ID to mark as complete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [status] :
  /// The target status for the trajectory. Defaults to READY if not specified.
  /// Set to FAILED if the rollout encountered an error and the trajectory
  /// should not be used for processing.
  Future<void> completeRollout({
    required String jobArn,
    required String trajectoryId,
    String? clientToken,
    CompletionStatus? status,
  }) async {
    final headers = <String, String>{
      'X-Amzn-SageMaker-Job-Arn': jobArn.toString(),
    };
    final $payload = <String, dynamic>{
      'TrajectoryId': trajectoryId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (status != null) 'Status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/complete-rollout',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends an inference request to the model during a job execution. The
  /// request and response bodies are forwarded to and from the model without
  /// modification. Each turn (prompt and response) is captured for later use.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [body] :
  /// The raw inference request body in OpenAI-compatible JSON format.
  ///
  /// Parameter [jobArn] :
  /// The job ARN that identifies which model session to route the inference
  /// request to.
  ///
  /// Parameter [trajectoryId] :
  /// The trajectory ID for grouping turns into a single rollout. Each turn
  /// (prompt and response) is captured for later use.
  Future<SampleResponse> sample({
    required Uint8List body,
    required String jobArn,
    required String trajectoryId,
  }) async {
    final headers = <String, String>{
      'X-Amzn-SageMaker-Job-Arn': jobArn.toString(),
      'X-Amzn-SageMaker-Trajectory-Id': trajectoryId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/sample',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SampleResponse(
      body: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Sends a streaming inference request to the model during a job execution.
  /// Returns the response as a stream of payload chunks. Each turn is captured
  /// for later use.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [body] :
  /// The raw inference request body in OpenAI-compatible JSON format.
  ///
  /// Parameter [jobArn] :
  /// The job ARN that identifies which model session to route the inference
  /// request to.
  ///
  /// Parameter [trajectoryId] :
  /// The trajectory ID for grouping turns into a single rollout. Each turn is
  /// captured for later use.
  Future<SampleWithResponseStreamResponse> sampleWithResponseStream({
    required Uint8List body,
    required String jobArn,
    required String trajectoryId,
  }) async {
    final headers = <String, String>{
      'X-Amzn-SageMaker-Job-Arn': jobArn.toString(),
      'X-Amzn-SageMaker-Trajectory-Id': trajectoryId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/sample-with-response-stream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SampleWithResponseStreamResponse(
      body: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Updates the reward values for a trajectory and transitions it to
  /// reward-received status, signaling that it is eligible for processing. Call
  /// this operation after CompleteRollout to provide the computed reward
  /// scores.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The job ARN.
  ///
  /// Parameter [rewards] :
  /// The list of reward values to assign to this trajectory. Provide one reward
  /// value per turn in the trajectory.
  ///
  /// Parameter [trajectoryId] :
  /// The trajectory ID to update with reward values.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> updateReward({
    required String jobArn,
    required List<double> rewards,
    required String trajectoryId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'X-Amzn-SageMaker-Job-Arn': jobArn.toString(),
    };
    final $payload = <String, dynamic>{
      'Rewards': rewards,
      'TrajectoryId': trajectoryId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-reward',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class CompleteRolloutResponse {
  CompleteRolloutResponse();

  factory CompleteRolloutResponse.fromJson(Map<String, dynamic> _) {
    return CompleteRolloutResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SampleResponse {
  /// The raw inference response body from the model.
  final Uint8List body;

  /// MIME type of the inference result.
  final String? contentType;

  SampleResponse({
    required this.body,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'Body': base64Encode(body),
    };
  }
}

/// @nodoc
class SampleWithResponseStreamResponse {
  /// The streaming response body, delivered as a series of PayloadPart events.
  final Uint8List body;

  /// MIME type of the streaming inference result.
  final String? contentType;

  SampleWithResponseStreamResponse({
    required this.body,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'Body': base64Encode(body),
    };
  }
}

/// @nodoc
class UpdateRewardResponse {
  UpdateRewardResponse();

  factory UpdateRewardResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRewardResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Allowed target statuses for the CompleteTrajectory operation.
///
/// @nodoc
class CompletionStatus {
  static const ready = CompletionStatus._('ready');
  static const failed = CompletionStatus._('failed');

  final String value;

  const CompletionStatus._(this.value);

  static const values = [ready, failed];

  static CompletionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompletionStatus._(value));

  @override
  bool operator ==(other) => other is CompletionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
