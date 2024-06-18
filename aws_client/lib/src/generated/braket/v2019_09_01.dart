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

/// The Amazon Braket API Reference provides information about the operations
/// and structures supported in Amazon Braket.
///
/// Additional Resources:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/braket/latest/developerguide/what-is-braket.html">Amazon
/// Braket Developer Guide</a>
/// </li>
/// </ul>
class Braket {
  final _s.RestJsonProtocol _protocol;
  Braket({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'braket',
            signingName: 'braket',
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

  /// Cancels an Amazon Braket job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The ARN of the Amazon Braket job to cancel.
  Future<CancelJobResponse> cancelJob({
    required String jobArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/job/${Uri.encodeComponent(jobArn)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// Cancels the specified task.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [quantumTaskArn] :
  /// The ARN of the task to cancel.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  Future<CancelQuantumTaskResponse> cancelQuantumTask({
    required String quantumTaskArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/quantum-task/${Uri.encodeComponent(quantumTaskArn)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelQuantumTaskResponse.fromJson(response);
  }

  /// Creates an Amazon Braket job.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [DeviceOfflineException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [algorithmSpecification] :
  /// Definition of the Amazon Braket job to be created. Specifies the container
  /// image the job uses and information about the Python scripts used for entry
  /// and training.
  ///
  /// Parameter [deviceConfig] :
  /// The quantum processing unit (QPU) or simulator used to create an Amazon
  /// Braket job.
  ///
  /// Parameter [instanceConfig] :
  /// Configuration of the resource instances to use while running the hybrid
  /// job on Amazon Braket.
  ///
  /// Parameter [jobName] :
  /// The name of the Amazon Braket job.
  ///
  /// Parameter [outputDataConfig] :
  /// The path to the S3 location where you want to store job artifacts and the
  /// encryption key used to store them.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can
  /// assume to perform tasks on behalf of a user. It can access user resources,
  /// run an Amazon Braket job container on behalf of user, and output resources
  /// to the users' s3 buckets.
  ///
  /// Parameter [associations] :
  /// The list of Amazon Braket resources associated with the hybrid job.
  ///
  /// Parameter [checkpointConfig] :
  /// Information about the output locations for job checkpoint data.
  ///
  /// Parameter [clientToken] :
  /// A unique token that guarantees that the call to this API is idempotent.
  ///
  /// Parameter [hyperParameters] :
  /// Algorithm-specific parameters used by an Amazon Braket job that influence
  /// the quality of the training job. The values are set with a string of JSON
  /// key:value pairs, where the key is the name of the hyperparameter and the
  /// value is the value of th hyperparameter.
  ///
  /// Parameter [inputDataConfig] :
  /// A list of parameters that specify the name and type of input data and
  /// where it is located.
  ///
  /// Parameter [stoppingCondition] :
  /// The user-defined criteria that specifies when a job stops running.
  ///
  /// Parameter [tags] :
  /// A tag object that consists of a key and an optional value, used to manage
  /// metadata for Amazon Braket resources.
  Future<CreateJobResponse> createJob({
    required AlgorithmSpecification algorithmSpecification,
    required DeviceConfig deviceConfig,
    required InstanceConfig instanceConfig,
    required String jobName,
    required JobOutputDataConfig outputDataConfig,
    required String roleArn,
    List<Association>? associations,
    JobCheckpointConfig? checkpointConfig,
    String? clientToken,
    Map<String, String>? hyperParameters,
    List<InputFileConfig>? inputDataConfig,
    JobStoppingCondition? stoppingCondition,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'algorithmSpecification': algorithmSpecification,
      'deviceConfig': deviceConfig,
      'instanceConfig': instanceConfig,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      if (associations != null) 'associations': associations,
      if (checkpointConfig != null) 'checkpointConfig': checkpointConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (inputDataConfig != null) 'inputDataConfig': inputDataConfig,
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/job',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Creates a quantum task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [DeviceOfflineException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action associated with the task.
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to run the task on.
  ///
  /// Parameter [outputS3Bucket] :
  /// The S3 bucket to store task result files in.
  ///
  /// Parameter [outputS3KeyPrefix] :
  /// The key prefix for the location in the S3 bucket to store task results in.
  ///
  /// Parameter [shots] :
  /// The number of shots to use for the task.
  ///
  /// Parameter [associations] :
  /// The list of Amazon Braket resources associated with the quantum task.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [deviceParameters] :
  /// The parameters for the device to run the task on.
  ///
  /// Parameter [jobToken] :
  /// The token for an Amazon Braket job that associates it with the quantum
  /// task.
  ///
  /// Parameter [tags] :
  /// Tags to be added to the quantum task you're creating.
  Future<CreateQuantumTaskResponse> createQuantumTask({
    required Object action,
    required String deviceArn,
    required String outputS3Bucket,
    required String outputS3KeyPrefix,
    required int shots,
    List<Association>? associations,
    String? clientToken,
    Object? deviceParameters,
    String? jobToken,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'shots',
      shots,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'action': jsonEncode(action),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3KeyPrefix': outputS3KeyPrefix,
      'shots': shots,
      if (associations != null) 'associations': associations,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deviceParameters != null)
        'deviceParameters': jsonEncode(deviceParameters),
      if (jobToken != null) 'jobToken': jobToken,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/quantum-task',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQuantumTaskResponse.fromJson(response);
  }

  /// Retrieves the devices available in Amazon Braket.
  /// <note>
  /// For backwards compatibility with older versions of BraketSchemas, OpenQASM
  /// information is omitted from GetDevice API calls. To get this information
  /// the user-agent needs to present a recent version of the BraketSchemas
  /// (1.8.0 or later). The Braket SDK automatically reports this for you. If
  /// you do not see OpenQASM results in the GetDevice response when using a
  /// Braket SDK, you may need to set AWS_EXECUTION_ENV environment variable to
  /// configure user-agent. See the code examples provided below for how to do
  /// this for the AWS CLI, Boto3, and the Go, Java, and JavaScript/TypeScript
  /// SDKs.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to retrieve.
  Future<GetDeviceResponse> getDevice({
    required String deviceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device/${Uri.encodeComponent(deviceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceResponse.fromJson(response);
  }

  /// Retrieves the specified Amazon Braket job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The ARN of the job to retrieve.
  ///
  /// Parameter [additionalAttributeNames] :
  /// A list of attributes to return information for.
  Future<GetJobResponse> getJob({
    required String jobArn,
    List<HybridJobAdditionalAttributeName>? additionalAttributeNames,
  }) async {
    final $query = <String, List<String>>{
      if (additionalAttributeNames != null)
        'additionalAttributeNames':
            additionalAttributeNames.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/job/${Uri.encodeComponent(jobArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// Retrieves the specified quantum task.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [quantumTaskArn] :
  /// The ARN of the task to retrieve.
  ///
  /// Parameter [additionalAttributeNames] :
  /// A list of attributes to return information for.
  Future<GetQuantumTaskResponse> getQuantumTask({
    required String quantumTaskArn,
    List<QuantumTaskAdditionalAttributeName>? additionalAttributeNames,
  }) async {
    final $query = <String, List<String>>{
      if (additionalAttributeNames != null)
        'additionalAttributeNames':
            additionalAttributeNames.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/quantum-task/${Uri.encodeComponent(quantumTaskArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetQuantumTaskResponse.fromJson(response);
  }

  /// Shows the tags associated with this resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> for the resource whose tags to
  /// display.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Searches for devices using the specified filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filter values to use to search for a device.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request continue results where the
  /// previous request ended.
  Future<SearchDevicesResponse> searchDevices({
    required List<SearchDevicesFilter> filters,
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
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/devices',
      exceptionFnMap: _exceptionFns,
    );
    return SearchDevicesResponse.fromJson(response);
  }

  /// Searches for Amazon Braket jobs that match the specified filter values.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filter values to use when searching for a job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request to continue results where the
  /// previous request ended.
  Future<SearchJobsResponse> searchJobs({
    required List<SearchJobsFilter> filters,
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
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return SearchJobsResponse.fromJson(response);
  }

  /// Searches for tasks that match the specified filter values.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Array of <code>SearchQuantumTasksFilter</code> objects.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request continue results where the
  /// previous request ended.
  Future<SearchQuantumTasksResponse> searchQuantumTasks({
    required List<SearchQuantumTasksFilter> filters,
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
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/quantum-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return SearchQuantumTasksResponse.fromJson(response);
  }

  /// Add a tag to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> of the resource to which a tag will
  /// be added.
  ///
  /// Parameter [tags] :
  /// Specify the tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove tags from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> for the resource from which to remove
  /// the tags.
  ///
  /// Parameter [tagKeys] :
  /// Specify the keys for the tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Defines the Amazon Braket job to be created. Specifies the container image
/// the job uses and the paths to the Python scripts used for entry and
/// training.
class AlgorithmSpecification {
  /// The container image used to create an Amazon Braket job.
  final ContainerImage? containerImage;

  /// Configures the paths to the Python scripts used for entry and training.
  final ScriptModeConfig? scriptModeConfig;

  AlgorithmSpecification({
    this.containerImage,
    this.scriptModeConfig,
  });

  factory AlgorithmSpecification.fromJson(Map<String, dynamic> json) {
    return AlgorithmSpecification(
      containerImage: json['containerImage'] != null
          ? ContainerImage.fromJson(
              json['containerImage'] as Map<String, dynamic>)
          : null,
      scriptModeConfig: json['scriptModeConfig'] != null
          ? ScriptModeConfig.fromJson(
              json['scriptModeConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerImage = this.containerImage;
    final scriptModeConfig = this.scriptModeConfig;
    return {
      if (containerImage != null) 'containerImage': containerImage,
      if (scriptModeConfig != null) 'scriptModeConfig': scriptModeConfig,
    };
  }
}

/// The Amazon Braket resource and the association type.
class Association {
  /// The Amazon Braket resource arn.
  final String arn;

  /// The association type for the specified Amazon Braket resource arn.
  final AssociationType type;

  Association({
    required this.arn,
    required this.type,
  });

  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      arn: json['arn'] as String,
      type: AssociationType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    return {
      'arn': arn,
      'type': type.value,
    };
  }
}

enum AssociationType {
  reservationTimeWindowArn('RESERVATION_TIME_WINDOW_ARN'),
  ;

  final String value;

  const AssociationType(this.value);

  static AssociationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AssociationType'));
}

class CancelJobResponse {
  /// The status of the job cancellation request.
  final CancellationStatus cancellationStatus;

  /// The ARN of the Amazon Braket job.
  final String jobArn;

  CancelJobResponse({
    required this.cancellationStatus,
    required this.jobArn,
  });

  factory CancelJobResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobResponse(
      cancellationStatus:
          CancellationStatus.fromString((json['cancellationStatus'] as String)),
      jobArn: json['jobArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationStatus = this.cancellationStatus;
    final jobArn = this.jobArn;
    return {
      'cancellationStatus': cancellationStatus.value,
      'jobArn': jobArn,
    };
  }
}

class CancelQuantumTaskResponse {
  /// The status of the cancellation request.
  final CancellationStatus cancellationStatus;

  /// The ARN of the task.
  final String quantumTaskArn;

  CancelQuantumTaskResponse({
    required this.cancellationStatus,
    required this.quantumTaskArn,
  });

  factory CancelQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return CancelQuantumTaskResponse(
      cancellationStatus:
          CancellationStatus.fromString((json['cancellationStatus'] as String)),
      quantumTaskArn: json['quantumTaskArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationStatus = this.cancellationStatus;
    final quantumTaskArn = this.quantumTaskArn;
    return {
      'cancellationStatus': cancellationStatus.value,
      'quantumTaskArn': quantumTaskArn,
    };
  }
}

enum CancellationStatus {
  cancelling('CANCELLING'),
  cancelled('CANCELLED'),
  ;

  final String value;

  const CancellationStatus(this.value);

  static CancellationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CancellationStatus'));
}

enum CompressionType {
  none('NONE'),
  gzip('GZIP'),
  ;

  final String value;

  const CompressionType(this.value);

  static CompressionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CompressionType'));
}

/// The container image used to create an Amazon Braket job.
class ContainerImage {
  /// The URI locating the container image.
  final String uri;

  ContainerImage({
    required this.uri,
  });

  factory ContainerImage.fromJson(Map<String, dynamic> json) {
    return ContainerImage(
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

class CreateJobResponse {
  /// The ARN of the Amazon Braket job created.
  final String jobArn;

  CreateJobResponse({
    required this.jobArn,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      jobArn: json['jobArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

class CreateQuantumTaskResponse {
  /// The ARN of the task created by the request.
  final String quantumTaskArn;

  CreateQuantumTaskResponse({
    required this.quantumTaskArn,
  });

  factory CreateQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateQuantumTaskResponse(
      quantumTaskArn: json['quantumTaskArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final quantumTaskArn = this.quantumTaskArn;
    return {
      'quantumTaskArn': quantumTaskArn,
    };
  }
}

/// Information about the source of the data used by the Amazon Braket job.
class DataSource {
  /// Information about the data stored in Amazon S3 used by the Amazon Braket
  /// job.
  final S3DataSource s3DataSource;

  DataSource({
    required this.s3DataSource,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      s3DataSource:
          S3DataSource.fromJson(json['s3DataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataSource = this.s3DataSource;
    return {
      's3DataSource': s3DataSource,
    };
  }
}

/// Configures the quantum processing units (QPUs) or simulator used to create
/// and run an Amazon Braket job.
class DeviceConfig {
  /// The primary quantum processing unit (QPU) or simulator used to create and
  /// run an Amazon Braket job.
  final String device;

  DeviceConfig({
    required this.device,
  });

  factory DeviceConfig.fromJson(Map<String, dynamic> json) {
    return DeviceConfig(
      device: json['device'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      'device': device,
    };
  }
}

/// Information about tasks and jobs queued on a device.
class DeviceQueueInfo {
  /// The name of the queue.
  final QueueName queue;

  /// The number of jobs or tasks in the queue for a given device.
  final String queueSize;

  /// Optional. Specifies the priority of the queue. Tasks in a priority queue are
  /// processed before the tasks in a normal queue.
  final QueuePriority? queuePriority;

  DeviceQueueInfo({
    required this.queue,
    required this.queueSize,
    this.queuePriority,
  });

  factory DeviceQueueInfo.fromJson(Map<String, dynamic> json) {
    return DeviceQueueInfo(
      queue: QueueName.fromString((json['queue'] as String)),
      queueSize: json['queueSize'] as String,
      queuePriority:
          (json['queuePriority'] as String?)?.let(QueuePriority.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    final queueSize = this.queueSize;
    final queuePriority = this.queuePriority;
    return {
      'queue': queue.value,
      'queueSize': queueSize,
      if (queuePriority != null) 'queuePriority': queuePriority.value,
    };
  }
}

enum DeviceStatus {
  online('ONLINE'),
  offline('OFFLINE'),
  retired('RETIRED'),
  ;

  final String value;

  const DeviceStatus(this.value);

  static DeviceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceStatus'));
}

/// Includes information about the device.
class DeviceSummary {
  /// The ARN of the device.
  final String deviceArn;

  /// The name of the device.
  final String deviceName;

  /// The status of the device.
  final DeviceStatus deviceStatus;

  /// The type of the device.
  final DeviceType deviceType;

  /// The provider of the device.
  final String providerName;

  DeviceSummary({
    required this.deviceArn,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceType,
    required this.providerName,
  });

  factory DeviceSummary.fromJson(Map<String, dynamic> json) {
    return DeviceSummary(
      deviceArn: json['deviceArn'] as String,
      deviceName: json['deviceName'] as String,
      deviceStatus: DeviceStatus.fromString((json['deviceStatus'] as String)),
      deviceType: DeviceType.fromString((json['deviceType'] as String)),
      providerName: json['providerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceArn = this.deviceArn;
    final deviceName = this.deviceName;
    final deviceStatus = this.deviceStatus;
    final deviceType = this.deviceType;
    final providerName = this.providerName;
    return {
      'deviceArn': deviceArn,
      'deviceName': deviceName,
      'deviceStatus': deviceStatus.value,
      'deviceType': deviceType.value,
      'providerName': providerName,
    };
  }
}

enum DeviceType {
  qpu('QPU'),
  simulator('SIMULATOR'),
  ;

  final String value;

  const DeviceType(this.value);

  static DeviceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DeviceType'));
}

class GetDeviceResponse {
  /// The ARN of the device.
  final String deviceArn;

  /// Details about the capabilities of the device.
  final Object deviceCapabilities;

  /// The name of the device.
  final String deviceName;

  /// The status of the device.
  final DeviceStatus deviceStatus;

  /// The type of the device.
  final DeviceType deviceType;

  /// The name of the partner company for the device.
  final String providerName;

  /// List of information about tasks and jobs queued on a device.
  final List<DeviceQueueInfo>? deviceQueueInfo;

  GetDeviceResponse({
    required this.deviceArn,
    required this.deviceCapabilities,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceType,
    required this.providerName,
    this.deviceQueueInfo,
  });

  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceResponse(
      deviceArn: json['deviceArn'] as String,
      deviceCapabilities:
          jsonDecode(json['deviceCapabilities'] as String) as Object,
      deviceName: json['deviceName'] as String,
      deviceStatus: DeviceStatus.fromString((json['deviceStatus'] as String)),
      deviceType: DeviceType.fromString((json['deviceType'] as String)),
      providerName: json['providerName'] as String,
      deviceQueueInfo: (json['deviceQueueInfo'] as List?)
          ?.nonNulls
          .map((e) => DeviceQueueInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceArn = this.deviceArn;
    final deviceCapabilities = this.deviceCapabilities;
    final deviceName = this.deviceName;
    final deviceStatus = this.deviceStatus;
    final deviceType = this.deviceType;
    final providerName = this.providerName;
    final deviceQueueInfo = this.deviceQueueInfo;
    return {
      'deviceArn': deviceArn,
      'deviceCapabilities': jsonEncode(deviceCapabilities),
      'deviceName': deviceName,
      'deviceStatus': deviceStatus.value,
      'deviceType': deviceType.value,
      'providerName': providerName,
      if (deviceQueueInfo != null) 'deviceQueueInfo': deviceQueueInfo,
    };
  }
}

class GetJobResponse {
  /// Definition of the Amazon Braket job created. Specifies the container image
  /// the job uses, information about the Python scripts used for entry and
  /// training, and the user-defined metrics used to evaluation the job.
  final AlgorithmSpecification algorithmSpecification;

  /// The date and time that the Amazon Braket job was created.
  final DateTime createdAt;

  /// The resource instances to use while running the hybrid job on Amazon Braket.
  final InstanceConfig instanceConfig;

  /// The ARN of the Amazon Braket job.
  final String jobArn;

  /// The name of the Amazon Braket job.
  final String jobName;

  /// The path to the S3 location where job artifacts are stored and the
  /// encryption key used to store them there.
  final JobOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can assume
  /// to perform tasks on behalf of a user. It can access user resources, run an
  /// Amazon Braket job container on behalf of user, and output resources to the
  /// s3 buckets of a user.
  final String roleArn;

  /// The status of the Amazon Braket job.
  final JobPrimaryStatus status;

  /// The list of Amazon Braket resources associated with the hybrid job.
  final List<Association>? associations;

  /// The billable time the Amazon Braket job used to complete.
  final int? billableDuration;

  /// Information about the output locations for job checkpoint data.
  final JobCheckpointConfig? checkpointConfig;

  /// The quantum processing unit (QPU) or simulator used to run the Amazon Braket
  /// job.
  final DeviceConfig? deviceConfig;

  /// The date and time that the Amazon Braket job ended.
  final DateTime? endedAt;

  /// Details about the type and time events occurred related to the Amazon Braket
  /// job.
  final List<JobEventDetails>? events;

  /// A description of the reason why an Amazon Braket job failed, if it failed.
  final String? failureReason;

  /// Algorithm-specific parameters used by an Amazon Braket job that influence
  /// the quality of the traiing job. The values are set with a string of JSON
  /// key:value pairs, where the key is the name of the hyperparameter and the
  /// value is the value of th hyperparameter.
  final Map<String, String>? hyperParameters;

  /// A list of parameters that specify the name and type of input data and where
  /// it is located.
  final List<InputFileConfig>? inputDataConfig;

  /// Queue information for the requested job. Only returned if
  /// <code>QueueInfo</code> is specified in the
  /// <code>additionalAttributeNames"</code> field in the <code>GetJob</code> API
  /// request.
  final HybridJobQueueInfo? queueInfo;

  /// The date and time that the Amazon Braket job was started.
  final DateTime? startedAt;

  /// The user-defined criteria that specifies when to stop a job running.
  final JobStoppingCondition? stoppingCondition;

  /// A tag object that consists of a key and an optional value, used to manage
  /// metadata for Amazon Braket resources.
  final Map<String, String>? tags;

  GetJobResponse({
    required this.algorithmSpecification,
    required this.createdAt,
    required this.instanceConfig,
    required this.jobArn,
    required this.jobName,
    required this.outputDataConfig,
    required this.roleArn,
    required this.status,
    this.associations,
    this.billableDuration,
    this.checkpointConfig,
    this.deviceConfig,
    this.endedAt,
    this.events,
    this.failureReason,
    this.hyperParameters,
    this.inputDataConfig,
    this.queueInfo,
    this.startedAt,
    this.stoppingCondition,
    this.tags,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      algorithmSpecification: AlgorithmSpecification.fromJson(
          json['algorithmSpecification'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      instanceConfig: InstanceConfig.fromJson(
          json['instanceConfig'] as Map<String, dynamic>),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      outputDataConfig: JobOutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      status: JobPrimaryStatus.fromString((json['status'] as String)),
      associations: (json['associations'] as List?)
          ?.nonNulls
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      billableDuration: json['billableDuration'] as int?,
      checkpointConfig: json['checkpointConfig'] != null
          ? JobCheckpointConfig.fromJson(
              json['checkpointConfig'] as Map<String, dynamic>)
          : null,
      deviceConfig: json['deviceConfig'] != null
          ? DeviceConfig.fromJson(json['deviceConfig'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['endedAt']),
      events: (json['events'] as List?)
          ?.nonNulls
          .map((e) => JobEventDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason: json['failureReason'] as String?,
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inputDataConfig: (json['inputDataConfig'] as List?)
          ?.nonNulls
          .map((e) => InputFileConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      queueInfo: json['queueInfo'] != null
          ? HybridJobQueueInfo.fromJson(
              json['queueInfo'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppingCondition: json['stoppingCondition'] != null
          ? JobStoppingCondition.fromJson(
              json['stoppingCondition'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmSpecification = this.algorithmSpecification;
    final createdAt = this.createdAt;
    final instanceConfig = this.instanceConfig;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final outputDataConfig = this.outputDataConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final associations = this.associations;
    final billableDuration = this.billableDuration;
    final checkpointConfig = this.checkpointConfig;
    final deviceConfig = this.deviceConfig;
    final endedAt = this.endedAt;
    final events = this.events;
    final failureReason = this.failureReason;
    final hyperParameters = this.hyperParameters;
    final inputDataConfig = this.inputDataConfig;
    final queueInfo = this.queueInfo;
    final startedAt = this.startedAt;
    final stoppingCondition = this.stoppingCondition;
    final tags = this.tags;
    return {
      'algorithmSpecification': algorithmSpecification,
      'createdAt': iso8601ToJson(createdAt),
      'instanceConfig': instanceConfig,
      'jobArn': jobArn,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'status': status.value,
      if (associations != null) 'associations': associations,
      if (billableDuration != null) 'billableDuration': billableDuration,
      if (checkpointConfig != null) 'checkpointConfig': checkpointConfig,
      if (deviceConfig != null) 'deviceConfig': deviceConfig,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (events != null) 'events': events,
      if (failureReason != null) 'failureReason': failureReason,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (inputDataConfig != null) 'inputDataConfig': inputDataConfig,
      if (queueInfo != null) 'queueInfo': queueInfo,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetQuantumTaskResponse {
  /// The time at which the task was created.
  final DateTime createdAt;

  /// The ARN of the device the task was run on.
  final String deviceArn;

  /// The parameters for the device on which the task ran.
  final Object deviceParameters;

  /// The S3 bucket where task results are stored.
  final String outputS3Bucket;

  /// The folder in the S3 bucket where task results are stored.
  final String outputS3Directory;

  /// The ARN of the task.
  final String quantumTaskArn;

  /// The number of shots used in the task.
  final int shots;

  /// The status of the task.
  final QuantumTaskStatus status;

  /// The list of Amazon Braket resources associated with the quantum task.
  final List<Association>? associations;

  /// The time at which the task ended.
  final DateTime? endedAt;

  /// The reason that a task failed.
  final String? failureReason;

  /// The ARN of the Amazon Braket job associated with the quantum task.
  final String? jobArn;

  /// Queue information for the requested quantum task. Only returned if
  /// <code>QueueInfo</code> is specified in the
  /// <code>additionalAttributeNames"</code> field in the
  /// <code>GetQuantumTask</code> API request.
  final QuantumTaskQueueInfo? queueInfo;

  /// The tags that belong to this task.
  final Map<String, String>? tags;

  GetQuantumTaskResponse({
    required this.createdAt,
    required this.deviceArn,
    required this.deviceParameters,
    required this.outputS3Bucket,
    required this.outputS3Directory,
    required this.quantumTaskArn,
    required this.shots,
    required this.status,
    this.associations,
    this.endedAt,
    this.failureReason,
    this.jobArn,
    this.queueInfo,
    this.tags,
  });

  factory GetQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetQuantumTaskResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deviceArn: json['deviceArn'] as String,
      deviceParameters:
          jsonDecode(json['deviceParameters'] as String) as Object,
      outputS3Bucket: json['outputS3Bucket'] as String,
      outputS3Directory: json['outputS3Directory'] as String,
      quantumTaskArn: json['quantumTaskArn'] as String,
      shots: json['shots'] as int,
      status: QuantumTaskStatus.fromString((json['status'] as String)),
      associations: (json['associations'] as List?)
          ?.nonNulls
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      endedAt: timeStampFromJson(json['endedAt']),
      failureReason: json['failureReason'] as String?,
      jobArn: json['jobArn'] as String?,
      queueInfo: json['queueInfo'] != null
          ? QuantumTaskQueueInfo.fromJson(
              json['queueInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceArn = this.deviceArn;
    final deviceParameters = this.deviceParameters;
    final outputS3Bucket = this.outputS3Bucket;
    final outputS3Directory = this.outputS3Directory;
    final quantumTaskArn = this.quantumTaskArn;
    final shots = this.shots;
    final status = this.status;
    final associations = this.associations;
    final endedAt = this.endedAt;
    final failureReason = this.failureReason;
    final jobArn = this.jobArn;
    final queueInfo = this.queueInfo;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'deviceParameters': jsonEncode(deviceParameters),
      'outputS3Bucket': outputS3Bucket,
      'outputS3Directory': outputS3Directory,
      'quantumTaskArn': quantumTaskArn,
      'shots': shots,
      'status': status.value,
      if (associations != null) 'associations': associations,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureReason != null) 'failureReason': failureReason,
      if (jobArn != null) 'jobArn': jobArn,
      if (queueInfo != null) 'queueInfo': queueInfo,
      if (tags != null) 'tags': tags,
    };
  }
}

enum HybridJobAdditionalAttributeName {
  queueInfo('QueueInfo'),
  ;

  final String value;

  const HybridJobAdditionalAttributeName(this.value);

  static HybridJobAdditionalAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum HybridJobAdditionalAttributeName'));
}

/// Information about the queue for a specified job.
class HybridJobQueueInfo {
  /// Current position of the job in the jobs queue.
  final String position;

  /// The name of the queue.
  final QueueName queue;

  /// Optional. Provides more information about the queue position. For example,
  /// if the job is complete and no longer in the queue, the message field
  /// contains that information.
  final String? message;

  HybridJobQueueInfo({
    required this.position,
    required this.queue,
    this.message,
  });

  factory HybridJobQueueInfo.fromJson(Map<String, dynamic> json) {
    return HybridJobQueueInfo(
      position: json['position'] as String,
      queue: QueueName.fromString((json['queue'] as String)),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final queue = this.queue;
    final message = this.message;
    return {
      'position': position,
      'queue': queue.value,
      if (message != null) 'message': message,
    };
  }
}

/// A list of parameters that specify the input channels, type of input data,
/// and where it is located.
class InputFileConfig {
  /// A named input source that an Amazon Braket job can consume.
  final String channelName;

  /// The location of the channel data.
  final DataSource dataSource;

  /// The MIME type of the data.
  final String? contentType;

  InputFileConfig({
    required this.channelName,
    required this.dataSource,
    this.contentType,
  });

  factory InputFileConfig.fromJson(Map<String, dynamic> json) {
    return InputFileConfig(
      channelName: json['channelName'] as String,
      dataSource:
          DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
      contentType: json['contentType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final dataSource = this.dataSource;
    final contentType = this.contentType;
    return {
      'channelName': channelName,
      'dataSource': dataSource,
      if (contentType != null) 'contentType': contentType,
    };
  }
}

/// Configures the resource instances to use while running the Amazon Braket
/// hybrid job on Amazon Braket.
class InstanceConfig {
  /// Configures the type resource instances to use while running an Amazon Braket
  /// hybrid job.
  final InstanceType instanceType;

  /// The size of the storage volume, in GB, that user wants to provision.
  final int volumeSizeInGb;

  /// Configures the number of resource instances to use while running an Amazon
  /// Braket job on Amazon Braket. The default value is 1.
  final int? instanceCount;

  InstanceConfig({
    required this.instanceType,
    required this.volumeSizeInGb,
    this.instanceCount,
  });

  factory InstanceConfig.fromJson(Map<String, dynamic> json) {
    return InstanceConfig(
      instanceType: InstanceType.fromString((json['instanceType'] as String)),
      volumeSizeInGb: json['volumeSizeInGb'] as int,
      instanceCount: json['instanceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final volumeSizeInGb = this.volumeSizeInGb;
    final instanceCount = this.instanceCount;
    return {
      'instanceType': instanceType.value,
      'volumeSizeInGb': volumeSizeInGb,
      if (instanceCount != null) 'instanceCount': instanceCount,
    };
  }
}

enum InstanceType {
  mlM4Xlarge('ml.m4.xlarge'),
  mlM4_2xlarge('ml.m4.2xlarge'),
  mlM4_4xlarge('ml.m4.4xlarge'),
  mlM4_10xlarge('ml.m4.10xlarge'),
  mlM4_16xlarge('ml.m4.16xlarge'),
  mlG4dnXlarge('ml.g4dn.xlarge'),
  mlG4dn_2xlarge('ml.g4dn.2xlarge'),
  mlG4dn_4xlarge('ml.g4dn.4xlarge'),
  mlG4dn_8xlarge('ml.g4dn.8xlarge'),
  mlG4dn_12xlarge('ml.g4dn.12xlarge'),
  mlG4dn_16xlarge('ml.g4dn.16xlarge'),
  mlM5Large('ml.m5.large'),
  mlM5Xlarge('ml.m5.xlarge'),
  mlM5_2xlarge('ml.m5.2xlarge'),
  mlM5_4xlarge('ml.m5.4xlarge'),
  mlM5_12xlarge('ml.m5.12xlarge'),
  mlM5_24xlarge('ml.m5.24xlarge'),
  mlC4Xlarge('ml.c4.xlarge'),
  mlC4_2xlarge('ml.c4.2xlarge'),
  mlC4_4xlarge('ml.c4.4xlarge'),
  mlC4_8xlarge('ml.c4.8xlarge'),
  mlP2Xlarge('ml.p2.xlarge'),
  mlP2_8xlarge('ml.p2.8xlarge'),
  mlP2_16xlarge('ml.p2.16xlarge'),
  mlP3_2xlarge('ml.p3.2xlarge'),
  mlP3_8xlarge('ml.p3.8xlarge'),
  mlP3_16xlarge('ml.p3.16xlarge'),
  mlP3dn_24xlarge('ml.p3dn.24xlarge'),
  mlP4d_24xlarge('ml.p4d.24xlarge'),
  mlC5Xlarge('ml.c5.xlarge'),
  mlC5_2xlarge('ml.c5.2xlarge'),
  mlC5_4xlarge('ml.c5.4xlarge'),
  mlC5_9xlarge('ml.c5.9xlarge'),
  mlC5_18xlarge('ml.c5.18xlarge'),
  mlC5nXlarge('ml.c5n.xlarge'),
  mlC5n_2xlarge('ml.c5n.2xlarge'),
  mlC5n_4xlarge('ml.c5n.4xlarge'),
  mlC5n_9xlarge('ml.c5n.9xlarge'),
  mlC5n_18xlarge('ml.c5n.18xlarge'),
  ;

  final String value;

  const InstanceType(this.value);

  static InstanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InstanceType'));
}

/// Contains information about the output locations for job checkpoint data.
class JobCheckpointConfig {
  /// Identifies the S3 path where you want Amazon Braket to store checkpoints.
  /// For example, <code>s3://bucket-name/key-name-prefix</code>.
  final String s3Uri;

  /// (Optional) The local directory where checkpoints are written. The default
  /// directory is <code>/opt/braket/checkpoints/</code>.
  final String? localPath;

  JobCheckpointConfig({
    required this.s3Uri,
    this.localPath,
  });

  factory JobCheckpointConfig.fromJson(Map<String, dynamic> json) {
    return JobCheckpointConfig(
      s3Uri: json['s3Uri'] as String,
      localPath: json['localPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final localPath = this.localPath;
    return {
      's3Uri': s3Uri,
      if (localPath != null) 'localPath': localPath,
    };
  }
}

/// Details about the type and time events occurred related to the Amazon Braket
/// job.
class JobEventDetails {
  /// The type of event that occurred related to the Amazon Braket job.
  final JobEventType? eventType;

  /// A message describing the event that occurred related to the Amazon Braket
  /// job.
  final String? message;

  /// The type of event that occurred related to the Amazon Braket job.
  final DateTime? timeOfEvent;

  JobEventDetails({
    this.eventType,
    this.message,
    this.timeOfEvent,
  });

  factory JobEventDetails.fromJson(Map<String, dynamic> json) {
    return JobEventDetails(
      eventType: (json['eventType'] as String?)?.let(JobEventType.fromString),
      message: json['message'] as String?,
      timeOfEvent: timeStampFromJson(json['timeOfEvent']),
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final message = this.message;
    final timeOfEvent = this.timeOfEvent;
    return {
      if (eventType != null) 'eventType': eventType.value,
      if (message != null) 'message': message,
      if (timeOfEvent != null) 'timeOfEvent': iso8601ToJson(timeOfEvent),
    };
  }
}

enum JobEventType {
  waitingForPriority('WAITING_FOR_PRIORITY'),
  queuedForExecution('QUEUED_FOR_EXECUTION'),
  startingInstance('STARTING_INSTANCE'),
  downloadingData('DOWNLOADING_DATA'),
  running('RUNNING'),
  deprioritizedDueToInactivity('DEPRIORITIZED_DUE_TO_INACTIVITY'),
  uploadingResults('UPLOADING_RESULTS'),
  completed('COMPLETED'),
  failed('FAILED'),
  maxRuntimeExceeded('MAX_RUNTIME_EXCEEDED'),
  cancelled('CANCELLED'),
  ;

  final String value;

  const JobEventType(this.value);

  static JobEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum JobEventType'));
}

/// Specifies the path to the S3 location where you want to store job artifacts
/// and the encryption key used to store them.
class JobOutputDataConfig {
  /// Identifies the S3 path where you want Amazon Braket to store the job
  /// training artifacts. For example,
  /// <code>s3://bucket-name/key-name-prefix</code>.
  final String s3Path;

  /// The AWS Key Management Service (AWS KMS) key that Amazon Braket uses to
  /// encrypt the job training artifacts at rest using Amazon S3 server-side
  /// encryption.
  final String? kmsKeyId;

  JobOutputDataConfig({
    required this.s3Path,
    this.kmsKeyId,
  });

  factory JobOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return JobOutputDataConfig(
      s3Path: json['s3Path'] as String,
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Path = this.s3Path;
    final kmsKeyId = this.kmsKeyId;
    return {
      's3Path': s3Path,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

enum JobPrimaryStatus {
  queued('QUEUED'),
  running('RUNNING'),
  completed('COMPLETED'),
  failed('FAILED'),
  cancelling('CANCELLING'),
  cancelled('CANCELLED'),
  ;

  final String value;

  const JobPrimaryStatus(this.value);

  static JobPrimaryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum JobPrimaryStatus'));
}

/// Specifies limits for how long an Amazon Braket job can run.
class JobStoppingCondition {
  /// The maximum length of time, in seconds, that an Amazon Braket job can run.
  final int? maxRuntimeInSeconds;

  JobStoppingCondition({
    this.maxRuntimeInSeconds,
  });

  factory JobStoppingCondition.fromJson(Map<String, dynamic> json) {
    return JobStoppingCondition(
      maxRuntimeInSeconds: json['maxRuntimeInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRuntimeInSeconds = this.maxRuntimeInSeconds;
    return {
      if (maxRuntimeInSeconds != null)
        'maxRuntimeInSeconds': maxRuntimeInSeconds,
    };
  }
}

/// Provides summary information about an Amazon Braket job.
class JobSummary {
  /// The date and time that the Amazon Braket job was created.
  final DateTime createdAt;

  /// Provides summary information about the primary device used by an Amazon
  /// Braket job.
  final String device;

  /// The ARN of the Amazon Braket job.
  final String jobArn;

  /// The name of the Amazon Braket job.
  final String jobName;

  /// The status of the Amazon Braket job.
  final JobPrimaryStatus status;

  /// The date and time that the Amazon Braket job ended.
  final DateTime? endedAt;

  /// The date and time that the Amazon Braket job was started.
  final DateTime? startedAt;

  /// A tag object that consists of a key and an optional value, used to manage
  /// metadata for Amazon Braket resources.
  final Map<String, String>? tags;

  JobSummary({
    required this.createdAt,
    required this.device,
    required this.jobArn,
    required this.jobName,
    required this.status,
    this.endedAt,
    this.startedAt,
    this.tags,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      device: json['device'] as String,
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      status: JobPrimaryStatus.fromString((json['status'] as String)),
      endedAt: timeStampFromJson(json['endedAt']),
      startedAt: timeStampFromJson(json['startedAt']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final device = this.device;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final status = this.status;
    final endedAt = this.endedAt;
    final startedAt = this.startedAt;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'device': device,
      'jobArn': jobArn,
      'jobName': jobName,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTagsForResourceResponse {
  /// Displays the key, value pairs of tags associated with this resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum QuantumTaskAdditionalAttributeName {
  queueInfo('QueueInfo'),
  ;

  final String value;

  const QuantumTaskAdditionalAttributeName(this.value);

  static QuantumTaskAdditionalAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum QuantumTaskAdditionalAttributeName'));
}

/// Information about the queue for the specified quantum task.
class QuantumTaskQueueInfo {
  /// Current position of the task in the quantum tasks queue.
  final String position;

  /// The name of the queue.
  final QueueName queue;

  /// Optional. Provides more information about the queue position. For example,
  /// if the task is complete and no longer in the queue, the message field
  /// contains that information.
  final String? message;

  /// Optional. Specifies the priority of the queue. Quantum tasks in a priority
  /// queue are processed before the tasks in a normal queue.
  final QueuePriority? queuePriority;

  QuantumTaskQueueInfo({
    required this.position,
    required this.queue,
    this.message,
    this.queuePriority,
  });

  factory QuantumTaskQueueInfo.fromJson(Map<String, dynamic> json) {
    return QuantumTaskQueueInfo(
      position: json['position'] as String,
      queue: QueueName.fromString((json['queue'] as String)),
      message: json['message'] as String?,
      queuePriority:
          (json['queuePriority'] as String?)?.let(QueuePriority.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final queue = this.queue;
    final message = this.message;
    final queuePriority = this.queuePriority;
    return {
      'position': position,
      'queue': queue.value,
      if (message != null) 'message': message,
      if (queuePriority != null) 'queuePriority': queuePriority.value,
    };
  }
}

enum QuantumTaskStatus {
  created('CREATED'),
  queued('QUEUED'),
  running('RUNNING'),
  completed('COMPLETED'),
  failed('FAILED'),
  cancelling('CANCELLING'),
  cancelled('CANCELLED'),
  ;

  final String value;

  const QuantumTaskStatus(this.value);

  static QuantumTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum QuantumTaskStatus'));
}

/// Includes information about a quantum task.
class QuantumTaskSummary {
  /// The time at which the task was created.
  final DateTime createdAt;

  /// The ARN of the device the task ran on.
  final String deviceArn;

  /// The S3 bucket where the task result file is stored..
  final String outputS3Bucket;

  /// The folder in the S3 bucket where the task result file is stored.
  final String outputS3Directory;

  /// The ARN of the task.
  final String quantumTaskArn;

  /// The shots used for the task.
  final int shots;

  /// The status of the task.
  final QuantumTaskStatus status;

  /// The time at which the task finished.
  final DateTime? endedAt;

  /// Displays the key, value pairs of tags associated with this quantum task.
  final Map<String, String>? tags;

  QuantumTaskSummary({
    required this.createdAt,
    required this.deviceArn,
    required this.outputS3Bucket,
    required this.outputS3Directory,
    required this.quantumTaskArn,
    required this.shots,
    required this.status,
    this.endedAt,
    this.tags,
  });

  factory QuantumTaskSummary.fromJson(Map<String, dynamic> json) {
    return QuantumTaskSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      deviceArn: json['deviceArn'] as String,
      outputS3Bucket: json['outputS3Bucket'] as String,
      outputS3Directory: json['outputS3Directory'] as String,
      quantumTaskArn: json['quantumTaskArn'] as String,
      shots: json['shots'] as int,
      status: QuantumTaskStatus.fromString((json['status'] as String)),
      endedAt: timeStampFromJson(json['endedAt']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceArn = this.deviceArn;
    final outputS3Bucket = this.outputS3Bucket;
    final outputS3Directory = this.outputS3Directory;
    final quantumTaskArn = this.quantumTaskArn;
    final shots = this.shots;
    final status = this.status;
    final endedAt = this.endedAt;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3Directory': outputS3Directory,
      'quantumTaskArn': quantumTaskArn,
      'shots': shots,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

enum QueueName {
  quantumTasksQueue('QUANTUM_TASKS_QUEUE'),
  jobsQueue('JOBS_QUEUE'),
  ;

  final String value;

  const QueueName(this.value);

  static QueueName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum QueueName'));
}

enum QueuePriority {
  normal('Normal'),
  priority('Priority'),
  ;

  final String value;

  const QueuePriority(this.value);

  static QueuePriority fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum QueuePriority'));
}

/// Information about the data stored in Amazon S3 used by the Amazon Braket
/// job.
class S3DataSource {
  /// Depending on the value specified for the <code>S3DataType</code>, identifies
  /// either a key name prefix or a manifest that locates the S3 data source.
  final String s3Uri;

  S3DataSource({
    required this.s3Uri,
  });

  factory S3DataSource.fromJson(Map<String, dynamic> json) {
    return S3DataSource(
      s3Uri: json['s3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

/// Contains information about the Python scripts used for entry and by an
/// Amazon Braket job.
class ScriptModeConfig {
  /// The path to the Python script that serves as the entry point for an Amazon
  /// Braket job.
  final String entryPoint;

  /// The URI that specifies the S3 path to the Python script module that contains
  /// the training script used by an Amazon Braket job.
  final String s3Uri;

  /// The type of compression used by the Python scripts for an Amazon Braket job.
  final CompressionType? compressionType;

  ScriptModeConfig({
    required this.entryPoint,
    required this.s3Uri,
    this.compressionType,
  });

  factory ScriptModeConfig.fromJson(Map<String, dynamic> json) {
    return ScriptModeConfig(
      entryPoint: json['entryPoint'] as String,
      s3Uri: json['s3Uri'] as String,
      compressionType:
          (json['compressionType'] as String?)?.let(CompressionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final s3Uri = this.s3Uri;
    final compressionType = this.compressionType;
    return {
      'entryPoint': entryPoint,
      's3Uri': s3Uri,
      if (compressionType != null) 'compressionType': compressionType.value,
    };
  }
}

/// The filter to use for searching devices.
class SearchDevicesFilter {
  /// The name to use to filter results.
  final String name;

  /// The values to use to filter results.
  final List<String> values;

  SearchDevicesFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

class SearchDevicesResponse {
  /// An array of <code>DeviceSummary</code> objects for devices that match the
  /// specified filter values.
  final List<DeviceSummary> devices;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue results
  /// where the previous request ended.
  final String? nextToken;

  SearchDevicesResponse({
    required this.devices,
    this.nextToken,
  });

  factory SearchDevicesResponse.fromJson(Map<String, dynamic> json) {
    return SearchDevicesResponse(
      devices: (json['devices'] as List)
          .nonNulls
          .map((e) => DeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      'devices': devices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A filter used to search for Amazon Braket jobs.
class SearchJobsFilter {
  /// The name to use for the jobs filter.
  final String name;

  /// An operator to use for the jobs filter.
  final SearchJobsFilterOperator operator;

  /// The values to use for the jobs filter.
  final List<String> values;

  SearchJobsFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

enum SearchJobsFilterOperator {
  lt('LT'),
  lte('LTE'),
  equal('EQUAL'),
  gt('GT'),
  gte('GTE'),
  between('BETWEEN'),
  contains('CONTAINS'),
  ;

  final String value;

  const SearchJobsFilterOperator(this.value);

  static SearchJobsFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SearchJobsFilterOperator'));
}

class SearchJobsResponse {
  /// An array of <code>JobSummary</code> objects for devices that match the
  /// specified filter values.
  final List<JobSummary> jobs;

  /// A token used for pagination of results, or <code>null</code> if there are no
  /// additional results. Use the token value in a subsequent request to continue
  /// results where the previous request ended.
  final String? nextToken;

  SearchJobsResponse({
    required this.jobs,
    this.nextToken,
  });

  factory SearchJobsResponse.fromJson(Map<String, dynamic> json) {
    return SearchJobsResponse(
      jobs: (json['jobs'] as List)
          .nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A filter to use to search for tasks.
class SearchQuantumTasksFilter {
  /// The name of the device used for the task.
  final String name;

  /// An operator to use in the filter.
  final SearchQuantumTasksFilterOperator operator;

  /// The values to use for the filter.
  final List<String> values;

  SearchQuantumTasksFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

enum SearchQuantumTasksFilterOperator {
  lt('LT'),
  lte('LTE'),
  equal('EQUAL'),
  gt('GT'),
  gte('GTE'),
  between('BETWEEN'),
  ;

  final String value;

  const SearchQuantumTasksFilterOperator(this.value);

  static SearchQuantumTasksFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SearchQuantumTasksFilterOperator'));
}

class SearchQuantumTasksResponse {
  /// An array of <code>QuantumTaskSummary</code> objects for tasks that match the
  /// specified filters.
  final List<QuantumTaskSummary> quantumTasks;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue results
  /// where the previous request ended.
  final String? nextToken;

  SearchQuantumTasksResponse({
    required this.quantumTasks,
    this.nextToken,
  });

  factory SearchQuantumTasksResponse.fromJson(Map<String, dynamic> json) {
    return SearchQuantumTasksResponse(
      quantumTasks: (json['quantumTasks'] as List)
          .nonNulls
          .map((e) => QuantumTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final quantumTasks = this.quantumTasks;
    final nextToken = this.nextToken;
    return {
      'quantumTasks': quantumTasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeviceOfflineException extends _s.GenericAwsException {
  DeviceOfflineException({String? type, String? message})
      : super(type: type, code: 'DeviceOfflineException', message: message);
}

class DeviceRetiredException extends _s.GenericAwsException {
  DeviceRetiredException({String? type, String? message})
      : super(type: type, code: 'DeviceRetiredException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
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
  'DeviceOfflineException': (type, message) =>
      DeviceOfflineException(type: type, message: message),
  'DeviceRetiredException': (type, message) =>
      DeviceRetiredException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
