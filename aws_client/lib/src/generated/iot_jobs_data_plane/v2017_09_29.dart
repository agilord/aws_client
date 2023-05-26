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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.jobs.iot',
            signingName: 'iot-jobs-data',
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
    required String jobId,
    required String thingName,
    int? executionNumber,
    bool? includeJobDocument,
  }) async {
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
    required String thingName,
  }) async {
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
    required String thingName,
    Map<String, String>? statusDetails,
    int? stepTimeoutInMinutes,
  }) async {
    final $payload = <String, dynamic>{
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stepTimeoutInMinutes != null)
        'stepTimeoutInMinutes': stepTimeoutInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/jobs/%24next',
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
    required String jobId,
    required JobExecutionStatus status,
    required String thingName,
    int? executionNumber,
    int? expectedVersion,
    bool? includeJobDocument,
    bool? includeJobExecutionState,
    Map<String, String>? statusDetails,
    int? stepTimeoutInMinutes,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
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

class DescribeJobExecutionResponse {
  /// Contains data about a job execution.
  final JobExecution? execution;

  DescribeJobExecutionResponse({
    this.execution,
  });

  factory DescribeJobExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobExecutionResponse(
      execution: json['execution'] != null
          ? JobExecution.fromJson(json['execution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final execution = this.execution;
    return {
      if (execution != null) 'execution': execution,
    };
  }
}

class GetPendingJobExecutionsResponse {
  /// A list of JobExecutionSummary objects with status IN_PROGRESS.
  final List<JobExecutionSummary>? inProgressJobs;

  /// A list of JobExecutionSummary objects with status QUEUED.
  final List<JobExecutionSummary>? queuedJobs;

  GetPendingJobExecutionsResponse({
    this.inProgressJobs,
    this.queuedJobs,
  });

  factory GetPendingJobExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return GetPendingJobExecutionsResponse(
      inProgressJobs: (json['inProgressJobs'] as List?)
          ?.whereNotNull()
          .map((e) => JobExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      queuedJobs: (json['queuedJobs'] as List?)
          ?.whereNotNull()
          .map((e) => JobExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inProgressJobs = this.inProgressJobs;
    final queuedJobs = this.queuedJobs;
    return {
      if (inProgressJobs != null) 'inProgressJobs': inProgressJobs,
      if (queuedJobs != null) 'queuedJobs': queuedJobs,
    };
  }
}

/// Contains data about a job execution.
class JobExecution {
  /// The estimated number of seconds that remain before the job execution status
  /// will be changed to <code>TIMED_OUT</code>.
  final int? approximateSecondsBeforeTimedOut;

  /// A number that identifies a particular job execution on a particular device.
  /// It can be used later in commands that return or update job execution
  /// information.
  final int? executionNumber;

  /// The content of the job document.
  final String? jobDocument;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  final int? lastUpdatedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  final int? queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// started.
  final int? startedAt;

  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  final JobExecutionStatus? status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final Map<String, String>? statusDetails;

  /// The name of the thing that is executing the job.
  final String? thingName;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final int? versionNumber;

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

  factory JobExecution.fromJson(Map<String, dynamic> json) {
    return JobExecution(
      approximateSecondsBeforeTimedOut:
          json['approximateSecondsBeforeTimedOut'] as int?,
      executionNumber: json['executionNumber'] as int?,
      jobDocument: json['jobDocument'] as String?,
      jobId: json['jobId'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as int?,
      queuedAt: json['queuedAt'] as int?,
      startedAt: json['startedAt'] as int?,
      status: (json['status'] as String?)?.toJobExecutionStatus(),
      statusDetails: (json['statusDetails'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      thingName: json['thingName'] as String?,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateSecondsBeforeTimedOut =
        this.approximateSecondsBeforeTimedOut;
    final executionNumber = this.executionNumber;
    final jobDocument = this.jobDocument;
    final jobId = this.jobId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final queuedAt = this.queuedAt;
    final startedAt = this.startedAt;
    final status = this.status;
    final statusDetails = this.statusDetails;
    final thingName = this.thingName;
    final versionNumber = this.versionNumber;
    return {
      if (approximateSecondsBeforeTimedOut != null)
        'approximateSecondsBeforeTimedOut': approximateSecondsBeforeTimedOut,
      if (executionNumber != null) 'executionNumber': executionNumber,
      if (jobDocument != null) 'jobDocument': jobDocument,
      if (jobId != null) 'jobId': jobId,
      if (lastUpdatedAt != null) 'lastUpdatedAt': lastUpdatedAt,
      if (queuedAt != null) 'queuedAt': queuedAt,
      if (startedAt != null) 'startedAt': startedAt,
      if (status != null) 'status': status.toValue(),
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (thingName != null) 'thingName': thingName,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// Contains data about the state of a job execution.
class JobExecutionState {
  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  final JobExecutionStatus? status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final Map<String, String>? statusDetails;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final int? versionNumber;

  JobExecutionState({
    this.status,
    this.statusDetails,
    this.versionNumber,
  });

  factory JobExecutionState.fromJson(Map<String, dynamic> json) {
    return JobExecutionState(
      status: (json['status'] as String?)?.toJobExecutionStatus(),
      statusDetails: (json['statusDetails'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusDetails = this.statusDetails;
    final versionNumber = this.versionNumber;
    return {
      if (status != null) 'status': status.toValue(),
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

enum JobExecutionStatus {
  queued,
  inProgress,
  succeeded,
  failed,
  timedOut,
  rejected,
  removed,
  canceled,
}

extension JobExecutionStatusValueExtension on JobExecutionStatus {
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
  }
}

extension JobExecutionStatusFromString on String {
  JobExecutionStatus toJobExecutionStatus() {
    switch (this) {
      case 'QUEUED':
        return JobExecutionStatus.queued;
      case 'IN_PROGRESS':
        return JobExecutionStatus.inProgress;
      case 'SUCCEEDED':
        return JobExecutionStatus.succeeded;
      case 'FAILED':
        return JobExecutionStatus.failed;
      case 'TIMED_OUT':
        return JobExecutionStatus.timedOut;
      case 'REJECTED':
        return JobExecutionStatus.rejected;
      case 'REMOVED':
        return JobExecutionStatus.removed;
      case 'CANCELED':
        return JobExecutionStatus.canceled;
    }
    throw Exception('$this is not known in enum JobExecutionStatus');
  }
}

/// Contains a subset of information about a job execution.
class JobExecutionSummary {
  /// A number that identifies a particular job execution on a particular device.
  final int? executionNumber;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  final int? lastUpdatedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  final int? queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution started.
  final int? startedAt;

  /// The version of the job execution. Job execution versions are incremented
  /// each time AWS IoT Jobs receives an update from a device.
  final int? versionNumber;

  JobExecutionSummary({
    this.executionNumber,
    this.jobId,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.versionNumber,
  });

  factory JobExecutionSummary.fromJson(Map<String, dynamic> json) {
    return JobExecutionSummary(
      executionNumber: json['executionNumber'] as int?,
      jobId: json['jobId'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as int?,
      queuedAt: json['queuedAt'] as int?,
      startedAt: json['startedAt'] as int?,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionNumber = this.executionNumber;
    final jobId = this.jobId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final queuedAt = this.queuedAt;
    final startedAt = this.startedAt;
    final versionNumber = this.versionNumber;
    return {
      if (executionNumber != null) 'executionNumber': executionNumber,
      if (jobId != null) 'jobId': jobId,
      if (lastUpdatedAt != null) 'lastUpdatedAt': lastUpdatedAt,
      if (queuedAt != null) 'queuedAt': queuedAt,
      if (startedAt != null) 'startedAt': startedAt,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

class StartNextPendingJobExecutionResponse {
  /// A JobExecution object.
  final JobExecution? execution;

  StartNextPendingJobExecutionResponse({
    this.execution,
  });

  factory StartNextPendingJobExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNextPendingJobExecutionResponse(
      execution: json['execution'] != null
          ? JobExecution.fromJson(json['execution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final execution = this.execution;
    return {
      if (execution != null) 'execution': execution,
    };
  }
}

class UpdateJobExecutionResponse {
  /// A JobExecutionState object.
  final JobExecutionState? executionState;

  /// The contents of the Job Documents.
  final String? jobDocument;

  UpdateJobExecutionResponse({
    this.executionState,
    this.jobDocument,
  });

  factory UpdateJobExecutionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateJobExecutionResponse(
      executionState: json['executionState'] != null
          ? JobExecutionState.fromJson(
              json['executionState'] as Map<String, dynamic>)
          : null,
      jobDocument: json['jobDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionState = this.executionState;
    final jobDocument = this.jobDocument;
    return {
      if (executionState != null) 'executionState': executionState,
      if (jobDocument != null) 'jobDocument': jobDocument,
    };
  }
}

class CertificateValidationException extends _s.GenericAwsException {
  CertificateValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateValidationException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TerminalStateException extends _s.GenericAwsException {
  TerminalStateException({String? type, String? message})
      : super(type: type, code: 'TerminalStateException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
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
