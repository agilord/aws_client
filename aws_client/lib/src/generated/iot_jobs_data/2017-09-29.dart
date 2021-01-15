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

part '2017-09-29.g.dart';

/// AWS IoT Jobs is a service that allows you to define a set of jobs — remote
/// operations that are sent to and executed on one or more devices connected to
/// AWS IoT. For example, you can define a job that instructs a set of devices
/// to download and install application or firmware updates, reboot, rotate
/// certificates, or perform remote troubleshooting operations.
///
/// To create a job, you make a job document which is a description of the
/// remote operations to be performed, and you specify a list of targets that
/// should perform the operations. The targets can be individual things, thing
/// groups or both.
///
/// AWS IoT Jobs sends a message to inform the targets that a job is available.
/// The target starts the execution of the job by downloading the job document,
/// performing the operations it specifies, and reporting its progress to AWS
/// IoT. The Jobs service provides commands to track the progress of a job on a
/// specific target and for all the targets of the job
class IoTJobsDataPlane {
  final _s.RestJsonProtocol _protocol;
  IoTJobsDataPlane({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.jobs.iot',
            signingName: 'iot-jobs-data',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Gets details of a job execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [CertificateValidationException].
  /// May throw [TerminalStateException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier assigned to this job when it was created.
  ///
  /// Parameter [thingName] :
  /// The thing name associated with the device the job execution is running on.
  ///
  /// Parameter [executionNumber] :
  /// Optional. A number that identifies a particular job execution on a
  /// particular device. If not specified, the latest job execution is returned.
  ///
  /// Parameter [includeJobDocument] :
  /// Optional. When set to true, the response contains the job document. The
  /// default is false.
  Future<DescribeJobExecutionResponse> describeJobExecution({
    @_s.required String jobId,
    @_s.required String thingName,
    int executionNumber,
    bool includeJobDocument,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+|^\$next''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (executionNumber != null)
        'executionNumber': [executionNumber.toString()],
      if (includeJobDocument != null)
        'includeJobDocument': [includeJobDocument.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobExecutionResponse.fromJson(response);
  }

  /// Gets the list of all jobs for a thing that are not in a terminal status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [CertificateValidationException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing that is executing the job.
  Future<GetPendingJobExecutionsResponse> getPendingJobExecutions({
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return GetPendingJobExecutionsResponse.fromJson(response);
  }

  /// Gets and starts the next pending (status IN_PROGRESS or QUEUED) job
  /// execution for a thing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [CertificateValidationException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing associated with the device.
  ///
  /// Parameter [statusDetails] :
  /// A collection of name/value pairs that describe the status of the job
  /// execution. If not specified, the statusDetails are unchanged.
  ///
  /// Parameter [stepTimeoutInMinutes] :
  /// Specifies the amount of time this device has to finish execution of this
  /// job. If the job execution status is not set to a terminal state before
  /// this timer expires, or before the timer is reset (by calling
  /// <code>UpdateJobExecution</code>, setting the status to
  /// <code>IN_PROGRESS</code> and specifying a new timeout value in field
  /// <code>stepTimeoutInMinutes</code>) the job execution status will be
  /// automatically set to <code>TIMED_OUT</code>. Note that setting this
  /// timeout has no effect on that job execution timeout which may have been
  /// specified when the job was created (<code>CreateJob</code> using field
  /// <code>timeoutConfig</code>).
  Future<StartNextPendingJobExecutionResponse> startNextPendingJobExecution({
    @_s.required String thingName,
    Map<String, String> statusDetails,
    int stepTimeoutInMinutes,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stepTimeoutInMinutes != null)
        'stepTimeoutInMinutes': stepTimeoutInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/jobs/\$next',
      exceptionFnMap: _exceptionFns,
    );
    return StartNextPendingJobExecutionResponse.fromJson(response);
  }

  /// Updates the status of a job execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [CertificateValidationException].
  /// May throw [InvalidStateTransitionException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier assigned to this job when it was created.
  ///
  /// Parameter [status] :
  /// The new status for the job execution (IN_PROGRESS, FAILED, SUCCESS, or
  /// REJECTED). This must be specified on every update.
  ///
  /// Parameter [thingName] :
  /// The name of the thing associated with the device.
  ///
  /// Parameter [executionNumber] :
  /// Optional. A number that identifies a particular job execution on a
  /// particular device.
  ///
  /// Parameter [expectedVersion] :
  /// Optional. The expected current version of the job execution. Each time you
  /// update the job execution, its version is incremented. If the version of
  /// the job execution stored in Jobs does not match, the update is rejected
  /// with a VersionMismatch error, and an ErrorResponse that contains the
  /// current job execution status data is returned. (This makes it unnecessary
  /// to perform a separate DescribeJobExecution request in order to obtain the
  /// job execution status data.)
  ///
  /// Parameter [includeJobDocument] :
  /// Optional. When set to true, the response contains the job document. The
  /// default is false.
  ///
  /// Parameter [includeJobExecutionState] :
  /// Optional. When included and set to true, the response contains the
  /// JobExecutionState data. The default is false.
  ///
  /// Parameter [statusDetails] :
  /// Optional. A collection of name/value pairs that describe the status of the
  /// job execution. If not specified, the statusDetails are unchanged.
  ///
  /// Parameter [stepTimeoutInMinutes] :
  /// Specifies the amount of time this device has to finish execution of this
  /// job. If the job execution status is not set to a terminal state before
  /// this timer expires, or before the timer is reset (by again calling
  /// <code>UpdateJobExecution</code>, setting the status to
  /// <code>IN_PROGRESS</code> and specifying a new timeout value in this field)
  /// the job execution status will be automatically set to
  /// <code>TIMED_OUT</code>. Note that setting or resetting this timeout has no
  /// effect on that job execution timeout which may have been specified when
  /// the job was created (<code>CreateJob</code> using field
  /// <code>timeoutConfig</code>).
  Future<UpdateJobExecutionResponse> updateJobExecution({
    @_s.required String jobId,
    @_s.required JobExecutionStatus status,
    @_s.required String thingName,
    int executionNumber,
    int expectedVersion,
    bool includeJobDocument,
    bool includeJobExecutionState,
    Map<String, String> statusDetails,
    int stepTimeoutInMinutes,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'status': status?.toValue() ?? '',
      if (executionNumber != null) 'executionNumber': executionNumber,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (includeJobDocument != null) 'includeJobDocument': includeJobDocument,
      if (includeJobExecutionState != null)
        'includeJobExecutionState': includeJobExecutionState,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stepTimeoutInMinutes != null)
        'stepTimeoutInMinutes': stepTimeoutInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobExecutionResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobExecutionResponse {
  /// Contains data about a job execution.
  @_s.JsonKey(name: 'execution')
  final JobExecution execution;

  DescribeJobExecutionResponse({
    this.execution,
  });
  factory DescribeJobExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobExecutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPendingJobExecutionsResponse {
  /// A list of JobExecutionSummary objects with status IN_PROGRESS.
  @_s.JsonKey(name: 'inProgressJobs')
  final List<JobExecutionSummary> inProgressJobs;

  /// A list of JobExecutionSummary objects with status QUEUED.
  @_s.JsonKey(name: 'queuedJobs')
  final List<JobExecutionSummary> queuedJobs;

  GetPendingJobExecutionsResponse({
    this.inProgressJobs,
    this.queuedJobs,
  });
  factory GetPendingJobExecutionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPendingJobExecutionsResponseFromJson(json);
}

/// Contains data about a job execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecution {
  /// The estimated number of seconds that remain before the job execution status
  /// will be changed to <code>TIMED_OUT</code>.
  @_s.JsonKey(name: 'approximateSecondsBeforeTimedOut')
  final int approximateSecondsBeforeTimedOut;

  /// A number that identifies a particular job execution on a particular device.
  /// It can be used later in commands that return or update job execution
  /// information.
  @_s.JsonKey(name: 'executionNumber')
  final int executionNumber;

  /// The content of the job document.
  @_s.JsonKey(name: 'jobDocument')
  final String jobDocument;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  @_s.JsonKey(name: 'lastUpdatedAt')
  final int lastUpdatedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  @_s.JsonKey(name: 'queuedAt')
  final int queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// started.
  @_s.JsonKey(name: 'startedAt')
  final int startedAt;

  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  @_s.JsonKey(name: 'status')
  final JobExecutionStatus status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  @_s.JsonKey(name: 'statusDetails')
  final Map<String, String> statusDetails;

  /// The name of the thing that is executing the job.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  @_s.JsonKey(name: 'versionNumber')
  final int versionNumber;

  JobExecution({
    this.approximateSecondsBeforeTimedOut,
    this.executionNumber,
    this.jobDocument,
    this.jobId,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.status,
    this.statusDetails,
    this.thingName,
    this.versionNumber,
  });
  factory JobExecution.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionFromJson(json);
}

/// Contains data about the state of a job execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionState {
  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  @_s.JsonKey(name: 'status')
  final JobExecutionStatus status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  @_s.JsonKey(name: 'statusDetails')
  final Map<String, String> statusDetails;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  @_s.JsonKey(name: 'versionNumber')
  final int versionNumber;

  JobExecutionState({
    this.status,
    this.statusDetails,
    this.versionNumber,
  });
  factory JobExecutionState.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionStateFromJson(json);
}

enum JobExecutionStatus {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('REMOVED')
  removed,
  @_s.JsonValue('CANCELED')
  canceled,
}

extension on JobExecutionStatus {
  String toValue() {
    switch (this) {
      case JobExecutionStatus.queued:
        return 'QUEUED';
      case JobExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case JobExecutionStatus.succeeded:
        return 'SUCCEEDED';
      case JobExecutionStatus.failed:
        return 'FAILED';
      case JobExecutionStatus.timedOut:
        return 'TIMED_OUT';
      case JobExecutionStatus.rejected:
        return 'REJECTED';
      case JobExecutionStatus.removed:
        return 'REMOVED';
      case JobExecutionStatus.canceled:
        return 'CANCELED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains a subset of information about a job execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionSummary {
  /// A number that identifies a particular job execution on a particular device.
  @_s.JsonKey(name: 'executionNumber')
  final int executionNumber;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  @_s.JsonKey(name: 'lastUpdatedAt')
  final int lastUpdatedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  @_s.JsonKey(name: 'queuedAt')
  final int queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution started.
  @_s.JsonKey(name: 'startedAt')
  final int startedAt;

  /// The version of the job execution. Job execution versions are incremented
  /// each time AWS IoT Jobs receives an update from a device.
  @_s.JsonKey(name: 'versionNumber')
  final int versionNumber;

  JobExecutionSummary({
    this.executionNumber,
    this.jobId,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.versionNumber,
  });
  factory JobExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartNextPendingJobExecutionResponse {
  /// A JobExecution object.
  @_s.JsonKey(name: 'execution')
  final JobExecution execution;

  StartNextPendingJobExecutionResponse({
    this.execution,
  });
  factory StartNextPendingJobExecutionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartNextPendingJobExecutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobExecutionResponse {
  /// A JobExecutionState object.
  @_s.JsonKey(name: 'executionState')
  final JobExecutionState executionState;

  /// The contents of the Job Documents.
  @_s.JsonKey(name: 'jobDocument')
  final String jobDocument;

  UpdateJobExecutionResponse({
    this.executionState,
    this.jobDocument,
  });
  factory UpdateJobExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobExecutionResponseFromJson(json);
}

class CertificateValidationException extends _s.GenericAwsException {
  CertificateValidationException({String type, String message})
      : super(
            type: type,
            code: 'CertificateValidationException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
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

class TerminalStateException extends _s.GenericAwsException {
  TerminalStateException({String type, String message})
      : super(type: type, code: 'TerminalStateException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CertificateValidationException': (type, message) =>
      CertificateValidationException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TerminalStateException': (type, message) =>
      TerminalStateException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
