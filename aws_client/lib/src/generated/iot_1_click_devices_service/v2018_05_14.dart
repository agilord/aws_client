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

/// Describes all of the AWS IoT 1-Click device-related API operations for the
/// service.
/// Also provides sample requests, responses, and errors for the supported web
/// services
/// protocols.
class IoT1ClickDevices {
  final _s.RestJsonProtocol _protocol;
  IoT1ClickDevices({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'devices.iot1click',
            signingName: 'iot1click',
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

  /// Adds device(s) to your account (i.e., claim one or more devices) if and
  /// only if you
  /// received a claim code with the device(s).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [claimCode] :
  /// The claim code, starting with "C-", as provided by the device
  /// manufacturer.
  Future<ClaimDevicesByClaimCodeResponse> claimDevicesByClaimCode({
    required String claimCode,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/claims/${Uri.encodeComponent(claimCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return ClaimDevicesByClaimCodeResponse.fromJson(response);
  }

  /// Given a device ID, returns a DescribeDeviceResponse object describing the
  /// details of the device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  Future<DescribeDeviceResponse> describeDevice({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceResponse.fromJson(response);
  }

  /// Given a device ID, finalizes the claim request for the associated device.
  /// <note>
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event,
  /// and finalizing the claim. For a device of type button, a device event can
  /// be published by simply clicking the device.
  ///
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  ///
  /// Parameter [tags] :
  /// A collection of key/value pairs defining the resource tags. For example, {
  /// "tags": {"key1": "value1", "key2": "value2"} }. For more information, see
  /// <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  ///
  ///
  ///
  ///
  Future<FinalizeDeviceClaimResponse> finalizeDeviceClaim({
    required String deviceId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/finalize-claim',
      exceptionFnMap: _exceptionFns,
    );
    return FinalizeDeviceClaimResponse.fromJson(response);
  }

  /// Given a device ID, returns the invokable methods associated with the
  /// device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  Future<GetDeviceMethodsResponse> getDeviceMethods({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/methods',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceMethodsResponse.fromJson(response);
  }

  /// Given a device ID, initiates a claim request for the associated device.
  /// <note>
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event,
  /// and finalizing the claim. For a device of type button, a device event can
  /// be published by simply clicking the device.
  ///
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  Future<InitiateDeviceClaimResponse> initiateDeviceClaim({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/initiate-claim',
      exceptionFnMap: _exceptionFns,
    );
    return InitiateDeviceClaimResponse.fromJson(response);
  }

  /// Given a device ID, issues a request to invoke a named device method (with
  /// possible
  /// parameters). See the "Example POST" code snippet below.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  ///
  /// Parameter [deviceMethod] :
  /// The device method to invoke.
  ///
  /// Parameter [deviceMethodParameters] :
  /// A JSON encoded string containing the device method request parameters.
  Future<InvokeDeviceMethodResponse> invokeDeviceMethod({
    required String deviceId,
    DeviceMethod? deviceMethod,
    String? deviceMethodParameters,
  }) async {
    final $payload = <String, dynamic>{
      if (deviceMethod != null) 'deviceMethod': deviceMethod,
      if (deviceMethodParameters != null)
        'deviceMethodParameters': deviceMethodParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/methods',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeDeviceMethodResponse.fromJson(response);
  }

  /// Using a device ID, returns a DeviceEventsResponse object containing an
  /// array of events for the device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  ///
  /// Parameter [fromTimeStamp] :
  /// The start date for the device event query, in ISO8061 format. For example,
  /// 2018-03-28T15:45:12.880Z
  ///
  ///
  /// Parameter [toTimeStamp] :
  /// The end date for the device event query, in ISO8061 format. For example,
  /// 2018-03-28T15:45:12.880Z
  ///
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request. If not set, a default
  /// value of
  /// 100 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListDeviceEventsResponse> listDeviceEvents({
    required String deviceId,
    required DateTime fromTimeStamp,
    required DateTime toTimeStamp,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'fromTimeStamp': [_s.iso8601ToJson(fromTimeStamp).toString()],
      'toTimeStamp': [_s.iso8601ToJson(toTimeStamp).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceEventsResponse.fromJson(response);
  }

  /// Lists the 1-Click compatible devices associated with your AWS account.
  ///
  /// May throw [RangeNotSatisfiableException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceType] :
  /// The type of the device, such as "button".
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request. If not set, a default
  /// value of
  /// 100 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListDevicesResponse> listDevices({
    String? deviceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (deviceType != null) 'deviceType': [deviceType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesResponse.fromJson(response);
  }

  /// Lists the tags associated with the specified resource ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
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

  /// Adds or updates the tags associated with the resource ARN. See <a
  /// href="https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits">AWS
  /// IoT 1-Click Service Limits</a> for the maximum number of tags allowed per
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// A collection of key/value pairs defining the resource tags. For example, {
  /// "tags": {"key1": "value1", "key2": "value2"} }. For more information, see
  /// <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  ///
  ///
  ///
  ///
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

  /// Disassociates a device from your AWS account using its device ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  Future<UnclaimDeviceResponse> unclaimDevice({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/unclaim',
      exceptionFnMap: _exceptionFns,
    );
    return UnclaimDeviceResponse.fromJson(response);
  }

  /// Using tag keys, deletes the tags (key/value pairs) associated with the
  /// specified
  /// resource ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A collections of tag keys. For example, {"key1","key2"}
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

  /// Using a Boolean value (true or false), this operation
  /// enables or disables the device given a device ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deviceId] :
  /// The unique identifier of the device.
  ///
  /// Parameter [enabled] :
  /// If true, the device is enabled. If false, the device is
  /// disabled.
  Future<void> updateDeviceState({
    required String deviceId,
    bool? enabled,
  }) async {
    final $payload = <String, dynamic>{
      if (enabled != null) 'enabled': enabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}/state',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> _) {
    return Attributes();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ClaimDevicesByClaimCodeResponse {
  /// The claim code provided by the device manufacturer.
  final String? claimCode;

  /// The total number of devices associated with the claim code that has been
  /// processed in
  /// the claim request.
  final int? total;

  ClaimDevicesByClaimCodeResponse({
    this.claimCode,
    this.total,
  });

  factory ClaimDevicesByClaimCodeResponse.fromJson(Map<String, dynamic> json) {
    return ClaimDevicesByClaimCodeResponse(
      claimCode: json['claimCode'] as String?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final claimCode = this.claimCode;
    final total = this.total;
    return {
      if (claimCode != null) 'claimCode': claimCode,
      if (total != null) 'total': total,
    };
  }
}

class DescribeDeviceResponse {
  /// Device details.
  final DeviceDescription? deviceDescription;

  DescribeDeviceResponse({
    this.deviceDescription,
  });

  factory DescribeDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceResponse(
      deviceDescription: json['deviceDescription'] != null
          ? DeviceDescription.fromJson(
              json['deviceDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceDescription = this.deviceDescription;
    return {
      if (deviceDescription != null) 'deviceDescription': deviceDescription,
    };
  }
}

class Device {
  /// The user specified attributes associated with the device for an event.
  final Attributes? attributes;

  /// The unique identifier of the device.
  final String? deviceId;

  /// The device type, such as "button".
  final String? type;

  Device({
    this.attributes,
    this.deviceId,
    this.type,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      attributes: json['attributes'] != null
          ? Attributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      deviceId: json['deviceId'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final deviceId = this.deviceId;
    final type = this.type;
    return {
      if (attributes != null) 'attributes': attributes,
      if (deviceId != null) 'deviceId': deviceId,
      if (type != null) 'type': type,
    };
  }
}

class DeviceDescription {
  /// The ARN of the device.
  final String? arn;

  /// An array of zero or more elements of DeviceAttribute objects providing
  /// user specified device attributes.
  final Map<String, String>? attributes;

  /// The unique identifier of the device.
  final String? deviceId;

  /// A Boolean value indicating whether or not the device is enabled.
  final bool? enabled;

  /// A value between 0 and 1 inclusive, representing the fraction of life
  /// remaining for the
  /// device.
  final double? remainingLife;

  /// The tags currently associated with the AWS IoT 1-Click device.
  final Map<String, String>? tags;

  /// The type of the device, such as "button".
  final String? type;

  DeviceDescription({
    this.arn,
    this.attributes,
    this.deviceId,
    this.enabled,
    this.remainingLife,
    this.tags,
    this.type,
  });

  factory DeviceDescription.fromJson(Map<String, dynamic> json) {
    return DeviceDescription(
      arn: json['arn'] as String?,
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      deviceId: json['deviceId'] as String?,
      enabled: json['enabled'] as bool?,
      remainingLife: json['remainingLife'] as double?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attributes = this.attributes;
    final deviceId = this.deviceId;
    final enabled = this.enabled;
    final remainingLife = this.remainingLife;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (attributes != null) 'attributes': attributes,
      if (deviceId != null) 'deviceId': deviceId,
      if (enabled != null) 'enabled': enabled,
      if (remainingLife != null) 'remainingLife': remainingLife,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
    };
  }
}

class DeviceEvent {
  /// An object representing the device associated with the event.
  final Device? device;

  /// A serialized JSON object representing the device-type specific event.
  final String? stdEvent;

  DeviceEvent({
    this.device,
    this.stdEvent,
  });

  factory DeviceEvent.fromJson(Map<String, dynamic> json) {
    return DeviceEvent(
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
      stdEvent: json['stdEvent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    final stdEvent = this.stdEvent;
    return {
      if (device != null) 'device': device,
      if (stdEvent != null) 'stdEvent': stdEvent,
    };
  }
}

class DeviceMethod {
  /// The type of the device, such as "button".
  final String? deviceType;

  /// The name of the method applicable to the deviceType.
  final String? methodName;

  DeviceMethod({
    this.deviceType,
    this.methodName,
  });

  factory DeviceMethod.fromJson(Map<String, dynamic> json) {
    return DeviceMethod(
      deviceType: json['deviceType'] as String?,
      methodName: json['methodName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceType = this.deviceType;
    final methodName = this.methodName;
    return {
      if (deviceType != null) 'deviceType': deviceType,
      if (methodName != null) 'methodName': methodName,
    };
  }
}

class FinalizeDeviceClaimResponse {
  /// The device's final claim state.
  final String? state;

  FinalizeDeviceClaimResponse({
    this.state,
  });

  factory FinalizeDeviceClaimResponse.fromJson(Map<String, dynamic> json) {
    return FinalizeDeviceClaimResponse(
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state,
    };
  }
}

class GetDeviceMethodsResponse {
  /// List of available device APIs.
  final List<DeviceMethod>? deviceMethods;

  GetDeviceMethodsResponse({
    this.deviceMethods,
  });

  factory GetDeviceMethodsResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceMethodsResponse(
      deviceMethods: (json['deviceMethods'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceMethods = this.deviceMethods;
    return {
      if (deviceMethods != null) 'deviceMethods': deviceMethods,
    };
  }
}

class InitiateDeviceClaimResponse {
  /// The device's final claim state.
  final String? state;

  InitiateDeviceClaimResponse({
    this.state,
  });

  factory InitiateDeviceClaimResponse.fromJson(Map<String, dynamic> json) {
    return InitiateDeviceClaimResponse(
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state,
    };
  }
}

class InvokeDeviceMethodResponse {
  /// A JSON encoded string containing the device method response.
  final String? deviceMethodResponse;

  InvokeDeviceMethodResponse({
    this.deviceMethodResponse,
  });

  factory InvokeDeviceMethodResponse.fromJson(Map<String, dynamic> json) {
    return InvokeDeviceMethodResponse(
      deviceMethodResponse: json['deviceMethodResponse'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceMethodResponse = this.deviceMethodResponse;
    return {
      if (deviceMethodResponse != null)
        'deviceMethodResponse': deviceMethodResponse,
    };
  }
}

class ListDeviceEventsResponse {
  /// An array of zero or more elements describing the event(s) associated with
  /// the
  /// device.
  final List<DeviceEvent>? events;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListDeviceEventsResponse({
    this.events,
    this.nextToken,
  });

  factory ListDeviceEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceEventsResponse(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDevicesResponse {
  /// A list of devices.
  final List<DeviceDescription>? devices;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });

  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesResponse(
      devices: (json['devices'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceDescription.fromJson(e as Map<String, dynamic>))
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

class ListTagsForResourceResponse {
  /// A collection of key/value pairs defining the resource tags. For example, {
  /// "tags": {"key1": "value1", "key2": "value2"} }. For more information, see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  ///
  ///
  ///
  ///
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

class UnclaimDeviceResponse {
  /// The device's final claim state.
  final String? state;

  UnclaimDeviceResponse({
    this.state,
  });

  factory UnclaimDeviceResponse.fromJson(Map<String, dynamic> json) {
    return UnclaimDeviceResponse(
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state,
    };
  }
}

class UpdateDeviceStateResponse {
  UpdateDeviceStateResponse();

  factory UpdateDeviceStateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDeviceStateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class RangeNotSatisfiableException extends _s.GenericAwsException {
  RangeNotSatisfiableException({String? type, String? message})
      : super(
            type: type, code: 'RangeNotSatisfiableException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'RangeNotSatisfiableException': (type, message) =>
      RangeNotSatisfiableException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
