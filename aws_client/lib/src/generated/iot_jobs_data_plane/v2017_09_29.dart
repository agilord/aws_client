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

import 'v2017_09_29.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// IoT Jobs is a service that allows you to define a set of jobs — remote
/// operations that are sent to and executed on one or more devices connected to
/// Amazon Web Services IoT Core. For example, you can define a job that
/// instructs a set of devices to download and install application or firmware
/// updates, reboot, rotate certificates, or perform remote troubleshooting
/// operations.
///
/// Find the endpoint address for actions in the IoT jobs data plane by running
/// this CLI command:
///
/// <code>aws iot describe-endpoint --endpoint-type iot:Jobs</code>
///
/// The service name used by <a
/// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Amazon
/// Web Services Signature Version 4</a> to sign requests is:
/// <i>iot-jobs-data</i>.
///
/// To create a job, you make a job document which is a description of the
/// remote operations to be performed, and you specify a list of targets that
/// should perform the operations. The targets can be individual things, thing
/// groups or both.
///
/// IoT Jobs sends a message to inform the targets that a job is available. The
/// target starts the execution of the job by downloading the job document,
/// performing the operations it specifies, and reporting its progress to Amazon
/// Web Services IoT Core. The Jobs service provides commands to track the
/// progress of a job on a specific target and for all the targets of the job
class IoTJobsDataPlane {
  final _s.RestJsonProtocol _protocol;
  factory IoTJobsDataPlane({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'data.jobs.iot',
      signingName: 'iot-jobs-data',
    );
    return IoTJobsDataPlane._(
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
  IoTJobsDataPlane._({
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

  /// Gets details of a job execution.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeJobExecution</a>
  /// action.
  ///
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TerminalStateException].
  /// May throw [ThrottlingException].
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
  /// Optional. Unless set to false, the response contains the job document. The
  /// default is true.
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
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPendingJobExecutions</a>
  /// action.
  ///
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
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

  /// Using the command created with the <code>CreateCommand</code> API, start a
  /// command execution on a specific device.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [commandArn] :
  /// The Amazon Resource Number (ARN) of the command. For example,
  /// <code>arn:aws:iot:<region>:<accountid>:command/<commandName></code>
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Number (ARN) of the device where the command execution
  /// is occurring.
  ///
  /// Parameter [clientToken] :
  /// The client token is used to implement idempotency. It ensures that the
  /// request completes no more than one time. If you retry a request with the
  /// same token and the same parameters, the request will complete
  /// successfully. However, if you retry the request using the same token but
  /// different parameters, an HTTP 409 conflict occurs. If you omit this value,
  /// Amazon Web Services SDKs will automatically generate a unique client
  /// request.
  ///
  /// Parameter [executionTimeoutSeconds] :
  /// Specifies the amount of time in second the device has to finish the
  /// command execution. A timer is started as soon as the command execution is
  /// created. If the command execution status is not set to another terminal
  /// state before the timer expires, it will automatically update to
  /// <code>TIMED_OUT</code>.
  ///
  /// Parameter [parameters] :
  /// A list of parameters that are required by the
  /// <code>StartCommandExecution</code> API when performing the command on a
  /// device.
  Future<StartCommandExecutionResponse> startCommandExecution({
    required String commandArn,
    required String targetArn,
    String? clientToken,
    int? executionTimeoutSeconds,
    Map<String, CommandParameterValue>? parameters,
  }) async {
    _s.validateNumRange(
      'executionTimeoutSeconds',
      executionTimeoutSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'commandArn': commandArn,
      'targetArn': targetArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (executionTimeoutSeconds != null)
        'executionTimeoutSeconds': executionTimeoutSeconds,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/command-executions',
      exceptionFnMap: _exceptionFns,
    );
    return StartCommandExecutionResponse.fromJson(response);
  }

  /// Gets and starts the next pending (status IN_PROGRESS or QUEUED) job
  /// execution for a thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartNextPendingJobExecution</a>
  /// action.
  ///
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing associated with the device.
  ///
  /// Parameter [statusDetails] :
  /// A collection of name/value pairs that describe the status of the job
  /// execution. If not specified, the statusDetails are unchanged.
  ///
  /// The maximum length of the value in the name/value pair is 1,024
  /// characters.
  ///
  /// Parameter [stepTimeoutInMinutes] :
  /// Specifies the amount of time this device has to finish execution of this
  /// job. If the job execution status is not set to a terminal state before
  /// this timer expires, or before the timer is reset (by calling
  /// <code>UpdateJobExecution</code>, setting the status to
  /// <code>IN_PROGRESS</code>, and specifying a new timeout value in field
  /// <code>stepTimeoutInMinutes</code>) the job execution status will be
  /// automatically set to <code>TIMED_OUT</code>. Note that setting the step
  /// timeout has no effect on the in progress timeout that may have been
  /// specified when the job was created (<code>CreateJob</code> using field
  /// <code>timeoutConfig</code>).
  ///
  /// Valid values for this parameter range from 1 to 10080 (1 minute to 7
  /// days).
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
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotjobsdataplane.html">UpdateJobExecution</a>
  /// action.
  ///
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
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
  /// The maximum length of the value in the name/value pair is 1,024
  /// characters.
  ///
  /// Parameter [stepTimeoutInMinutes] :
  /// Specifies the amount of time this device has to finish execution of this
  /// job. If the job execution status is not set to a terminal state before
  /// this timer expires, or before the timer is reset (by again calling
  /// <code>UpdateJobExecution</code>, setting the status to
  /// <code>IN_PROGRESS</code>, and specifying a new timeout value in this
  /// field) the job execution status will be automatically set to
  /// <code>TIMED_OUT</code>. Note that setting or resetting the step timeout
  /// has no effect on the in progress timeout that may have been specified when
  /// the job was created (<code>CreateJob</code> using field
  /// <code>timeoutConfig</code>).
  ///
  /// Valid values for this parameter range from 1 to 10080 (1 minute to 7
  /// days). A value of -1 is also valid and will cancel the current step timer
  /// (created by an earlier use of <code>UpdateJobExecutionRequest</code>).
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
      'status': status.value,
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
          .map((e) => JobExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      queuedJobs: (json['queuedJobs'] as List?)
          ?.nonNulls
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

/// @nodoc
class StartCommandExecutionResponse {
  /// A unique identifier for the command execution.
  final String? executionId;

  StartCommandExecutionResponse({
    this.executionId,
  });

  factory StartCommandExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StartCommandExecutionResponse(
      executionId: json['executionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    return {
      if (executionId != null) 'executionId': executionId,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// Contains data about the state of a job execution.
///
/// @nodoc
class JobExecutionState {
  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "TIMED_OUT", "REJECTED", or "REMOVED".
  final JobExecutionStatus? status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  ///
  /// The maximum length of the value in the name/value pair is 1,024 characters.
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
      status: (json['status'] as String?)?.let(JobExecutionStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class JobExecutionStatus {
  static const queued = JobExecutionStatus._('QUEUED');
  static const inProgress = JobExecutionStatus._('IN_PROGRESS');
  static const succeeded = JobExecutionStatus._('SUCCEEDED');
  static const failed = JobExecutionStatus._('FAILED');
  static const timedOut = JobExecutionStatus._('TIMED_OUT');
  static const rejected = JobExecutionStatus._('REJECTED');
  static const removed = JobExecutionStatus._('REMOVED');
  static const canceled = JobExecutionStatus._('CANCELED');

  final String value;

  const JobExecutionStatus._(this.value);

  static const values = [
    queued,
    inProgress,
    succeeded,
    failed,
    timedOut,
    rejected,
    removed,
    canceled
  ];

  static JobExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is JobExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains data about a job execution.
///
/// @nodoc
class JobExecution {
  /// The estimated number of seconds that remain before the job execution status
  /// will be changed to <code>TIMED_OUT</code>. The actual job execution timeout
  /// can occur up to 60 seconds later than the estimated duration.
  final int? approximateSecondsBeforeTimedOut;

  /// A number that identifies a particular job execution on a particular device.
  /// It can be used later in commands that return or update job execution
  /// information.
  final int? executionNumber;

  /// The content of the job document.
  final String? jobDocument;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final int? lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was enqueued.
  final int? queuedAt;

  /// The time, in seconds since the epoch, when the job execution was started.
  final int? startedAt;

  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "TIMED_OUT", "REJECTED", or "REMOVED".
  final JobExecutionStatus? status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  ///
  /// The maximum length of the value in the name/value pair is 1,024 characters.
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
      status: (json['status'] as String?)?.let(JobExecutionStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (thingName != null) 'thingName': thingName,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The list of values used to describe a specific command parameter.
///
/// @nodoc
class CommandParameterValue {
  /// An attribute of type Boolean. For example:
  ///
  /// <code>"BOOL": true</code>
  final bool? b;

  /// An attribute of type Binary.
  final Uint8List? bin;

  /// An attribute of type Double (Sixty-Four Bits).
  final double? d;

  /// An attribute of type Integer (Thirty-Two Bits).
  final int? i;

  /// An attribute of type Long.
  final int? l;

  /// An attribute of type String. For example:
  ///
  /// <code>"S": "Hello"</code>
  final String? s;

  /// An attribute of type Unsigned Long.
  final String? ul;

  CommandParameterValue({
    this.b,
    this.bin,
    this.d,
    this.i,
    this.l,
    this.s,
    this.ul,
  });

  Map<String, dynamic> toJson() {
    final b = this.b;
    final bin = this.bin;
    final d = this.d;
    final i = this.i;
    final l = this.l;
    final s = this.s;
    final ul = this.ul;
    return {
      if (b != null) 'B': b,
      if (bin != null) 'BIN': base64Encode(bin),
      if (d != null) 'D': d,
      if (i != null) 'I': i,
      if (l != null) 'L': l,
      if (s != null) 'S': s,
      if (ul != null) 'UL': ul,
    };
  }
}

/// Contains a subset of information about a job execution.
///
/// @nodoc
class JobExecutionSummary {
  /// A number that identifies a particular job execution on a particular device.
  final int? executionNumber;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final int? lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was enqueued.
  final int? queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  final int? startedAt;

  /// The version of the job execution. Job execution versions are incremented
  /// each time IoT Jobs receives an update from a device.
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

/// @nodoc
class CertificateValidationException extends _s.GenericAwsException {
  CertificateValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateValidationException',
            message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

/// @nodoc
class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
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
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class TerminalStateException extends _s.GenericAwsException {
  TerminalStateException({String? type, String? message})
      : super(type: type, code: 'TerminalStateException', message: message);
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
  'CertificateValidationException': (type, message) =>
      CertificateValidationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TerminalStateException': (type, message) =>
      TerminalStateException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
