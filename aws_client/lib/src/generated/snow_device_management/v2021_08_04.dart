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

import 'v2021_08_04.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Web Services Snow Device Management documentation.
class SnowDeviceManagement {
  final _s.RestJsonProtocol _protocol;
  factory SnowDeviceManagement({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'snow-device-management',
    );
    return SnowDeviceManagement._(
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
  SnowDeviceManagement._({
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

  /// Returns a list of tags for a managed device or task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the device or task.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds or replaces tags on a device or task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the device or task.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from a device or task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the device or task.
  ///
  /// Parameter [tagKeys] :
  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Checks device-specific information, such as the device type, software
  /// version, IP addresses, and lock status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedDeviceId] :
  /// The ID of the device that you are checking the information of.
  Future<DescribeDeviceOutput> describeDevice({
    required String managedDeviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/managed-device/${Uri.encodeComponent(managedDeviceId)}/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceOutput.fromJson(response);
  }

  /// Returns a list of all devices on your Amazon Web Services account that
  /// have Amazon Web Services Snow Device Management enabled in the Amazon Web
  /// Services Region where the command is run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job used to order the device.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of devices to list per page.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to continue to the next page of results.
  Future<ListDevicesOutput> listDevices({
    String? jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (jobId != null) 'jobId': [jobId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesOutput.fromJson(response);
  }

  /// Checks the current state of the Amazon EC2 instances. The output is
  /// similar to <code>describeDevice</code>, but the results are sourced from
  /// the device cache in the Amazon Web Services Cloud and include a subset of
  /// the available fields.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceIds] :
  /// A list of instance IDs associated with the managed device.
  ///
  /// Parameter [managedDeviceId] :
  /// The ID of the managed device.
  Future<DescribeDeviceEc2Output> describeDeviceEc2Instances({
    required List<String> instanceIds,
    required String managedDeviceId,
  }) async {
    final $payload = <String, dynamic>{
      'instanceIds': instanceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/managed-device/${Uri.encodeComponent(managedDeviceId)}/resources/ec2/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceEc2Output.fromJson(response);
  }

  /// Returns a list of the Amazon Web Services resources available for a
  /// device. Currently, Amazon EC2 instances are the only supported resource
  /// type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedDeviceId] :
  /// The ID of the managed device that you are listing the resources of.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resources per page.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to continue to the next page of results.
  ///
  /// Parameter [type] :
  /// A structure used to filter the results by type of resource.
  Future<ListDeviceResourcesOutput> listDeviceResources({
    required String managedDeviceId,
    int? maxResults,
    String? nextToken,
    String? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (type != null) 'type': [type],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-device/${Uri.encodeComponent(managedDeviceId)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceResourcesOutput.fromJson(response);
  }

  /// Instructs one or more devices to start a task, such as unlocking or
  /// rebooting.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [command] :
  /// The task to be performed. Only one task is executed on a device at a time.
  ///
  /// Parameter [targets] :
  /// A list of managed device IDs.
  ///
  /// Parameter [clientToken] :
  /// A token ensuring that the action is called only once with the specified
  /// details.
  ///
  /// Parameter [description] :
  /// A description of the task and its targets.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  Future<CreateTaskOutput> createTask({
    required Command command,
    required List<String> targets,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'command': command,
      'targets': targets,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/task',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTaskOutput.fromJson(response);
  }

  /// Checks the metadata for a given task on a device.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskId] :
  /// The ID of the task to be described.
  Future<DescribeTaskOutput> describeTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/task/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTaskOutput.fromJson(response);
  }

  /// Returns a list of tasks that can be filtered by state.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tasks per page.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to continue to the next page of tasks.
  ///
  /// Parameter [state] :
  /// A structure used to filter the list of tasks.
  Future<ListTasksOutput> listTasks({
    int? maxResults,
    String? nextToken,
    TaskState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (state != null) 'state': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTasksOutput.fromJson(response);
  }

  /// Sends a cancel request for a specified task. You can cancel a task only if
  /// it's still in a <code>QUEUED</code> state. Tasks that are already running
  /// can't be cancelled.
  /// <note>
  /// A task might still run if it's processed from the queue before the
  /// <code>CancelTask</code> operation changes the task's state.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskId] :
  /// The ID of the task that you are attempting to cancel. You can retrieve a
  /// task ID by using the <code>ListTasks</code> operation.
  Future<CancelTaskOutput> cancelTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/task/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelTaskOutput.fromJson(response);
  }

  /// Checks the status of a remote task running on one or more target devices.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedDeviceId] :
  /// The ID of the managed device.
  ///
  /// Parameter [taskId] :
  /// The ID of the task that the action is describing.
  Future<DescribeExecutionOutput> describeExecution({
    required String managedDeviceId,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/task/${Uri.encodeComponent(taskId)}/execution/${Uri.encodeComponent(managedDeviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeExecutionOutput.fromJson(response);
  }

  /// Returns the status of tasks for one or more target devices.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskId] :
  /// The ID of the task.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tasks to list per page.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to continue to the next page of tasks.
  ///
  /// Parameter [state] :
  /// A structure used to filter the tasks by their current state.
  Future<ListExecutionsOutput> listExecutions({
    required String taskId,
    int? maxResults,
    String? nextToken,
    ExecutionState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'taskId': [taskId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (state != null) 'state': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExecutionsOutput.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The list of tags for the device or task.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// @nodoc
class DescribeDeviceOutput {
  /// The ID of the job used when ordering the device.
  final String? associatedWithJob;

  /// The hardware specifications of the device.
  final List<Capacity>? deviceCapacities;

  /// The current state of the device.
  final UnlockState? deviceState;

  /// The type of Amazon Web Services Snow Family device.
  final String? deviceType;

  /// When the device last contacted the Amazon Web Services Cloud. Indicates that
  /// the device is online.
  final DateTime? lastReachedOutAt;

  /// When the device last pushed an update to the Amazon Web Services Cloud.
  /// Indicates when the device cache was refreshed.
  final DateTime? lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the device.
  final String? managedDeviceArn;

  /// The ID of the device that you checked the information for.
  final String? managedDeviceId;

  /// The network interfaces available on the device.
  final List<PhysicalNetworkInterface>? physicalNetworkInterfaces;

  /// The software installed on the device.
  final SoftwareInformation? software;

  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  final Map<String, String>? tags;

  DescribeDeviceOutput({
    this.associatedWithJob,
    this.deviceCapacities,
    this.deviceState,
    this.deviceType,
    this.lastReachedOutAt,
    this.lastUpdatedAt,
    this.managedDeviceArn,
    this.managedDeviceId,
    this.physicalNetworkInterfaces,
    this.software,
    this.tags,
  });

  factory DescribeDeviceOutput.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceOutput(
      associatedWithJob: json['associatedWithJob'] as String?,
      deviceCapacities: (json['deviceCapacities'] as List?)
          ?.nonNulls
          .map((e) => Capacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceState:
          (json['deviceState'] as String?)?.let(UnlockState.fromString),
      deviceType: json['deviceType'] as String?,
      lastReachedOutAt: timeStampFromJson(json['lastReachedOutAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      managedDeviceArn: json['managedDeviceArn'] as String?,
      managedDeviceId: json['managedDeviceId'] as String?,
      physicalNetworkInterfaces: (json['physicalNetworkInterfaces'] as List?)
          ?.nonNulls
          .map((e) =>
              PhysicalNetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      software: json['software'] != null
          ? SoftwareInformation.fromJson(
              json['software'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedWithJob = this.associatedWithJob;
    final deviceCapacities = this.deviceCapacities;
    final deviceState = this.deviceState;
    final deviceType = this.deviceType;
    final lastReachedOutAt = this.lastReachedOutAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final managedDeviceArn = this.managedDeviceArn;
    final managedDeviceId = this.managedDeviceId;
    final physicalNetworkInterfaces = this.physicalNetworkInterfaces;
    final software = this.software;
    final tags = this.tags;
    return {
      if (associatedWithJob != null) 'associatedWithJob': associatedWithJob,
      if (deviceCapacities != null) 'deviceCapacities': deviceCapacities,
      if (deviceState != null) 'deviceState': deviceState.value,
      if (deviceType != null) 'deviceType': deviceType,
      if (lastReachedOutAt != null)
        'lastReachedOutAt': unixTimestampToJson(lastReachedOutAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (managedDeviceArn != null) 'managedDeviceArn': managedDeviceArn,
      if (managedDeviceId != null) 'managedDeviceId': managedDeviceId,
      if (physicalNetworkInterfaces != null)
        'physicalNetworkInterfaces': physicalNetworkInterfaces,
      if (software != null) 'software': software,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListDevicesOutput {
  /// A list of device structures that contain information about the device.
  final List<DeviceSummary>? devices;

  /// A pagination token to continue to the next page of devices.
  final String? nextToken;

  ListDevicesOutput({
    this.devices,
    this.nextToken,
  });

  factory ListDevicesOutput.fromJson(Map<String, dynamic> json) {
    return ListDevicesOutput(
      devices: (json['devices'] as List?)
          ?.nonNulls
          .map((e) => DeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      if (devices != null) 'devices': devices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DescribeDeviceEc2Output {
  /// A list of structures containing information about each instance.
  final List<InstanceSummary>? instances;

  DescribeDeviceEc2Output({
    this.instances,
  });

  factory DescribeDeviceEc2Output.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceEc2Output(
      instances: (json['instances'] as List?)
          ?.nonNulls
          .map((e) => InstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    return {
      if (instances != null) 'instances': instances,
    };
  }
}

/// @nodoc
class ListDeviceResourcesOutput {
  /// A pagination token to continue to the next page of results.
  final String? nextToken;

  /// A structure defining the resource's type, Amazon Resource Name (ARN), and
  /// ID.
  final List<ResourceSummary>? resources;

  ListDeviceResourcesOutput({
    this.nextToken,
    this.resources,
  });

  factory ListDeviceResourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListDeviceResourcesOutput(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => ResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

/// @nodoc
class CreateTaskOutput {
  /// The Amazon Resource Name (ARN) of the task that you created.
  final String? taskArn;

  /// The ID of the task that you created.
  final String? taskId;

  CreateTaskOutput({
    this.taskArn,
    this.taskId,
  });

  factory CreateTaskOutput.fromJson(Map<String, dynamic> json) {
    return CreateTaskOutput(
      taskArn: json['taskArn'] as String?,
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    return {
      if (taskArn != null) 'taskArn': taskArn,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class DescribeTaskOutput {
  /// When the task was completed.
  final DateTime? completedAt;

  /// When the <code>CreateTask</code> operation was called.
  final DateTime? createdAt;

  /// The description provided of the task and managed devices.
  final String? description;

  /// When the state of the task was last updated.
  final DateTime? lastUpdatedAt;

  /// The current state of the task.
  final TaskState? state;

  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  final Map<String, String>? tags;

  /// The managed devices that the task was sent to.
  final List<String>? targets;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  /// The ID of the task.
  final String? taskId;

  DescribeTaskOutput({
    this.completedAt,
    this.createdAt,
    this.description,
    this.lastUpdatedAt,
    this.state,
    this.tags,
    this.targets,
    this.taskArn,
    this.taskId,
  });

  factory DescribeTaskOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTaskOutput(
      completedAt: timeStampFromJson(json['completedAt']),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      state: (json['state'] as String?)?.let(TaskState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets:
          (json['targets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      taskArn: json['taskArn'] as String?,
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final state = this.state;
    final tags = this.tags;
    final targets = this.targets;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    return {
      if (completedAt != null) 'completedAt': unixTimestampToJson(completedAt),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (state != null) 'state': state.value,
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
      if (taskArn != null) 'taskArn': taskArn,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class ListTasksOutput {
  /// A pagination token to continue to the next page of tasks.
  final String? nextToken;

  /// A list of task structures containing details about each task.
  final List<TaskSummary>? tasks;

  ListTasksOutput({
    this.nextToken,
    this.tasks,
  });

  factory ListTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListTasksOutput(
      nextToken: json['nextToken'] as String?,
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tasks = this.tasks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

/// @nodoc
class CancelTaskOutput {
  /// The ID of the task that you are attempting to cancel.
  final String? taskId;

  CancelTaskOutput({
    this.taskId,
  });

  factory CancelTaskOutput.fromJson(Map<String, dynamic> json) {
    return CancelTaskOutput(
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    return {
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class DescribeExecutionOutput {
  /// The ID of the execution.
  final String? executionId;

  /// When the status of the execution was last updated.
  final DateTime? lastUpdatedAt;

  /// The ID of the managed device that the task is being executed on.
  final String? managedDeviceId;

  /// When the execution began.
  final DateTime? startedAt;

  /// The current state of the execution.
  final ExecutionState? state;

  /// The ID of the task being executed on the device.
  final String? taskId;

  DescribeExecutionOutput({
    this.executionId,
    this.lastUpdatedAt,
    this.managedDeviceId,
    this.startedAt,
    this.state,
    this.taskId,
  });

  factory DescribeExecutionOutput.fromJson(Map<String, dynamic> json) {
    return DescribeExecutionOutput(
      executionId: json['executionId'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      managedDeviceId: json['managedDeviceId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      state: (json['state'] as String?)?.let(ExecutionState.fromString),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final managedDeviceId = this.managedDeviceId;
    final startedAt = this.startedAt;
    final state = this.state;
    final taskId = this.taskId;
    return {
      if (executionId != null) 'executionId': executionId,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (managedDeviceId != null) 'managedDeviceId': managedDeviceId,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (state != null) 'state': state.value,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class ListExecutionsOutput {
  /// A list of executions. Each execution contains the task ID, the device that
  /// the task is executing on, the execution ID, and the status of the execution.
  final List<ExecutionSummary>? executions;

  /// A pagination token to continue to the next page of executions.
  final String? nextToken;

  ListExecutionsOutput({
    this.executions,
    this.nextToken,
  });

  factory ListExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListExecutionsOutput(
      executions: (json['executions'] as List?)
          ?.nonNulls
          .map((e) => ExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executions = this.executions;
    final nextToken = this.nextToken;
    return {
      if (executions != null) 'executions': executions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The summary of a task execution on a specified device.
///
/// @nodoc
class ExecutionSummary {
  /// The ID of the execution.
  final String? executionId;

  /// The ID of the managed device that the task is being executed on.
  final String? managedDeviceId;

  /// The state of the execution.
  final ExecutionState? state;

  /// The ID of the task.
  final String? taskId;

  ExecutionSummary({
    this.executionId,
    this.managedDeviceId,
    this.state,
    this.taskId,
  });

  factory ExecutionSummary.fromJson(Map<String, dynamic> json) {
    return ExecutionSummary(
      executionId: json['executionId'] as String?,
      managedDeviceId: json['managedDeviceId'] as String?,
      state: (json['state'] as String?)?.let(ExecutionState.fromString),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final managedDeviceId = this.managedDeviceId;
    final state = this.state;
    final taskId = this.taskId;
    return {
      if (executionId != null) 'executionId': executionId,
      if (managedDeviceId != null) 'managedDeviceId': managedDeviceId,
      if (state != null) 'state': state.value,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class ExecutionState {
  static const queued = ExecutionState._('QUEUED');
  static const inProgress = ExecutionState._('IN_PROGRESS');
  static const canceled = ExecutionState._('CANCELED');
  static const failed = ExecutionState._('FAILED');
  static const succeeded = ExecutionState._('SUCCEEDED');
  static const rejected = ExecutionState._('REJECTED');
  static const timedOut = ExecutionState._('TIMED_OUT');

  final String value;

  const ExecutionState._(this.value);

  static const values = [
    queued,
    inProgress,
    canceled,
    failed,
    succeeded,
    rejected,
    timedOut
  ];

  static ExecutionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionState._(value));

  @override
  bool operator ==(other) => other is ExecutionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the task assigned to one or many devices.
///
/// @nodoc
class TaskSummary {
  /// The task ID.
  final String taskId;

  /// The state of the task assigned to one or many devices.
  final TaskState? state;

  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  TaskSummary({
    required this.taskId,
    this.state,
    this.tags,
    this.taskArn,
  });

  factory TaskSummary.fromJson(Map<String, dynamic> json) {
    return TaskSummary(
      taskId: (json['taskId'] as String?) ?? '',
      state: (json['state'] as String?)?.let(TaskState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    final state = this.state;
    final tags = this.tags;
    final taskArn = this.taskArn;
    return {
      'taskId': taskId,
      if (state != null) 'state': state.value,
      if (tags != null) 'tags': tags,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// @nodoc
class TaskState {
  static const inProgress = TaskState._('IN_PROGRESS');
  static const canceled = TaskState._('CANCELED');
  static const completed = TaskState._('COMPLETED');

  final String value;

  const TaskState._(this.value);

  static const values = [inProgress, canceled, completed];

  static TaskState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskState._(value));

  @override
  bool operator ==(other) => other is TaskState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The command given to the device to execute.
///
/// @nodoc
class Command {
  /// Reboots the device.
  final Reboot? reboot;

  /// Unlocks the device.
  final Unlock? unlock;

  Command({
    this.reboot,
    this.unlock,
  });

  Map<String, dynamic> toJson() {
    final reboot = this.reboot;
    final unlock = this.unlock;
    return {
      if (reboot != null) 'reboot': reboot,
      if (unlock != null) 'unlock': unlock,
    };
  }
}

/// A structure used to unlock a device.
///
/// @nodoc
class Unlock {
  Unlock();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure used to reboot the device.
///
/// @nodoc
class Reboot {
  Reboot();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A summary of a resource available on the device.
///
/// @nodoc
class ResourceSummary {
  /// The resource type.
  final String resourceType;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The ID of the resource.
  final String? id;

  ResourceSummary({
    required this.resourceType,
    this.arn,
    this.id,
  });

  factory ResourceSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSummary(
      resourceType: (json['resourceType'] as String?) ?? '',
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final arn = this.arn;
    final id = this.id;
    return {
      'resourceType': resourceType,
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

/// The details about the instance.
///
/// @nodoc
class InstanceSummary {
  /// A structure containing details about the instance.
  final Instance? instance;

  /// When the instance summary was last updated.
  final DateTime? lastUpdatedAt;

  InstanceSummary({
    this.instance,
    this.lastUpdatedAt,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      instance: json['instance'] != null
          ? Instance.fromJson(json['instance'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    final lastUpdatedAt = this.lastUpdatedAt;
    return {
      if (instance != null) 'instance': instance,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
    };
  }
}

/// The description of an instance. Currently, Amazon EC2 instances are the only
/// supported instance type.
///
/// @nodoc
class Instance {
  /// The Amazon Machine Image (AMI) launch index, which you can use to find this
  /// instance in the launch group.
  final int? amiLaunchIndex;

  /// Any block device mapping entries for the instance.
  final List<InstanceBlockDeviceMapping>? blockDeviceMappings;

  /// The CPU options for the instance.
  final CpuOptions? cpuOptions;

  /// When the instance was created.
  final DateTime? createdAt;

  /// The ID of the AMI used to launch the instance.
  final String? imageId;

  /// The ID of the instance.
  final String? instanceId;

  /// The instance type.
  final String? instanceType;

  /// The private IPv4 address assigned to the instance.
  final String? privateIpAddress;

  /// The public IPv4 address assigned to the instance.
  final String? publicIpAddress;

  /// The device name of the root device volume (for example,
  /// <code>/dev/sda1</code>).
  final String? rootDeviceName;

  /// The security groups for the instance.
  final List<SecurityGroupIdentifier>? securityGroups;
  final InstanceState? state;

  /// When the instance was last updated.
  final DateTime? updatedAt;

  Instance({
    this.amiLaunchIndex,
    this.blockDeviceMappings,
    this.cpuOptions,
    this.createdAt,
    this.imageId,
    this.instanceId,
    this.instanceType,
    this.privateIpAddress,
    this.publicIpAddress,
    this.rootDeviceName,
    this.securityGroups,
    this.state,
    this.updatedAt,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      amiLaunchIndex: json['amiLaunchIndex'] as int?,
      blockDeviceMappings: (json['blockDeviceMappings'] as List?)
          ?.nonNulls
          .map((e) =>
              InstanceBlockDeviceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpuOptions: json['cpuOptions'] != null
          ? CpuOptions.fromJson(json['cpuOptions'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      imageId: json['imageId'] as String?,
      instanceId: json['instanceId'] as String?,
      instanceType: json['instanceType'] as String?,
      privateIpAddress: json['privateIpAddress'] as String?,
      publicIpAddress: json['publicIpAddress'] as String?,
      rootDeviceName: json['rootDeviceName'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) =>
              SecurityGroupIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] != null
          ? InstanceState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final amiLaunchIndex = this.amiLaunchIndex;
    final blockDeviceMappings = this.blockDeviceMappings;
    final cpuOptions = this.cpuOptions;
    final createdAt = this.createdAt;
    final imageId = this.imageId;
    final instanceId = this.instanceId;
    final instanceType = this.instanceType;
    final privateIpAddress = this.privateIpAddress;
    final publicIpAddress = this.publicIpAddress;
    final rootDeviceName = this.rootDeviceName;
    final securityGroups = this.securityGroups;
    final state = this.state;
    final updatedAt = this.updatedAt;
    return {
      if (amiLaunchIndex != null) 'amiLaunchIndex': amiLaunchIndex,
      if (blockDeviceMappings != null)
        'blockDeviceMappings': blockDeviceMappings,
      if (cpuOptions != null) 'cpuOptions': cpuOptions,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageId != null) 'imageId': imageId,
      if (instanceId != null) 'instanceId': instanceId,
      if (instanceType != null) 'instanceType': instanceType,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
      if (publicIpAddress != null) 'publicIpAddress': publicIpAddress,
      if (rootDeviceName != null) 'rootDeviceName': rootDeviceName,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (state != null) 'state': state,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The description of the current state of an instance.
///
/// @nodoc
class InstanceState {
  /// The state of the instance as a 16-bit unsigned integer.
  ///
  /// The high byte is all of the bits between 2^8 and (2^16)-1, which equals
  /// decimal values between 256 and 65,535. These numerical values are used for
  /// internal purposes and should be ignored.
  ///
  /// The low byte is all of the bits between 2^0 and (2^8)-1, which equals
  /// decimal values between 0 and 255.
  ///
  /// The valid values for the instance state code are all in the range of the low
  /// byte. These values are:
  ///
  /// <ul>
  /// <li>
  /// <code>0</code> : <code>pending</code>
  /// </li>
  /// <li>
  /// <code>16</code> : <code>running</code>
  /// </li>
  /// <li>
  /// <code>32</code> : <code>shutting-down</code>
  /// </li>
  /// <li>
  /// <code>48</code> : <code>terminated</code>
  /// </li>
  /// <li>
  /// <code>64</code> : <code>stopping</code>
  /// </li>
  /// <li>
  /// <code>80</code> : <code>stopped</code>
  /// </li>
  /// </ul>
  /// You can ignore the high byte value by zeroing out all of the bits above 2^8
  /// or 256 in decimal.
  final int? code;

  /// The current state of the instance.
  final InstanceStateName? name;

  InstanceState({
    this.code,
    this.name,
  });

  factory InstanceState.fromJson(Map<String, dynamic> json) {
    return InstanceState(
      code: json['code'] as int?,
      name: (json['name'] as String?)?.let(InstanceStateName.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name.value,
    };
  }
}

/// The options for how a device's CPU is configured.
///
/// @nodoc
class CpuOptions {
  /// The number of cores that the CPU can use.
  final int? coreCount;

  /// The number of threads per core in the CPU.
  final int? threadsPerCore;

  CpuOptions({
    this.coreCount,
    this.threadsPerCore,
  });

  factory CpuOptions.fromJson(Map<String, dynamic> json) {
    return CpuOptions(
      coreCount: json['coreCount'] as int?,
      threadsPerCore: json['threadsPerCore'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreCount = this.coreCount;
    final threadsPerCore = this.threadsPerCore;
    return {
      if (coreCount != null) 'coreCount': coreCount,
      if (threadsPerCore != null) 'threadsPerCore': threadsPerCore,
    };
  }
}

/// Information about the device's security group.
///
/// @nodoc
class SecurityGroupIdentifier {
  /// The security group ID.
  final String? groupId;

  /// The security group name.
  final String? groupName;

  SecurityGroupIdentifier({
    this.groupId,
    this.groupName,
  });

  factory SecurityGroupIdentifier.fromJson(Map<String, dynamic> json) {
    return SecurityGroupIdentifier(
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    return {
      if (groupId != null) 'groupId': groupId,
      if (groupName != null) 'groupName': groupName,
    };
  }
}

/// The description of a block device mapping.
///
/// @nodoc
class InstanceBlockDeviceMapping {
  /// The block device name.
  final String? deviceName;

  /// The parameters used to automatically set up Amazon Elastic Block Store
  /// (Amazon EBS) volumes when the instance is launched.
  final EbsInstanceBlockDevice? ebs;

  InstanceBlockDeviceMapping({
    this.deviceName,
    this.ebs,
  });

  factory InstanceBlockDeviceMapping.fromJson(Map<String, dynamic> json) {
    return InstanceBlockDeviceMapping(
      deviceName: json['deviceName'] as String?,
      ebs: json['ebs'] != null
          ? EbsInstanceBlockDevice.fromJson(json['ebs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final ebs = this.ebs;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (ebs != null) 'ebs': ebs,
    };
  }
}

/// Describes a parameter used to set up an Amazon Elastic Block Store (Amazon
/// EBS) volume in a block device mapping.
///
/// @nodoc
class EbsInstanceBlockDevice {
  /// When the attachment was initiated.
  final DateTime? attachTime;

  /// A value that indicates whether the volume is deleted on instance
  /// termination.
  final bool? deleteOnTermination;

  /// The attachment state.
  final AttachmentStatus? status;

  /// The ID of the Amazon EBS volume.
  final String? volumeId;

  EbsInstanceBlockDevice({
    this.attachTime,
    this.deleteOnTermination,
    this.status,
    this.volumeId,
  });

  factory EbsInstanceBlockDevice.fromJson(Map<String, dynamic> json) {
    return EbsInstanceBlockDevice(
      attachTime: timeStampFromJson(json['attachTime']),
      deleteOnTermination: json['deleteOnTermination'] as bool?,
      status: (json['status'] as String?)?.let(AttachmentStatus.fromString),
      volumeId: json['volumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachTime = this.attachTime;
    final deleteOnTermination = this.deleteOnTermination;
    final status = this.status;
    final volumeId = this.volumeId;
    return {
      if (attachTime != null) 'attachTime': unixTimestampToJson(attachTime),
      if (deleteOnTermination != null)
        'deleteOnTermination': deleteOnTermination,
      if (status != null) 'status': status.value,
      if (volumeId != null) 'volumeId': volumeId,
    };
  }
}

/// @nodoc
class AttachmentStatus {
  static const attaching = AttachmentStatus._('ATTACHING');
  static const attached = AttachmentStatus._('ATTACHED');
  static const detaching = AttachmentStatus._('DETACHING');
  static const detached = AttachmentStatus._('DETACHED');

  final String value;

  const AttachmentStatus._(this.value);

  static const values = [attaching, attached, detaching, detached];

  static AttachmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachmentStatus._(value));

  @override
  bool operator ==(other) => other is AttachmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InstanceStateName {
  static const pending = InstanceStateName._('PENDING');
  static const running = InstanceStateName._('RUNNING');
  static const shuttingDown = InstanceStateName._('SHUTTING_DOWN');
  static const terminated = InstanceStateName._('TERMINATED');
  static const stopping = InstanceStateName._('STOPPING');
  static const stopped = InstanceStateName._('STOPPED');

  final String value;

  const InstanceStateName._(this.value);

  static const values = [
    pending,
    running,
    shuttingDown,
    terminated,
    stopping,
    stopped
  ];

  static InstanceStateName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceStateName._(value));

  @override
  bool operator ==(other) => other is InstanceStateName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifying information about the device.
///
/// @nodoc
class DeviceSummary {
  /// The ID of the job used to order the device.
  final String? associatedWithJob;

  /// The Amazon Resource Name (ARN) of the device.
  final String? managedDeviceArn;

  /// The ID of the device.
  final String? managedDeviceId;

  /// Optional metadata that you assign to a resource. You can use tags to
  /// categorize a resource in different ways, such as by purpose, owner, or
  /// environment.
  final Map<String, String>? tags;

  DeviceSummary({
    this.associatedWithJob,
    this.managedDeviceArn,
    this.managedDeviceId,
    this.tags,
  });

  factory DeviceSummary.fromJson(Map<String, dynamic> json) {
    return DeviceSummary(
      associatedWithJob: json['associatedWithJob'] as String?,
      managedDeviceArn: json['managedDeviceArn'] as String?,
      managedDeviceId: json['managedDeviceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedWithJob = this.associatedWithJob;
    final managedDeviceArn = this.managedDeviceArn;
    final managedDeviceId = this.managedDeviceId;
    final tags = this.tags;
    return {
      if (associatedWithJob != null) 'associatedWithJob': associatedWithJob,
      if (managedDeviceArn != null) 'managedDeviceArn': managedDeviceArn,
      if (managedDeviceId != null) 'managedDeviceId': managedDeviceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UnlockState {
  static const unlocked = UnlockState._('UNLOCKED');
  static const locked = UnlockState._('LOCKED');
  static const unlocking = UnlockState._('UNLOCKING');

  final String value;

  const UnlockState._(this.value);

  static const values = [unlocked, locked, unlocking];

  static UnlockState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UnlockState._(value));

  @override
  bool operator ==(other) => other is UnlockState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the software on the device.
///
/// @nodoc
class SoftwareInformation {
  /// The state of the software that is installed or that is being installed on
  /// the device.
  final String? installState;

  /// The version of the software currently installed on the device.
  final String? installedVersion;

  /// The version of the software being installed on the device.
  final String? installingVersion;

  SoftwareInformation({
    this.installState,
    this.installedVersion,
    this.installingVersion,
  });

  factory SoftwareInformation.fromJson(Map<String, dynamic> json) {
    return SoftwareInformation(
      installState: json['installState'] as String?,
      installedVersion: json['installedVersion'] as String?,
      installingVersion: json['installingVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final installState = this.installState;
    final installedVersion = this.installedVersion;
    final installingVersion = this.installingVersion;
    return {
      if (installState != null) 'installState': installState,
      if (installedVersion != null) 'installedVersion': installedVersion,
      if (installingVersion != null) 'installingVersion': installingVersion,
    };
  }
}

/// The physical capacity of the Amazon Web Services Snow Family device.
///
/// @nodoc
class Capacity {
  /// The amount of capacity available for use on the device.
  final int? available;

  /// The name of the type of capacity, such as memory.
  final String? name;

  /// The total capacity on the device.
  final int? total;

  /// The unit of measure for the type of capacity.
  final String? unit;

  /// The amount of capacity used on the device.
  final int? used;

  Capacity({
    this.available,
    this.name,
    this.total,
    this.unit,
    this.used,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) {
    return Capacity(
      available: json['available'] as int?,
      name: json['name'] as String?,
      total: json['total'] as int?,
      unit: json['unit'] as String?,
      used: json['used'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final available = this.available;
    final name = this.name;
    final total = this.total;
    final unit = this.unit;
    final used = this.used;
    return {
      if (available != null) 'available': available,
      if (name != null) 'name': name,
      if (total != null) 'total': total,
      if (unit != null) 'unit': unit,
      if (used != null) 'used': used,
    };
  }
}

/// The details about the physical network interface for the device.
///
/// @nodoc
class PhysicalNetworkInterface {
  /// The default gateway of the device.
  final String? defaultGateway;

  /// The IP address of the device.
  final String? ipAddress;

  /// A value that describes whether the IP address is dynamic or persistent.
  final IpAddressAssignment? ipAddressAssignment;

  /// The MAC address of the device.
  final String? macAddress;

  /// The netmask used to divide the IP address into subnets.
  final String? netmask;

  /// The physical connector type.
  final PhysicalConnectorType? physicalConnectorType;

  /// The physical network interface ID.
  final String? physicalNetworkInterfaceId;

  PhysicalNetworkInterface({
    this.defaultGateway,
    this.ipAddress,
    this.ipAddressAssignment,
    this.macAddress,
    this.netmask,
    this.physicalConnectorType,
    this.physicalNetworkInterfaceId,
  });

  factory PhysicalNetworkInterface.fromJson(Map<String, dynamic> json) {
    return PhysicalNetworkInterface(
      defaultGateway: json['defaultGateway'] as String?,
      ipAddress: json['ipAddress'] as String?,
      ipAddressAssignment: (json['ipAddressAssignment'] as String?)
          ?.let(IpAddressAssignment.fromString),
      macAddress: json['macAddress'] as String?,
      netmask: json['netmask'] as String?,
      physicalConnectorType: (json['physicalConnectorType'] as String?)
          ?.let(PhysicalConnectorType.fromString),
      physicalNetworkInterfaceId: json['physicalNetworkInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultGateway = this.defaultGateway;
    final ipAddress = this.ipAddress;
    final ipAddressAssignment = this.ipAddressAssignment;
    final macAddress = this.macAddress;
    final netmask = this.netmask;
    final physicalConnectorType = this.physicalConnectorType;
    final physicalNetworkInterfaceId = this.physicalNetworkInterfaceId;
    return {
      if (defaultGateway != null) 'defaultGateway': defaultGateway,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (ipAddressAssignment != null)
        'ipAddressAssignment': ipAddressAssignment.value,
      if (macAddress != null) 'macAddress': macAddress,
      if (netmask != null) 'netmask': netmask,
      if (physicalConnectorType != null)
        'physicalConnectorType': physicalConnectorType.value,
      if (physicalNetworkInterfaceId != null)
        'physicalNetworkInterfaceId': physicalNetworkInterfaceId,
    };
  }
}

/// @nodoc
class PhysicalConnectorType {
  static const rj45 = PhysicalConnectorType._('RJ45');
  static const sfpPlus = PhysicalConnectorType._('SFP_PLUS');
  static const qsfp = PhysicalConnectorType._('QSFP');
  static const rj45_2 = PhysicalConnectorType._('RJ45_2');
  static const wifi = PhysicalConnectorType._('WIFI');

  final String value;

  const PhysicalConnectorType._(this.value);

  static const values = [rj45, sfpPlus, qsfp, rj45_2, wifi];

  static PhysicalConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhysicalConnectorType._(value));

  @override
  bool operator ==(other) =>
      other is PhysicalConnectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IpAddressAssignment {
  static const dhcp = IpAddressAssignment._('DHCP');
  static const static = IpAddressAssignment._('STATIC');

  final String value;

  const IpAddressAssignment._(this.value);

  static const values = [dhcp, static];

  static IpAddressAssignment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressAssignment._(value));

  @override
  bool operator ==(other) =>
      other is IpAddressAssignment && other.value == value;

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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
