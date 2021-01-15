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

part '2019-09-01.g.dart';

/// The Amazon Braket API Reference provides information about the operations
/// and structures supported in Amazon Braket.
class Braket {
  final _s.RestJsonProtocol _protocol;
  Braket({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [quantumTaskArn] :
  /// The ARN of the task to cancel.
  Future<CancelQuantumTaskResponse> cancelQuantumTask({
    @_s.required String clientToken,
    @_s.required String quantumTaskArn,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(quantumTaskArn, 'quantumTaskArn');
    _s.validateStringLength(
      'quantumTaskArn',
      quantumTaskArn,
      1,
      256,
      isRequired: true,
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
  /// Parameter [clientToken] :
  /// The client token associated with the request.
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
  /// Parameter [deviceParameters] :
  /// The parameters for the device to run the task on.
  ///
  /// Parameter [tags] :
  /// Tags to be added to the quantum task you're creating.
  Future<CreateQuantumTaskResponse> createQuantumTask({
    @_s.required String action,
    @_s.required String clientToken,
    @_s.required String deviceArn,
    @_s.required String outputS3Bucket,
    @_s.required String outputS3KeyPrefix,
    @_s.required int shots,
    String deviceParameters,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
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
      'deviceParameters',
      deviceParameters,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'action': action == null ? null : jsonEncode(action),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3KeyPrefix': outputS3KeyPrefix,
      'shots': shots,
      if (deviceParameters != null)
        'deviceParameters':
            deviceParameters == null ? null : jsonEncode(deviceParameters),
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
  /// May throw [InternalServiceException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to retrieve.
  Future<GetDeviceResponse> getDevice({
    @_s.required String deviceArn,
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
    @_s.required String quantumTaskArn,
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
    @_s.required String resourceArn,
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
    @_s.required List<SearchDevicesFilter> filters,
    int maxResults,
    String nextToken,
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
    @_s.required List<SearchQuantumTasksFilter> filters,
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    return TagResourceResponse.fromJson(response);
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
  /// pecify the keys for the tags to remove from the resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelQuantumTaskResponse {
  /// The status of the cancellation request.
  @_s.JsonKey(name: 'cancellationStatus')
  final CancellationStatus cancellationStatus;

  /// The ARN of the task.
  @_s.JsonKey(name: 'quantumTaskArn')
  final String quantumTaskArn;

  CancelQuantumTaskResponse({
    @_s.required this.cancellationStatus,
    @_s.required this.quantumTaskArn,
  });
  factory CancelQuantumTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelQuantumTaskResponseFromJson(json);
}

enum CancellationStatus {
  @_s.JsonValue('CANCELLING')
  cancelling,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateQuantumTaskResponse {
  /// The ARN of the task created by the request.
  @_s.JsonKey(name: 'quantumTaskArn')
  final String quantumTaskArn;

  CreateQuantumTaskResponse({
    @_s.required this.quantumTaskArn,
  });
  factory CreateQuantumTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateQuantumTaskResponseFromJson(json);
}

enum DeviceStatus {
  @_s.JsonValue('ONLINE')
  online,
  @_s.JsonValue('OFFLINE')
  offline,
}

/// Includes information about the device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceSummary {
  /// The ARN of the device.
  @_s.JsonKey(name: 'deviceArn')
  final String deviceArn;

  /// The name of the device.
  @_s.JsonKey(name: 'deviceName')
  final String deviceName;

  /// The status of the device.
  @_s.JsonKey(name: 'deviceStatus')
  final DeviceStatus deviceStatus;

  /// The type of the device.
  @_s.JsonKey(name: 'deviceType')
  final DeviceType deviceType;

  /// The provider of the device.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  DeviceSummary({
    @_s.required this.deviceArn,
    @_s.required this.deviceName,
    @_s.required this.deviceStatus,
    @_s.required this.deviceType,
    @_s.required this.providerName,
  });
  factory DeviceSummary.fromJson(Map<String, dynamic> json) =>
      _$DeviceSummaryFromJson(json);
}

enum DeviceType {
  @_s.JsonValue('QPU')
  qpu,
  @_s.JsonValue('SIMULATOR')
  simulator,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceResponse {
  /// The ARN of the device.
  @_s.JsonKey(name: 'deviceArn')
  final String deviceArn;

  /// Details about the capabilities of the device.
  @_s.JsonKey(name: 'deviceCapabilities')
  final Object deviceCapabilities;

  /// The name of the device.
  @_s.JsonKey(name: 'deviceName')
  final String deviceName;

  /// The status of the device.
  @_s.JsonKey(name: 'deviceStatus')
  final DeviceStatus deviceStatus;

  /// The type of the device.
  @_s.JsonKey(name: 'deviceType')
  final DeviceType deviceType;

  /// The name of the partner company for the device.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  GetDeviceResponse({
    @_s.required this.deviceArn,
    @_s.required this.deviceCapabilities,
    @_s.required this.deviceName,
    @_s.required this.deviceStatus,
    @_s.required this.deviceType,
    @_s.required this.providerName,
  });
  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetQuantumTaskResponse {
  /// The time at which the task was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ARN of the device the task was run on.
  @_s.JsonKey(name: 'deviceArn')
  final String deviceArn;

  /// The parameters for the device on which the task ran.
  @_s.JsonKey(name: 'deviceParameters')
  final Object deviceParameters;

  /// The S3 bucket where task results are stored.
  @_s.JsonKey(name: 'outputS3Bucket')
  final String outputS3Bucket;

  /// The folder in the S3 bucket where task results are stored.
  @_s.JsonKey(name: 'outputS3Directory')
  final String outputS3Directory;

  /// The ARN of the task.
  @_s.JsonKey(name: 'quantumTaskArn')
  final String quantumTaskArn;

  /// The number of shots used in the task.
  @_s.JsonKey(name: 'shots')
  final int shots;

  /// The status of the task.
  @_s.JsonKey(name: 'status')
  final QuantumTaskStatus status;

  /// The time at which the task ended.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endedAt')
  final DateTime endedAt;

  /// The reason that a task failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The tags that belong to this task.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetQuantumTaskResponse({
    @_s.required this.createdAt,
    @_s.required this.deviceArn,
    @_s.required this.deviceParameters,
    @_s.required this.outputS3Bucket,
    @_s.required this.outputS3Directory,
    @_s.required this.quantumTaskArn,
    @_s.required this.shots,
    @_s.required this.status,
    this.endedAt,
    this.failureReason,
    this.tags,
  });
  factory GetQuantumTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuantumTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Displays the key, value pairs of tags associated with this resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum QuantumTaskStatus {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELLING')
  cancelling,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

/// Includes information about a quantum task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuantumTaskSummary {
  /// The time at which the task was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ARN of the device the task ran on.
  @_s.JsonKey(name: 'deviceArn')
  final String deviceArn;

  /// The S3 bucket where the task result file is stored..
  @_s.JsonKey(name: 'outputS3Bucket')
  final String outputS3Bucket;

  /// The folder in the S3 bucket where the task result file is stored.
  @_s.JsonKey(name: 'outputS3Directory')
  final String outputS3Directory;

  /// The ARN of the task.
  @_s.JsonKey(name: 'quantumTaskArn')
  final String quantumTaskArn;

  /// The shots used for the task.
  @_s.JsonKey(name: 'shots')
  final int shots;

  /// The status of the task.
  @_s.JsonKey(name: 'status')
  final QuantumTaskStatus status;

  /// The time at which the task finished.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endedAt')
  final DateTime endedAt;

  /// Displays the key, value pairs of tags associated with this quantum task.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  QuantumTaskSummary({
    @_s.required this.createdAt,
    @_s.required this.deviceArn,
    @_s.required this.outputS3Bucket,
    @_s.required this.outputS3Directory,
    @_s.required this.quantumTaskArn,
    @_s.required this.shots,
    @_s.required this.status,
    this.endedAt,
    this.tags,
  });
  factory QuantumTaskSummary.fromJson(Map<String, dynamic> json) =>
      _$QuantumTaskSummaryFromJson(json);
}

/// The filter to use for searching devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SearchDevicesFilter {
  /// The name to use to filter results.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The values to use to filter results.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SearchDevicesFilter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$SearchDevicesFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchDevicesResponse {
  /// An array of <code>DeviceSummary</code> objects for devices that match the
  /// specified filter values.
  @_s.JsonKey(name: 'devices')
  final List<DeviceSummary> devices;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue results
  /// where the previous request ended.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  SearchDevicesResponse({
    @_s.required this.devices,
    this.nextToken,
  });
  factory SearchDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchDevicesResponseFromJson(json);
}

/// A filter to use to search for tasks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SearchQuantumTasksFilter {
  /// The name of the device used for the task.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An operator to use in the filter.
  @_s.JsonKey(name: 'operator')
  final SearchQuantumTasksFilterOperator operator;

  /// The values to use for the filter.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SearchQuantumTasksFilter({
    @_s.required this.name,
    @_s.required this.operator,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$SearchQuantumTasksFilterToJson(this);
}

enum SearchQuantumTasksFilterOperator {
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LTE')
  lte,
  @_s.JsonValue('EQUAL')
  equal,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GTE')
  gte,
  @_s.JsonValue('BETWEEN')
  between,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchQuantumTasksResponse {
  /// An array of <code>QuantumTaskSummary</code> objects for tasks that match the
  /// specified filters.
  @_s.JsonKey(name: 'quantumTasks')
  final List<QuantumTaskSummary> quantumTasks;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue results
  /// where the previous request ended.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  SearchQuantumTasksResponse({
    @_s.required this.quantumTasks,
    this.nextToken,
  });
  factory SearchQuantumTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchQuantumTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DeviceOfflineException extends _s.GenericAwsException {
  DeviceOfflineException({String type, String message})
      : super(type: type, code: 'DeviceOfflineException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DeviceOfflineException': (type, message) =>
      DeviceOfflineException(type: type, message: message),
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
