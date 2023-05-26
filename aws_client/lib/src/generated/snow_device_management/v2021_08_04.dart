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

/// Amazon Web Services Snow Device Management documentation.
class SnowDeviceManagement {
  final _s.RestJsonProtocol _protocol;
  SnowDeviceManagement({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'snow-device-management',
            signingName: 'snow-device-management',
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

  /// Sends a cancel request for a specified task. You can cancel a task only if
  /// it's still in a <code>QUEUED</code> state. Tasks that are already running
  /// can't be cancelled.
  /// <note>
  /// A task might still run if it's processed from the queue before the
  /// <code>CancelTask</code> operation changes the task's state.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Instructs one or more devices to start a task, such as unlocking or
  /// rebooting.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Checks device-specific information, such as the device type, software
  /// version, IP addresses, and lock status.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Checks the current state of the Amazon EC2 instances. The output is
  /// similar to <code>describeDevice</code>, but the results are sourced from
  /// the device cache in the Amazon Web Services Cloud and include a subset of
  /// the available fields.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Checks the status of a remote task running on one or more target devices.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Checks the metadata for a given task on a device.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Returns a list of the Amazon Web Services resources available for a
  /// device. Currently, Amazon EC2 instances are the only supported resource
  /// type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Returns a list of all devices on your Amazon Web Services account that
  /// have Amazon Web Services Snow Device Management enabled in the Amazon Web
  /// Services Region where the command is run.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Returns the status of tasks for one or more target devices.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
      if (state != null) 'state': [state.toValue()],
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

  /// Returns a list of tasks that can be filtered by state.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
      if (state != null) 'state': [state.toValue()],
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
}

enum AttachmentStatus {
  attaching,
  attached,
  detaching,
  detached,
}

extension AttachmentStatusValueExtension on AttachmentStatus {
  String toValue() {
    switch (this) {
      case AttachmentStatus.attaching:
        return 'ATTACHING';
      case AttachmentStatus.attached:
        return 'ATTACHED';
      case AttachmentStatus.detaching:
        return 'DETACHING';
      case AttachmentStatus.detached:
        return 'DETACHED';
    }
  }
}

extension AttachmentStatusFromString on String {
  AttachmentStatus toAttachmentStatus() {
    switch (this) {
      case 'ATTACHING':
        return AttachmentStatus.attaching;
      case 'ATTACHED':
        return AttachmentStatus.attached;
      case 'DETACHING':
        return AttachmentStatus.detaching;
      case 'DETACHED':
        return AttachmentStatus.detached;
    }
    throw Exception('$this is not known in enum AttachmentStatus');
  }
}

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

/// The physical capacity of the Amazon Web Services Snow Family device.
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

/// The command given to the device to execute.
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

/// The options for how a device's CPU is configured.
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

class DescribeDeviceEc2Output {
  /// A list of structures containing information about each instance.
  final List<InstanceSummary>? instances;

  DescribeDeviceEc2Output({
    this.instances,
  });

  factory DescribeDeviceEc2Output.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceEc2Output(
      instances: (json['instances'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => Capacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceState: (json['deviceState'] as String?)?.toUnlockState(),
      deviceType: json['deviceType'] as String?,
      lastReachedOutAt: timeStampFromJson(json['lastReachedOutAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      managedDeviceArn: json['managedDeviceArn'] as String?,
      managedDeviceId: json['managedDeviceId'] as String?,
      physicalNetworkInterfaces: (json['physicalNetworkInterfaces'] as List?)
          ?.whereNotNull()
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
      if (deviceState != null) 'deviceState': deviceState.toValue(),
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
      state: (json['state'] as String?)?.toExecutionState(),
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
      if (state != null) 'state': state.toValue(),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

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
      state: (json['state'] as String?)?.toTaskState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets: (json['targets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
      if (taskArn != null) 'taskArn': taskArn,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// Identifying information about the device.
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

/// Describes a parameter used to set up an Amazon Elastic Block Store (Amazon
/// EBS) volume in a block device mapping.
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
      status: (json['status'] as String?)?.toAttachmentStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (volumeId != null) 'volumeId': volumeId,
    };
  }
}

enum ExecutionState {
  queued,
  inProgress,
  canceled,
  failed,
  succeeded,
  rejected,
  timedOut,
}

extension ExecutionStateValueExtension on ExecutionState {
  String toValue() {
    switch (this) {
      case ExecutionState.queued:
        return 'QUEUED';
      case ExecutionState.inProgress:
        return 'IN_PROGRESS';
      case ExecutionState.canceled:
        return 'CANCELED';
      case ExecutionState.failed:
        return 'FAILED';
      case ExecutionState.succeeded:
        return 'SUCCEEDED';
      case ExecutionState.rejected:
        return 'REJECTED';
      case ExecutionState.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension ExecutionStateFromString on String {
  ExecutionState toExecutionState() {
    switch (this) {
      case 'QUEUED':
        return ExecutionState.queued;
      case 'IN_PROGRESS':
        return ExecutionState.inProgress;
      case 'CANCELED':
        return ExecutionState.canceled;
      case 'FAILED':
        return ExecutionState.failed;
      case 'SUCCEEDED':
        return ExecutionState.succeeded;
      case 'REJECTED':
        return ExecutionState.rejected;
      case 'TIMED_OUT':
        return ExecutionState.timedOut;
    }
    throw Exception('$this is not known in enum ExecutionState');
  }
}

/// The summary of a task execution on a specified device.
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
      state: (json['state'] as String?)?.toExecutionState(),
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
      if (state != null) 'state': state.toValue(),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// The description of an instance. Currently, Amazon EC2 instances are the only
/// supported instance type.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// The description of a block device mapping.
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

/// The description of the current state of an instance.
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
      name: (json['name'] as String?)?.toInstanceStateName(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name.toValue(),
    };
  }
}

enum InstanceStateName {
  pending,
  running,
  shuttingDown,
  terminated,
  stopping,
  stopped,
}

extension InstanceStateNameValueExtension on InstanceStateName {
  String toValue() {
    switch (this) {
      case InstanceStateName.pending:
        return 'PENDING';
      case InstanceStateName.running:
        return 'RUNNING';
      case InstanceStateName.shuttingDown:
        return 'SHUTTING_DOWN';
      case InstanceStateName.terminated:
        return 'TERMINATED';
      case InstanceStateName.stopping:
        return 'STOPPING';
      case InstanceStateName.stopped:
        return 'STOPPED';
    }
  }
}

extension InstanceStateNameFromString on String {
  InstanceStateName toInstanceStateName() {
    switch (this) {
      case 'PENDING':
        return InstanceStateName.pending;
      case 'RUNNING':
        return InstanceStateName.running;
      case 'SHUTTING_DOWN':
        return InstanceStateName.shuttingDown;
      case 'TERMINATED':
        return InstanceStateName.terminated;
      case 'STOPPING':
        return InstanceStateName.stopping;
      case 'STOPPED':
        return InstanceStateName.stopped;
    }
    throw Exception('$this is not known in enum InstanceStateName');
  }
}

/// The details about the instance.
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

enum IpAddressAssignment {
  dhcp,
  static,
}

extension IpAddressAssignmentValueExtension on IpAddressAssignment {
  String toValue() {
    switch (this) {
      case IpAddressAssignment.dhcp:
        return 'DHCP';
      case IpAddressAssignment.static:
        return 'STATIC';
    }
  }
}

extension IpAddressAssignmentFromString on String {
  IpAddressAssignment toIpAddressAssignment() {
    switch (this) {
      case 'DHCP':
        return IpAddressAssignment.dhcp;
      case 'STATIC':
        return IpAddressAssignment.static;
    }
    throw Exception('$this is not known in enum IpAddressAssignment');
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum PhysicalConnectorType {
  rj45,
  sfpPlus,
  qsfp,
  rj45_2,
  wifi,
}

extension PhysicalConnectorTypeValueExtension on PhysicalConnectorType {
  String toValue() {
    switch (this) {
      case PhysicalConnectorType.rj45:
        return 'RJ45';
      case PhysicalConnectorType.sfpPlus:
        return 'SFP_PLUS';
      case PhysicalConnectorType.qsfp:
        return 'QSFP';
      case PhysicalConnectorType.rj45_2:
        return 'RJ45_2';
      case PhysicalConnectorType.wifi:
        return 'WIFI';
    }
  }
}

extension PhysicalConnectorTypeFromString on String {
  PhysicalConnectorType toPhysicalConnectorType() {
    switch (this) {
      case 'RJ45':
        return PhysicalConnectorType.rj45;
      case 'SFP_PLUS':
        return PhysicalConnectorType.sfpPlus;
      case 'QSFP':
        return PhysicalConnectorType.qsfp;
      case 'RJ45_2':
        return PhysicalConnectorType.rj45_2;
      case 'WIFI':
        return PhysicalConnectorType.wifi;
    }
    throw Exception('$this is not known in enum PhysicalConnectorType');
  }
}

/// The details about the physical network interface for the device.
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
      ipAddressAssignment:
          (json['ipAddressAssignment'] as String?)?.toIpAddressAssignment(),
      macAddress: json['macAddress'] as String?,
      netmask: json['netmask'] as String?,
      physicalConnectorType:
          (json['physicalConnectorType'] as String?)?.toPhysicalConnectorType(),
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
        'ipAddressAssignment': ipAddressAssignment.toValue(),
      if (macAddress != null) 'macAddress': macAddress,
      if (netmask != null) 'netmask': netmask,
      if (physicalConnectorType != null)
        'physicalConnectorType': physicalConnectorType.toValue(),
      if (physicalNetworkInterfaceId != null)
        'physicalNetworkInterfaceId': physicalNetworkInterfaceId,
    };
  }
}

/// A structure used to reboot the device.
class Reboot {
  Reboot();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A summary of a resource available on the device.
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
      resourceType: json['resourceType'] as String,
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

/// Information about the device's security group.
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

/// Information about the software on the device.
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

enum TaskState {
  inProgress,
  canceled,
  completed,
}

extension TaskStateValueExtension on TaskState {
  String toValue() {
    switch (this) {
      case TaskState.inProgress:
        return 'IN_PROGRESS';
      case TaskState.canceled:
        return 'CANCELED';
      case TaskState.completed:
        return 'COMPLETED';
    }
  }
}

extension TaskStateFromString on String {
  TaskState toTaskState() {
    switch (this) {
      case 'IN_PROGRESS':
        return TaskState.inProgress;
      case 'CANCELED':
        return TaskState.canceled;
      case 'COMPLETED':
        return TaskState.completed;
    }
    throw Exception('$this is not known in enum TaskState');
  }
}

/// Information about the task assigned to one or many devices.
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
      taskId: json['taskId'] as String,
      state: (json['state'] as String?)?.toTaskState(),
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
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// A structure used to unlock a device.
class Unlock {
  Unlock();

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UnlockState {
  unlocked,
  locked,
  unlocking,
}

extension UnlockStateValueExtension on UnlockState {
  String toValue() {
    switch (this) {
      case UnlockState.unlocked:
        return 'UNLOCKED';
      case UnlockState.locked:
        return 'LOCKED';
      case UnlockState.unlocking:
        return 'UNLOCKING';
    }
  }
}

extension UnlockStateFromString on String {
  UnlockState toUnlockState() {
    switch (this) {
      case 'UNLOCKED':
        return UnlockState.unlocked;
      case 'LOCKED':
        return UnlockState.locked;
      case 'UNLOCKING':
        return UnlockState.unlocking;
    }
    throw Exception('$this is not known in enum UnlockState');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
