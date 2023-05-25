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

/// These interfaces allow you to apply the AWS library of pre-defined
/// <i>controls</i> to your organizational units, programmatically. In this
/// context, controls are the same as AWS Control Tower guardrails.
///
/// To call these APIs, you'll need to know:
///
/// <ul>
/// <li>
/// the <code>ControlARN</code> for the control--that is, the guardrail--you are
/// targeting,
/// </li>
/// <li>
/// and the ARN associated with the target organizational unit (OU).
/// </li>
/// </ul>
/// <b>To get the <code>ControlARN</code> for your AWS Control Tower
/// guardrail:</b>
///
/// The <code>ControlARN</code> contains the control name which is specified in
/// each guardrail. For a list of control names for <i>Strongly recommended</i>
/// and <i>Elective</i> guardrails, see <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-identifiers.html.html">Resource
/// identifiers for APIs and guardrails</a> in the <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/automating-tasks.html">Automating
/// tasks section</a> of the AWS Control Tower User Guide. Remember that
/// <i>Mandatory</i> guardrails cannot be added or removed.
/// <note>
/// <b>ARN format:</b>
/// <code>arn:aws:controltower:{REGION}::control/{CONTROL_NAME}</code>
///
/// <b>Example:</b>
///
/// <code>arn:aws:controltower:us-west-2::control/AWS-GR_AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED</code>
/// </note>
/// <b>To get the ARN for an OU:</b>
///
/// In the AWS Organizations console, you can find the ARN for the OU on the
/// <b>Organizational unit details</b> page associated with that OU.
/// <note>
/// <b>OU ARN format:</b>
///
/// <code>arn:${Partition}:organizations::${MasterAccountId}:ou/o-${OrganizationId}/ou-${OrganizationalUnitId}</code>
/// </note> <p class="title"> <b>Details and examples</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/control-identifiers.html">List
/// of resource identifiers for APIs and guardrails</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/guardrail-api-examples-short.html">Guardrail
/// API examples (CLI)</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/enable-controls.html">Enable
/// controls with AWS CloudFormation</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/creating-resources-with-cloudformation.html">Creating
/// AWS Control Tower resources with AWS CloudFormation</a>
/// </li>
/// </ul>
/// To view the open source resource repository on GitHub, see <a
/// href="https://github.com/aws-cloudformation/aws-cloudformation-resource-providers-controltower">aws-cloudformation/aws-cloudformation-resource-providers-controltower</a>
///
/// <b>Recording API Requests</b>
///
/// AWS Control Tower supports AWS CloudTrail, a service that records AWS API
/// calls for your AWS account and delivers log files to an Amazon S3 bucket. By
/// using information collected by CloudTrail, you can determine which requests
/// the AWS Control Tower service received, who made the request and when, and
/// so on. For more about AWS Control Tower and its support for CloudTrail, see
/// <a
/// href="https://docs.aws.amazon.com/controltower/latest/userguide/logging-using-cloudtrail.html">Logging
/// AWS Control Tower Actions with AWS CloudTrail</a> in the AWS Control Tower
/// User Guide. To learn more about CloudTrail, including how to turn it on and
/// find your log files, see the AWS CloudTrail User Guide.
class ControlTower {
  final _s.RestJsonProtocol _protocol;
  ControlTower({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'controltower',
            signingName: 'controltower',
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

  /// This API call turns off a control. It starts an asynchronous operation
  /// that deletes AWS resources on the specified organizational unit and the
  /// accounts it contains. The resources will vary according to the control
  /// that you specify.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [controlIdentifier] :
  /// The ARN of the control. Only <b>Strongly recommended</b> and
  /// <b>Elective</b> controls are permitted, with the exception of the
  /// <b>Region deny</b> guardrail.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit.
  Future<DisableControlOutput> disableControl({
    required String controlIdentifier,
    required String targetIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'controlIdentifier': controlIdentifier,
      'targetIdentifier': targetIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disable-control',
      exceptionFnMap: _exceptionFns,
    );
    return DisableControlOutput.fromJson(response);
  }

  /// This API call activates a control. It starts an asynchronous operation
  /// that creates AWS resources on the specified organizational unit and the
  /// accounts it contains. The resources created will vary according to the
  /// control that you specify.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [controlIdentifier] :
  /// The ARN of the control. Only <b>Strongly recommended</b> and
  /// <b>Elective</b> controls are permitted, with the exception of the
  /// <b>Region deny</b> guardrail.
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit.
  Future<EnableControlOutput> enableControl({
    required String controlIdentifier,
    required String targetIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'controlIdentifier': controlIdentifier,
      'targetIdentifier': targetIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/enable-control',
      exceptionFnMap: _exceptionFns,
    );
    return EnableControlOutput.fromJson(response);
  }

  /// Returns the status of a particular <code>EnableControl</code> or
  /// <code>DisableControl</code> operation. Displays a message in case of
  /// error. Details for an operation are available for 90 days.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [operationIdentifier] :
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  Future<GetControlOperationOutput> getControlOperation({
    required String operationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'operationIdentifier': operationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-control-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetControlOperationOutput.fromJson(response);
  }

  /// Lists the controls enabled by AWS Control Tower on the specified
  /// organizational unit and the accounts it contains.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [targetIdentifier] :
  /// The ARN of the organizational unit.
  ///
  /// Parameter [maxResults] :
  /// How many results to return per API call.
  ///
  /// Parameter [nextToken] :
  /// The token to continue the list from a previous API call with the same
  /// parameters.
  Future<ListEnabledControlsOutput> listEnabledControls({
    required String targetIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'targetIdentifier': targetIdentifier,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-enabled-controls',
      exceptionFnMap: _exceptionFns,
    );
    return ListEnabledControlsOutput.fromJson(response);
  }
}

/// An operation performed by the control.
class ControlOperation {
  /// The time that the operation finished.
  final DateTime? endTime;

  /// One of <code>ENABLE_CONTROL</code> or <code>DISABLE_CONTROL</code>.
  final ControlOperationType? operationType;

  /// The time that the operation began.
  final DateTime? startTime;

  /// One of <code>IN_PROGRESS</code>, <code>SUCEEDED</code>, or
  /// <code>FAILED</code>.
  final ControlOperationStatus? status;

  /// If the operation result is <code>FAILED</code>, this string contains a
  /// message explaining why the operation failed.
  final String? statusMessage;

  ControlOperation({
    this.endTime,
    this.operationType,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory ControlOperation.fromJson(Map<String, dynamic> json) {
    return ControlOperation(
      endTime: timeStampFromJson(json['endTime']),
      operationType:
          (json['operationType'] as String?)?.toControlOperationType(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toControlOperationStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final operationType = this.operationType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationType != null) 'operationType': operationType.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum ControlOperationStatus {
  succeeded,
  failed,
  inProgress,
}

extension ControlOperationStatusValueExtension on ControlOperationStatus {
  String toValue() {
    switch (this) {
      case ControlOperationStatus.succeeded:
        return 'SUCCEEDED';
      case ControlOperationStatus.failed:
        return 'FAILED';
      case ControlOperationStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension ControlOperationStatusFromString on String {
  ControlOperationStatus toControlOperationStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return ControlOperationStatus.succeeded;
      case 'FAILED':
        return ControlOperationStatus.failed;
      case 'IN_PROGRESS':
        return ControlOperationStatus.inProgress;
    }
    throw Exception('$this is not known in enum ControlOperationStatus');
  }
}

enum ControlOperationType {
  enableControl,
  disableControl,
}

extension ControlOperationTypeValueExtension on ControlOperationType {
  String toValue() {
    switch (this) {
      case ControlOperationType.enableControl:
        return 'ENABLE_CONTROL';
      case ControlOperationType.disableControl:
        return 'DISABLE_CONTROL';
    }
  }
}

extension ControlOperationTypeFromString on String {
  ControlOperationType toControlOperationType() {
    switch (this) {
      case 'ENABLE_CONTROL':
        return ControlOperationType.enableControl;
      case 'DISABLE_CONTROL':
        return ControlOperationType.disableControl;
    }
    throw Exception('$this is not known in enum ControlOperationType');
  }
}

class DisableControlOutput {
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  final String operationIdentifier;

  DisableControlOutput({
    required this.operationIdentifier,
  });

  factory DisableControlOutput.fromJson(Map<String, dynamic> json) {
    return DisableControlOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

class EnableControlOutput {
  /// The ID of the asynchronous operation, which is used to track status. The
  /// operation is available for 90 days.
  final String operationIdentifier;

  EnableControlOutput({
    required this.operationIdentifier,
  });

  factory EnableControlOutput.fromJson(Map<String, dynamic> json) {
    return EnableControlOutput(
      operationIdentifier: json['operationIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationIdentifier = this.operationIdentifier;
    return {
      'operationIdentifier': operationIdentifier,
    };
  }
}

/// A summary of enabled controls.
class EnabledControlSummary {
  /// The ARN of the control. Only <b>Strongly recommended</b> and <b>Elective</b>
  /// controls are permitted, with the exception of the <b>Region deny</b>
  /// guardrail.
  final String? controlIdentifier;

  EnabledControlSummary({
    this.controlIdentifier,
  });

  factory EnabledControlSummary.fromJson(Map<String, dynamic> json) {
    return EnabledControlSummary(
      controlIdentifier: json['controlIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlIdentifier = this.controlIdentifier;
    return {
      if (controlIdentifier != null) 'controlIdentifier': controlIdentifier,
    };
  }
}

class GetControlOperationOutput {
  /// <p/>
  final ControlOperation controlOperation;

  GetControlOperationOutput({
    required this.controlOperation,
  });

  factory GetControlOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetControlOperationOutput(
      controlOperation: ControlOperation.fromJson(
          json['controlOperation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final controlOperation = this.controlOperation;
    return {
      'controlOperation': controlOperation,
    };
  }
}

class ListEnabledControlsOutput {
  /// Lists the controls enabled by AWS Control Tower on the specified
  /// organizational unit and the accounts it contains.
  final List<EnabledControlSummary> enabledControls;

  /// Retrieves the next page of results. If the string is empty, the current
  /// response is the end of the results.
  final String? nextToken;

  ListEnabledControlsOutput({
    required this.enabledControls,
    this.nextToken,
  });

  factory ListEnabledControlsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnabledControlsOutput(
      enabledControls: (json['enabledControls'] as List)
          .whereNotNull()
          .map((e) => EnabledControlSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledControls = this.enabledControls;
    final nextToken = this.nextToken;
    return {
      'enabledControls': enabledControls,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
