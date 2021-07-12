// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
class Braket {
  final _s.RestJsonProtocol _protocol;
  Braket({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

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
    ArgumentError.checkNotNull(quantumTaskArn, 'quantumTaskArn');
    _s.validateStringLength(
      'quantumTaskArn',
      quantumTaskArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
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

  /// Creates a quantum task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [DeviceOfflineException].
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
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [deviceParameters] :
  /// The parameters for the device to run the task on.
  ///
  /// Parameter [tags] :
  /// Tags to be added to the quantum task you're creating.
  Future<CreateQuantumTaskResponse> createQuantumTask({
    required Object action,
    required String deviceArn,
    required String outputS3Bucket,
    required String outputS3KeyPrefix,
    required int shots,
    String? clientToken,
    Object? deviceParameters,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringLength(
      'deviceArn',
      deviceArn,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputS3Bucket, 'outputS3Bucket');
    _s.validateStringLength(
      'outputS3Bucket',
      outputS3Bucket,
      3,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputS3KeyPrefix, 'outputS3KeyPrefix');
    _s.validateStringLength(
      'outputS3KeyPrefix',
      outputS3KeyPrefix,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(shots, 'shots');
    _s.validateNumRange(
      'shots',
      shots,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'action': jsonEncode(action),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3KeyPrefix': outputS3KeyPrefix,
      'shots': shots,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deviceParameters != null)
        'deviceParameters': jsonEncode(deviceParameters),
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [DeviceOfflineException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to retrieve.
  Future<GetDeviceResponse> getDevice({
    required String deviceArn,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringLength(
      'deviceArn',
      deviceArn,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device/${Uri.encodeComponent(deviceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceResponse.fromJson(response);
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
  /// the ARN of the task to retrieve.
  Future<GetQuantumTaskResponse> getQuantumTask({
    required String quantumTaskArn,
  }) async {
    ArgumentError.checkNotNull(quantumTaskArn, 'quantumTaskArn');
    _s.validateStringLength(
      'quantumTaskArn',
      quantumTaskArn,
      1,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/quantum-task/${Uri.encodeComponent(quantumTaskArn)}',
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    ArgumentError.checkNotNull(filters, 'filters');
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
    ArgumentError.checkNotNull(filters, 'filters');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
          (json['cancellationStatus'] as String).toCancellationStatus(),
      quantumTaskArn: json['quantumTaskArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationStatus = this.cancellationStatus;
    final quantumTaskArn = this.quantumTaskArn;
    return {
      'cancellationStatus': cancellationStatus.toValue(),
      'quantumTaskArn': quantumTaskArn,
    };
  }
}

enum CancellationStatus {
  cancelling,
  cancelled,
}

extension on CancellationStatus {
  String toValue() {
    switch (this) {
      case CancellationStatus.cancelling:
        return 'CANCELLING';
      case CancellationStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  CancellationStatus toCancellationStatus() {
    switch (this) {
      case 'CANCELLING':
        return CancellationStatus.cancelling;
      case 'CANCELLED':
        return CancellationStatus.cancelled;
    }
    throw Exception('$this is not known in enum CancellationStatus');
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

enum DeviceStatus {
  online,
  offline,
  retired,
}

extension on DeviceStatus {
  String toValue() {
    switch (this) {
      case DeviceStatus.online:
        return 'ONLINE';
      case DeviceStatus.offline:
        return 'OFFLINE';
      case DeviceStatus.retired:
        return 'RETIRED';
    }
  }
}

extension on String {
  DeviceStatus toDeviceStatus() {
    switch (this) {
      case 'ONLINE':
        return DeviceStatus.online;
      case 'OFFLINE':
        return DeviceStatus.offline;
      case 'RETIRED':
        return DeviceStatus.retired;
    }
    throw Exception('$this is not known in enum DeviceStatus');
  }
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
      deviceStatus: (json['deviceStatus'] as String).toDeviceStatus(),
      deviceType: (json['deviceType'] as String).toDeviceType(),
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
      'deviceStatus': deviceStatus.toValue(),
      'deviceType': deviceType.toValue(),
      'providerName': providerName,
    };
  }
}

enum DeviceType {
  qpu,
  simulator,
}

extension on DeviceType {
  String toValue() {
    switch (this) {
      case DeviceType.qpu:
        return 'QPU';
      case DeviceType.simulator:
        return 'SIMULATOR';
    }
  }
}

extension on String {
  DeviceType toDeviceType() {
    switch (this) {
      case 'QPU':
        return DeviceType.qpu;
      case 'SIMULATOR':
        return DeviceType.simulator;
    }
    throw Exception('$this is not known in enum DeviceType');
  }
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

  GetDeviceResponse({
    required this.deviceArn,
    required this.deviceCapabilities,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceType,
    required this.providerName,
  });

  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceResponse(
      deviceArn: json['deviceArn'] as String,
      deviceCapabilities:
          jsonDecode(json['deviceCapabilities'] as String) as Object,
      deviceName: json['deviceName'] as String,
      deviceStatus: (json['deviceStatus'] as String).toDeviceStatus(),
      deviceType: (json['deviceType'] as String).toDeviceType(),
      providerName: json['providerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceArn = this.deviceArn;
    final deviceCapabilities = this.deviceCapabilities;
    final deviceName = this.deviceName;
    final deviceStatus = this.deviceStatus;
    final deviceType = this.deviceType;
    final providerName = this.providerName;
    return {
      'deviceArn': deviceArn,
      'deviceCapabilities': jsonEncode(deviceCapabilities),
      'deviceName': deviceName,
      'deviceStatus': deviceStatus.toValue(),
      'deviceType': deviceType.toValue(),
      'providerName': providerName,
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

  /// The time at which the task ended.
  final DateTime? endedAt;

  /// The reason that a task failed.
  final String? failureReason;

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
    this.endedAt,
    this.failureReason,
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
      status: (json['status'] as String).toQuantumTaskStatus(),
      endedAt: timeStampFromJson(json['endedAt']),
      failureReason: json['failureReason'] as String?,
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
    final endedAt = this.endedAt;
    final failureReason = this.failureReason;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'deviceParameters': jsonEncode(deviceParameters),
      'outputS3Bucket': outputS3Bucket,
      'outputS3Directory': outputS3Directory,
      'quantumTaskArn': quantumTaskArn,
      'shots': shots,
      'status': status.toValue(),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureReason != null) 'failureReason': failureReason,
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

enum QuantumTaskStatus {
  created,
  queued,
  running,
  completed,
  failed,
  cancelling,
  cancelled,
}

extension on QuantumTaskStatus {
  String toValue() {
    switch (this) {
      case QuantumTaskStatus.created:
        return 'CREATED';
      case QuantumTaskStatus.queued:
        return 'QUEUED';
      case QuantumTaskStatus.running:
        return 'RUNNING';
      case QuantumTaskStatus.completed:
        return 'COMPLETED';
      case QuantumTaskStatus.failed:
        return 'FAILED';
      case QuantumTaskStatus.cancelling:
        return 'CANCELLING';
      case QuantumTaskStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  QuantumTaskStatus toQuantumTaskStatus() {
    switch (this) {
      case 'CREATED':
        return QuantumTaskStatus.created;
      case 'QUEUED':
        return QuantumTaskStatus.queued;
      case 'RUNNING':
        return QuantumTaskStatus.running;
      case 'COMPLETED':
        return QuantumTaskStatus.completed;
      case 'FAILED':
        return QuantumTaskStatus.failed;
      case 'CANCELLING':
        return QuantumTaskStatus.cancelling;
      case 'CANCELLED':
        return QuantumTaskStatus.cancelled;
    }
    throw Exception('$this is not known in enum QuantumTaskStatus');
  }
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
      status: (json['status'] as String).toQuantumTaskStatus(),
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
      'status': status.toValue(),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (tags != null) 'tags': tags,
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

  factory SearchDevicesFilter.fromJson(Map<String, dynamic> json) {
    return SearchDevicesFilter(
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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
          .whereNotNull()
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

  factory SearchQuantumTasksFilter.fromJson(Map<String, dynamic> json) {
    return SearchQuantumTasksFilter(
      name: json['name'] as String,
      operator:
          (json['operator'] as String).toSearchQuantumTasksFilterOperator(),
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum SearchQuantumTasksFilterOperator {
  lt,
  lte,
  equal,
  gt,
  gte,
  between,
}

extension on SearchQuantumTasksFilterOperator {
  String toValue() {
    switch (this) {
      case SearchQuantumTasksFilterOperator.lt:
        return 'LT';
      case SearchQuantumTasksFilterOperator.lte:
        return 'LTE';
      case SearchQuantumTasksFilterOperator.equal:
        return 'EQUAL';
      case SearchQuantumTasksFilterOperator.gt:
        return 'GT';
      case SearchQuantumTasksFilterOperator.gte:
        return 'GTE';
      case SearchQuantumTasksFilterOperator.between:
        return 'BETWEEN';
    }
  }
}

extension on String {
  SearchQuantumTasksFilterOperator toSearchQuantumTasksFilterOperator() {
    switch (this) {
      case 'LT':
        return SearchQuantumTasksFilterOperator.lt;
      case 'LTE':
        return SearchQuantumTasksFilterOperator.lte;
      case 'EQUAL':
        return SearchQuantumTasksFilterOperator.equal;
      case 'GT':
        return SearchQuantumTasksFilterOperator.gt;
      case 'GTE':
        return SearchQuantumTasksFilterOperator.gte;
      case 'BETWEEN':
        return SearchQuantumTasksFilterOperator.between;
    }
    throw Exception(
        '$this is not known in enum SearchQuantumTasksFilterOperator');
  }
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
          .whereNotNull()
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
