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

/// Amazon WorkSpaces Thin Client is an affordable device built to work with
/// Amazon Web Services End User Computing (EUC) virtual desktops to provide
/// users with a complete cloud desktop solution. WorkSpaces Thin Client is a
/// compact device designed to connect up to two monitors and USB devices like a
/// keyboard, mouse, headset, and webcam. To maximize endpoint security,
/// WorkSpaces Thin Client devices do not allow local data storage or
/// installation of unapproved applications. The WorkSpaces Thin Client device
/// ships preloaded with device management software.
///
/// You can use these APIs to complete WorkSpaces Thin Client tasks, such as
/// creating environments or viewing devices. For more information about
/// WorkSpaces Thin Client, including the required permissions to use the
/// service, see the <a
/// href="https://docs.aws.amazon.com/workspaces-thin-client/latest/ag/">Amazon
/// WorkSpaces Thin Client Administrator Guide</a>. For more information about
/// using the Command Line Interface (CLI) to manage your WorkSpaces Thin Client
/// resources, see the <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/workspaces-thin-client/index.html">WorkSpaces
/// Thin Client section of the CLI Reference</a>.
class WorkSpacesThinClient {
  final _s.RestJsonProtocol _protocol;
  WorkSpacesThinClient({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'thinclient',
            signingName: 'thinclient',
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

  /// Creates an environment for your thin client devices.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [desktopArn] :
  /// The Amazon Resource Name (ARN) of the desktop to stream from Amazon
  /// WorkSpaces, WorkSpaces Web, or AppStream 2.0.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [desiredSoftwareSetId] :
  /// The ID of the software set to apply.
  ///
  /// Parameter [desktopEndpoint] :
  /// The URL for the identity provider login (only for environments that use
  /// AppStream 2.0).
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the Key Management Service key to use to
  /// encrypt the environment.
  ///
  /// Parameter [maintenanceWindow] :
  /// A specification for a time window to apply software updates.
  ///
  /// Parameter [name] :
  /// The name for the environment.
  ///
  /// Parameter [softwareSetUpdateMode] :
  /// An option to define which software updates to apply.
  ///
  /// Parameter [softwareSetUpdateSchedule] :
  /// An option to define if software updates should be applied within a
  /// maintenance window.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateEnvironmentResponse> createEnvironment({
    required String desktopArn,
    String? clientToken,
    String? desiredSoftwareSetId,
    String? desktopEndpoint,
    String? kmsKeyArn,
    MaintenanceWindow? maintenanceWindow,
    String? name,
    SoftwareSetUpdateMode? softwareSetUpdateMode,
    SoftwareSetUpdateSchedule? softwareSetUpdateSchedule,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'desktopArn': desktopArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (desktopEndpoint != null) 'desktopEndpoint': desktopEndpoint,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (maintenanceWindow != null) 'maintenanceWindow': maintenanceWindow,
      if (name != null) 'name': name,
      if (softwareSetUpdateMode != null)
        'softwareSetUpdateMode': softwareSetUpdateMode.toValue(),
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/environments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentResponse.fromJson(response);
  }

  /// Deletes a thin client device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the device to delete.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<void> deleteDevice({
    required String id,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/devices/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment to delete.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<void> deleteEnvironment({
    required String id,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters a thin client device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the device to deregister.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [targetDeviceStatus] :
  /// The desired new status for the device.
  Future<void> deregisterDevice({
    required String id,
    String? clientToken,
    TargetDeviceStatus? targetDeviceStatus,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (targetDeviceStatus != null)
        'targetDeviceStatus': targetDeviceStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deregister-device/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information for a thin client device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the device for which to return information.
  Future<GetDeviceResponse> getDevice({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceResponse.fromJson(response);
  }

  /// Returns information for an environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment for which to return information.
  Future<GetEnvironmentResponse> getEnvironment({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentResponse.fromJson(response);
  }

  /// Returns information for a software set.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the software set for which to return information.
  Future<GetSoftwareSetResponse> getSoftwareSet({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/softwaresets/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSoftwareSetResponse.fromJson(response);
  }

  /// Returns a list of thin client devices.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListDevicesResponse> listDevices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
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

  /// Returns a list of environments.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListEnvironmentsResponse> listEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsResponse.fromJson(response);
  }

  /// Returns a list of software sets.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListSoftwareSetsResponse> listSoftwareSets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/softwaresets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSoftwareSetsResponse.fromJson(response);
  }

  /// Returns a list of tags for a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to
  /// retrieve tags.
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

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
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

  /// Removes a tag or tags from a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
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

  /// Updates a thin client device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the device to update.
  ///
  /// Parameter [desiredSoftwareSetId] :
  /// The ID of the software set to apply.
  ///
  /// Parameter [name] :
  /// The name of the device to update.
  ///
  /// Parameter [softwareSetUpdateSchedule] :
  /// An option to define if software updates should be applied within a
  /// maintenance window.
  Future<UpdateDeviceResponse> updateDevice({
    required String id,
    String? desiredSoftwareSetId,
    String? name,
    SoftwareSetUpdateSchedule? softwareSetUpdateSchedule,
  }) async {
    final $payload = <String, dynamic>{
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (name != null) 'name': name,
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDeviceResponse.fromJson(response);
  }

  /// Updates an environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the environment to update.
  ///
  /// Parameter [desiredSoftwareSetId] :
  /// The ID of the software set to apply.
  ///
  /// Parameter [desktopArn] :
  /// The Amazon Resource Name (ARN) of the desktop to stream from Amazon
  /// WorkSpaces, WorkSpaces Web, or AppStream 2.0.
  ///
  /// Parameter [desktopEndpoint] :
  /// The URL for the identity provider login (only for environments that use
  /// AppStream 2.0).
  ///
  /// Parameter [maintenanceWindow] :
  /// A specification for a time window to apply software updates.
  ///
  /// Parameter [name] :
  /// The name of the environment to update.
  ///
  /// Parameter [softwareSetUpdateMode] :
  /// An option to define which software updates to apply.
  ///
  /// Parameter [softwareSetUpdateSchedule] :
  /// An option to define if software updates should be applied within a
  /// maintenance window.
  Future<UpdateEnvironmentResponse> updateEnvironment({
    required String id,
    String? desiredSoftwareSetId,
    String? desktopArn,
    String? desktopEndpoint,
    MaintenanceWindow? maintenanceWindow,
    String? name,
    SoftwareSetUpdateMode? softwareSetUpdateMode,
    SoftwareSetUpdateSchedule? softwareSetUpdateSchedule,
  }) async {
    final $payload = <String, dynamic>{
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (desktopArn != null) 'desktopArn': desktopArn,
      if (desktopEndpoint != null) 'desktopEndpoint': desktopEndpoint,
      if (maintenanceWindow != null) 'maintenanceWindow': maintenanceWindow,
      if (name != null) 'name': name,
      if (softwareSetUpdateMode != null)
        'softwareSetUpdateMode': softwareSetUpdateMode.toValue(),
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/environments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentResponse.fromJson(response);
  }

  /// Updates a software set.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the software set to update.
  ///
  /// Parameter [validationStatus] :
  /// An option to define if the software set has been validated.
  Future<void> updateSoftwareSet({
    required String id,
    required SoftwareSetValidationStatus validationStatus,
  }) async {
    final $payload = <String, dynamic>{
      'validationStatus': validationStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/softwaresets/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum ApplyTimeOf {
  utc,
  device,
}

extension ApplyTimeOfValueExtension on ApplyTimeOf {
  String toValue() {
    switch (this) {
      case ApplyTimeOf.utc:
        return 'UTC';
      case ApplyTimeOf.device:
        return 'DEVICE';
    }
  }
}

extension ApplyTimeOfFromString on String {
  ApplyTimeOf toApplyTimeOf() {
    switch (this) {
      case 'UTC':
        return ApplyTimeOf.utc;
      case 'DEVICE':
        return ApplyTimeOf.device;
    }
    throw Exception('$this is not known in enum ApplyTimeOf');
  }
}

class CreateEnvironmentResponse {
  /// Describes an environment.
  final EnvironmentSummary? environment;

  CreateEnvironmentResponse({
    this.environment,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      environment: json['environment'] != null
          ? EnvironmentSummary.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekValueExtension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.monday:
        return 'MONDAY';
      case DayOfWeek.tuesday:
        return 'TUESDAY';
      case DayOfWeek.wednesday:
        return 'WEDNESDAY';
      case DayOfWeek.thursday:
        return 'THURSDAY';
      case DayOfWeek.friday:
        return 'FRIDAY';
      case DayOfWeek.saturday:
        return 'SATURDAY';
      case DayOfWeek.sunday:
        return 'SUNDAY';
    }
  }
}

extension DayOfWeekFromString on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'MONDAY':
        return DayOfWeek.monday;
      case 'TUESDAY':
        return DayOfWeek.tuesday;
      case 'WEDNESDAY':
        return DayOfWeek.wednesday;
      case 'THURSDAY':
        return DayOfWeek.thursday;
      case 'FRIDAY':
        return DayOfWeek.friday;
      case 'SATURDAY':
        return DayOfWeek.saturday;
      case 'SUNDAY':
        return DayOfWeek.sunday;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

class DeleteDeviceResponse {
  DeleteDeviceResponse();

  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDeviceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEnvironmentResponse {
  DeleteEnvironmentResponse();

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterDeviceResponse {
  DeregisterDeviceResponse();

  factory DeregisterDeviceResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterDeviceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DesktopType {
  workspaces,
  appstream,
  workspacesWeb,
}

extension DesktopTypeValueExtension on DesktopType {
  String toValue() {
    switch (this) {
      case DesktopType.workspaces:
        return 'workspaces';
      case DesktopType.appstream:
        return 'appstream';
      case DesktopType.workspacesWeb:
        return 'workspaces-web';
    }
  }
}

extension DesktopTypeFromString on String {
  DesktopType toDesktopType() {
    switch (this) {
      case 'workspaces':
        return DesktopType.workspaces;
      case 'appstream':
        return DesktopType.appstream;
      case 'workspaces-web':
        return DesktopType.workspacesWeb;
    }
    throw Exception('$this is not known in enum DesktopType');
  }
}

/// Describes a thin client device.
class Device {
  /// The Amazon Resource Name (ARN) of the device.
  final String? arn;

  /// The timestamp of when the device was created.
  final DateTime? createdAt;

  /// The ID of the software set currently installed on the device.
  final String? currentSoftwareSetId;

  /// The version of the software set currently installed on the device.
  final String? currentSoftwareSetVersion;

  /// The ID of the software set which the device has been set to.
  final String? desiredSoftwareSetId;

  /// The ID of the environment the device is associated with.
  final String? environmentId;

  /// The ID of the device.
  final String? id;

  /// The Amazon Resource Name (ARN) of the Key Management Service key used to
  /// encrypt the device.
  final String? kmsKeyArn;

  /// The timestamp of the most recent session on the device.
  final DateTime? lastConnectedAt;

  /// The timestamp of the most recent check-in of the device.
  final DateTime? lastPostureAt;

  /// The model number of the device.
  final String? model;

  /// The name of the device.
  final String? name;

  /// The ID of the software set that is pending to be installed on the device.
  final String? pendingSoftwareSetId;

  /// The version of the software set that is pending to be installed on the
  /// device.
  final String? pendingSoftwareSetVersion;

  /// The hardware serial number of the device.
  final String? serialNumber;

  /// Describes if the software currently installed on the device is a supported
  /// version.
  final DeviceSoftwareSetComplianceStatus? softwareSetComplianceStatus;

  /// An option to define if software updates should be applied within a
  /// maintenance window.
  final SoftwareSetUpdateSchedule? softwareSetUpdateSchedule;

  /// Describes if the device has a supported version of software installed.
  final SoftwareSetUpdateStatus? softwareSetUpdateStatus;

  /// The status of the device.
  final DeviceStatus? status;

  /// The tag keys and optional values for the resource.
  final Map<String, String>? tags;

  /// The timestamp of when the device was updated.
  final DateTime? updatedAt;

  Device({
    this.arn,
    this.createdAt,
    this.currentSoftwareSetId,
    this.currentSoftwareSetVersion,
    this.desiredSoftwareSetId,
    this.environmentId,
    this.id,
    this.kmsKeyArn,
    this.lastConnectedAt,
    this.lastPostureAt,
    this.model,
    this.name,
    this.pendingSoftwareSetId,
    this.pendingSoftwareSetVersion,
    this.serialNumber,
    this.softwareSetComplianceStatus,
    this.softwareSetUpdateSchedule,
    this.softwareSetUpdateStatus,
    this.status,
    this.tags,
    this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currentSoftwareSetId: json['currentSoftwareSetId'] as String?,
      currentSoftwareSetVersion: json['currentSoftwareSetVersion'] as String?,
      desiredSoftwareSetId: json['desiredSoftwareSetId'] as String?,
      environmentId: json['environmentId'] as String?,
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lastConnectedAt: timeStampFromJson(json['lastConnectedAt']),
      lastPostureAt: timeStampFromJson(json['lastPostureAt']),
      model: json['model'] as String?,
      name: json['name'] as String?,
      pendingSoftwareSetId: json['pendingSoftwareSetId'] as String?,
      pendingSoftwareSetVersion: json['pendingSoftwareSetVersion'] as String?,
      serialNumber: json['serialNumber'] as String?,
      softwareSetComplianceStatus:
          (json['softwareSetComplianceStatus'] as String?)
              ?.toDeviceSoftwareSetComplianceStatus(),
      softwareSetUpdateSchedule: (json['softwareSetUpdateSchedule'] as String?)
          ?.toSoftwareSetUpdateSchedule(),
      softwareSetUpdateStatus: (json['softwareSetUpdateStatus'] as String?)
          ?.toSoftwareSetUpdateStatus(),
      status: (json['status'] as String?)?.toDeviceStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final currentSoftwareSetId = this.currentSoftwareSetId;
    final currentSoftwareSetVersion = this.currentSoftwareSetVersion;
    final desiredSoftwareSetId = this.desiredSoftwareSetId;
    final environmentId = this.environmentId;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final lastConnectedAt = this.lastConnectedAt;
    final lastPostureAt = this.lastPostureAt;
    final model = this.model;
    final name = this.name;
    final pendingSoftwareSetId = this.pendingSoftwareSetId;
    final pendingSoftwareSetVersion = this.pendingSoftwareSetVersion;
    final serialNumber = this.serialNumber;
    final softwareSetComplianceStatus = this.softwareSetComplianceStatus;
    final softwareSetUpdateSchedule = this.softwareSetUpdateSchedule;
    final softwareSetUpdateStatus = this.softwareSetUpdateStatus;
    final status = this.status;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currentSoftwareSetId != null)
        'currentSoftwareSetId': currentSoftwareSetId,
      if (currentSoftwareSetVersion != null)
        'currentSoftwareSetVersion': currentSoftwareSetVersion,
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (environmentId != null) 'environmentId': environmentId,
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lastConnectedAt != null)
        'lastConnectedAt': unixTimestampToJson(lastConnectedAt),
      if (lastPostureAt != null)
        'lastPostureAt': unixTimestampToJson(lastPostureAt),
      if (model != null) 'model': model,
      if (name != null) 'name': name,
      if (pendingSoftwareSetId != null)
        'pendingSoftwareSetId': pendingSoftwareSetId,
      if (pendingSoftwareSetVersion != null)
        'pendingSoftwareSetVersion': pendingSoftwareSetVersion,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (softwareSetComplianceStatus != null)
        'softwareSetComplianceStatus': softwareSetComplianceStatus.toValue(),
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
      if (softwareSetUpdateStatus != null)
        'softwareSetUpdateStatus': softwareSetUpdateStatus.toValue(),
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DeviceSoftwareSetComplianceStatus {
  none,
  compliant,
  notCompliant,
}

extension DeviceSoftwareSetComplianceStatusValueExtension
    on DeviceSoftwareSetComplianceStatus {
  String toValue() {
    switch (this) {
      case DeviceSoftwareSetComplianceStatus.none:
        return 'NONE';
      case DeviceSoftwareSetComplianceStatus.compliant:
        return 'COMPLIANT';
      case DeviceSoftwareSetComplianceStatus.notCompliant:
        return 'NOT_COMPLIANT';
    }
  }
}

extension DeviceSoftwareSetComplianceStatusFromString on String {
  DeviceSoftwareSetComplianceStatus toDeviceSoftwareSetComplianceStatus() {
    switch (this) {
      case 'NONE':
        return DeviceSoftwareSetComplianceStatus.none;
      case 'COMPLIANT':
        return DeviceSoftwareSetComplianceStatus.compliant;
      case 'NOT_COMPLIANT':
        return DeviceSoftwareSetComplianceStatus.notCompliant;
    }
    throw Exception(
        '$this is not known in enum DeviceSoftwareSetComplianceStatus');
  }
}

enum DeviceStatus {
  registered,
  deregistering,
  deregistered,
  archived,
}

extension DeviceStatusValueExtension on DeviceStatus {
  String toValue() {
    switch (this) {
      case DeviceStatus.registered:
        return 'REGISTERED';
      case DeviceStatus.deregistering:
        return 'DEREGISTERING';
      case DeviceStatus.deregistered:
        return 'DEREGISTERED';
      case DeviceStatus.archived:
        return 'ARCHIVED';
    }
  }
}

extension DeviceStatusFromString on String {
  DeviceStatus toDeviceStatus() {
    switch (this) {
      case 'REGISTERED':
        return DeviceStatus.registered;
      case 'DEREGISTERING':
        return DeviceStatus.deregistering;
      case 'DEREGISTERED':
        return DeviceStatus.deregistered;
      case 'ARCHIVED':
        return DeviceStatus.archived;
    }
    throw Exception('$this is not known in enum DeviceStatus');
  }
}

/// Describes a thin client device.
class DeviceSummary {
  /// The Amazon Resource Name (ARN) of the device.
  final String? arn;

  /// The timestamp of when the device was created.
  final DateTime? createdAt;

  /// The ID of the software set currently installed on the device.
  final String? currentSoftwareSetId;

  /// The ID of the software set which the device has been set to.
  final String? desiredSoftwareSetId;

  /// The ID of the environment the device is associated with.
  final String? environmentId;

  /// The ID of the device.
  final String? id;

  /// The timestamp of the most recent session on the device.
  final DateTime? lastConnectedAt;

  /// The timestamp of the most recent check-in of the device.
  final DateTime? lastPostureAt;

  /// The model number of the device.
  final String? model;

  /// The name of the device.
  final String? name;

  /// The ID of the software set that is pending to be installed on the device.
  final String? pendingSoftwareSetId;

  /// The hardware serial number of the device.
  final String? serialNumber;

  /// An option to define if software updates should be applied within a
  /// maintenance window.
  final SoftwareSetUpdateSchedule? softwareSetUpdateSchedule;

  /// The status of the device.
  final DeviceStatus? status;

  /// The timestamp of when the device was updated.
  final DateTime? updatedAt;

  DeviceSummary({
    this.arn,
    this.createdAt,
    this.currentSoftwareSetId,
    this.desiredSoftwareSetId,
    this.environmentId,
    this.id,
    this.lastConnectedAt,
    this.lastPostureAt,
    this.model,
    this.name,
    this.pendingSoftwareSetId,
    this.serialNumber,
    this.softwareSetUpdateSchedule,
    this.status,
    this.updatedAt,
  });

  factory DeviceSummary.fromJson(Map<String, dynamic> json) {
    return DeviceSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currentSoftwareSetId: json['currentSoftwareSetId'] as String?,
      desiredSoftwareSetId: json['desiredSoftwareSetId'] as String?,
      environmentId: json['environmentId'] as String?,
      id: json['id'] as String?,
      lastConnectedAt: timeStampFromJson(json['lastConnectedAt']),
      lastPostureAt: timeStampFromJson(json['lastPostureAt']),
      model: json['model'] as String?,
      name: json['name'] as String?,
      pendingSoftwareSetId: json['pendingSoftwareSetId'] as String?,
      serialNumber: json['serialNumber'] as String?,
      softwareSetUpdateSchedule: (json['softwareSetUpdateSchedule'] as String?)
          ?.toSoftwareSetUpdateSchedule(),
      status: (json['status'] as String?)?.toDeviceStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final currentSoftwareSetId = this.currentSoftwareSetId;
    final desiredSoftwareSetId = this.desiredSoftwareSetId;
    final environmentId = this.environmentId;
    final id = this.id;
    final lastConnectedAt = this.lastConnectedAt;
    final lastPostureAt = this.lastPostureAt;
    final model = this.model;
    final name = this.name;
    final pendingSoftwareSetId = this.pendingSoftwareSetId;
    final serialNumber = this.serialNumber;
    final softwareSetUpdateSchedule = this.softwareSetUpdateSchedule;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currentSoftwareSetId != null)
        'currentSoftwareSetId': currentSoftwareSetId,
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (environmentId != null) 'environmentId': environmentId,
      if (id != null) 'id': id,
      if (lastConnectedAt != null)
        'lastConnectedAt': unixTimestampToJson(lastConnectedAt),
      if (lastPostureAt != null)
        'lastPostureAt': unixTimestampToJson(lastPostureAt),
      if (model != null) 'model': model,
      if (name != null) 'name': name,
      if (pendingSoftwareSetId != null)
        'pendingSoftwareSetId': pendingSoftwareSetId,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Describes an environment.
class Environment {
  /// The activation code to register a device to the environment.
  final String? activationCode;

  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The ID of the software set to apply.
  final String? desiredSoftwareSetId;

  /// The Amazon Resource Name (ARN) of the desktop to stream from Amazon
  /// WorkSpaces, WorkSpaces Web, or AppStream 2.0.
  final String? desktopArn;

  /// The URL for the identity provider login (only for environments that use
  /// AppStream 2.0).
  final String? desktopEndpoint;

  /// The type of streaming desktop for the environment.
  final DesktopType? desktopType;

  /// The ID of the environment.
  final String? id;

  /// The Amazon Resource Name (ARN) of the Key Management Service key used to
  /// encrypt the environment.
  final String? kmsKeyArn;

  /// A specification for a time window to apply software updates.
  final MaintenanceWindow? maintenanceWindow;

  /// The name of the environment.
  final String? name;

  /// The ID of the software set that is pending to be installed.
  final String? pendingSoftwareSetId;

  /// The version of the software set that is pending to be installed.
  final String? pendingSoftwareSetVersion;

  /// The number of devices registered to the environment.
  final int? registeredDevicesCount;

  /// Describes if the software currently installed on all devices in the
  /// environment is a supported version.
  final EnvironmentSoftwareSetComplianceStatus? softwareSetComplianceStatus;

  /// An option to define which software updates to apply.
  final SoftwareSetUpdateMode? softwareSetUpdateMode;

  /// An option to define if software updates should be applied within a
  /// maintenance window.
  final SoftwareSetUpdateSchedule? softwareSetUpdateSchedule;

  /// The tag keys and optional values for the resource.
  final Map<String, String>? tags;

  /// The timestamp of when the device was updated.
  final DateTime? updatedAt;

  Environment({
    this.activationCode,
    this.arn,
    this.createdAt,
    this.desiredSoftwareSetId,
    this.desktopArn,
    this.desktopEndpoint,
    this.desktopType,
    this.id,
    this.kmsKeyArn,
    this.maintenanceWindow,
    this.name,
    this.pendingSoftwareSetId,
    this.pendingSoftwareSetVersion,
    this.registeredDevicesCount,
    this.softwareSetComplianceStatus,
    this.softwareSetUpdateMode,
    this.softwareSetUpdateSchedule,
    this.tags,
    this.updatedAt,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      activationCode: json['activationCode'] as String?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      desiredSoftwareSetId: json['desiredSoftwareSetId'] as String?,
      desktopArn: json['desktopArn'] as String?,
      desktopEndpoint: json['desktopEndpoint'] as String?,
      desktopType: (json['desktopType'] as String?)?.toDesktopType(),
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      maintenanceWindow: json['maintenanceWindow'] != null
          ? MaintenanceWindow.fromJson(
              json['maintenanceWindow'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pendingSoftwareSetId: json['pendingSoftwareSetId'] as String?,
      pendingSoftwareSetVersion: json['pendingSoftwareSetVersion'] as String?,
      registeredDevicesCount: json['registeredDevicesCount'] as int?,
      softwareSetComplianceStatus:
          (json['softwareSetComplianceStatus'] as String?)
              ?.toEnvironmentSoftwareSetComplianceStatus(),
      softwareSetUpdateMode:
          (json['softwareSetUpdateMode'] as String?)?.toSoftwareSetUpdateMode(),
      softwareSetUpdateSchedule: (json['softwareSetUpdateSchedule'] as String?)
          ?.toSoftwareSetUpdateSchedule(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final activationCode = this.activationCode;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final desiredSoftwareSetId = this.desiredSoftwareSetId;
    final desktopArn = this.desktopArn;
    final desktopEndpoint = this.desktopEndpoint;
    final desktopType = this.desktopType;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final maintenanceWindow = this.maintenanceWindow;
    final name = this.name;
    final pendingSoftwareSetId = this.pendingSoftwareSetId;
    final pendingSoftwareSetVersion = this.pendingSoftwareSetVersion;
    final registeredDevicesCount = this.registeredDevicesCount;
    final softwareSetComplianceStatus = this.softwareSetComplianceStatus;
    final softwareSetUpdateMode = this.softwareSetUpdateMode;
    final softwareSetUpdateSchedule = this.softwareSetUpdateSchedule;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (activationCode != null) 'activationCode': activationCode,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (desktopArn != null) 'desktopArn': desktopArn,
      if (desktopEndpoint != null) 'desktopEndpoint': desktopEndpoint,
      if (desktopType != null) 'desktopType': desktopType.toValue(),
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (maintenanceWindow != null) 'maintenanceWindow': maintenanceWindow,
      if (name != null) 'name': name,
      if (pendingSoftwareSetId != null)
        'pendingSoftwareSetId': pendingSoftwareSetId,
      if (pendingSoftwareSetVersion != null)
        'pendingSoftwareSetVersion': pendingSoftwareSetVersion,
      if (registeredDevicesCount != null)
        'registeredDevicesCount': registeredDevicesCount,
      if (softwareSetComplianceStatus != null)
        'softwareSetComplianceStatus': softwareSetComplianceStatus.toValue(),
      if (softwareSetUpdateMode != null)
        'softwareSetUpdateMode': softwareSetUpdateMode.toValue(),
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum EnvironmentSoftwareSetComplianceStatus {
  noRegisteredDevices,
  compliant,
  notCompliant,
}

extension EnvironmentSoftwareSetComplianceStatusValueExtension
    on EnvironmentSoftwareSetComplianceStatus {
  String toValue() {
    switch (this) {
      case EnvironmentSoftwareSetComplianceStatus.noRegisteredDevices:
        return 'NO_REGISTERED_DEVICES';
      case EnvironmentSoftwareSetComplianceStatus.compliant:
        return 'COMPLIANT';
      case EnvironmentSoftwareSetComplianceStatus.notCompliant:
        return 'NOT_COMPLIANT';
    }
  }
}

extension EnvironmentSoftwareSetComplianceStatusFromString on String {
  EnvironmentSoftwareSetComplianceStatus
      toEnvironmentSoftwareSetComplianceStatus() {
    switch (this) {
      case 'NO_REGISTERED_DEVICES':
        return EnvironmentSoftwareSetComplianceStatus.noRegisteredDevices;
      case 'COMPLIANT':
        return EnvironmentSoftwareSetComplianceStatus.compliant;
      case 'NOT_COMPLIANT':
        return EnvironmentSoftwareSetComplianceStatus.notCompliant;
    }
    throw Exception(
        '$this is not known in enum EnvironmentSoftwareSetComplianceStatus');
  }
}

/// Describes an environment.
class EnvironmentSummary {
  /// The activation code to register a device to the environment.
  final String? activationCode;

  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The ID of the software set to apply.
  final String? desiredSoftwareSetId;

  /// The Amazon Resource Name (ARN) of the desktop to stream from Amazon
  /// WorkSpaces, WorkSpaces Web, or AppStream 2.0.
  final String? desktopArn;

  /// The URL for the identity provider login (only for environments that use
  /// AppStream 2.0).
  final String? desktopEndpoint;

  /// The type of streaming desktop for the environment.
  final DesktopType? desktopType;

  /// The ID of the environment.
  final String? id;

  /// A specification for a time window to apply software updates.
  final MaintenanceWindow? maintenanceWindow;

  /// The name of the environment.
  final String? name;

  /// The ID of the software set that is pending to be installed.
  final String? pendingSoftwareSetId;

  /// An option to define which software updates to apply.
  final SoftwareSetUpdateMode? softwareSetUpdateMode;

  /// An option to define if software updates should be applied within a
  /// maintenance window.
  final SoftwareSetUpdateSchedule? softwareSetUpdateSchedule;

  /// The timestamp of when the device was updated.
  final DateTime? updatedAt;

  EnvironmentSummary({
    this.activationCode,
    this.arn,
    this.createdAt,
    this.desiredSoftwareSetId,
    this.desktopArn,
    this.desktopEndpoint,
    this.desktopType,
    this.id,
    this.maintenanceWindow,
    this.name,
    this.pendingSoftwareSetId,
    this.softwareSetUpdateMode,
    this.softwareSetUpdateSchedule,
    this.updatedAt,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      activationCode: json['activationCode'] as String?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      desiredSoftwareSetId: json['desiredSoftwareSetId'] as String?,
      desktopArn: json['desktopArn'] as String?,
      desktopEndpoint: json['desktopEndpoint'] as String?,
      desktopType: (json['desktopType'] as String?)?.toDesktopType(),
      id: json['id'] as String?,
      maintenanceWindow: json['maintenanceWindow'] != null
          ? MaintenanceWindow.fromJson(
              json['maintenanceWindow'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pendingSoftwareSetId: json['pendingSoftwareSetId'] as String?,
      softwareSetUpdateMode:
          (json['softwareSetUpdateMode'] as String?)?.toSoftwareSetUpdateMode(),
      softwareSetUpdateSchedule: (json['softwareSetUpdateSchedule'] as String?)
          ?.toSoftwareSetUpdateSchedule(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final activationCode = this.activationCode;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final desiredSoftwareSetId = this.desiredSoftwareSetId;
    final desktopArn = this.desktopArn;
    final desktopEndpoint = this.desktopEndpoint;
    final desktopType = this.desktopType;
    final id = this.id;
    final maintenanceWindow = this.maintenanceWindow;
    final name = this.name;
    final pendingSoftwareSetId = this.pendingSoftwareSetId;
    final softwareSetUpdateMode = this.softwareSetUpdateMode;
    final softwareSetUpdateSchedule = this.softwareSetUpdateSchedule;
    final updatedAt = this.updatedAt;
    return {
      if (activationCode != null) 'activationCode': activationCode,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (desiredSoftwareSetId != null)
        'desiredSoftwareSetId': desiredSoftwareSetId,
      if (desktopArn != null) 'desktopArn': desktopArn,
      if (desktopEndpoint != null) 'desktopEndpoint': desktopEndpoint,
      if (desktopType != null) 'desktopType': desktopType.toValue(),
      if (id != null) 'id': id,
      if (maintenanceWindow != null) 'maintenanceWindow': maintenanceWindow,
      if (name != null) 'name': name,
      if (pendingSoftwareSetId != null)
        'pendingSoftwareSetId': pendingSoftwareSetId,
      if (softwareSetUpdateMode != null)
        'softwareSetUpdateMode': softwareSetUpdateMode.toValue(),
      if (softwareSetUpdateSchedule != null)
        'softwareSetUpdateSchedule': softwareSetUpdateSchedule.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class GetDeviceResponse {
  /// Describes an device.
  final Device? device;

  GetDeviceResponse({
    this.device,
  });

  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceResponse(
      device: json['device'] != null
          ? Device.fromJson(json['device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'device': device,
    };
  }
}

class GetEnvironmentResponse {
  /// Describes an environment.
  final Environment? environment;

  GetEnvironmentResponse({
    this.environment,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class GetSoftwareSetResponse {
  /// Describes a software set.
  final SoftwareSet? softwareSet;

  GetSoftwareSetResponse({
    this.softwareSet,
  });

  factory GetSoftwareSetResponse.fromJson(Map<String, dynamic> json) {
    return GetSoftwareSetResponse(
      softwareSet: json['softwareSet'] != null
          ? SoftwareSet.fromJson(json['softwareSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final softwareSet = this.softwareSet;
    return {
      if (softwareSet != null) 'softwareSet': softwareSet,
    };
  }
}

class ListDevicesResponse {
  /// Describes devices.
  final List<DeviceSummary>? devices;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });

  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesResponse(
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

class ListEnvironmentsResponse {
  /// Describes environments.
  final List<EnvironmentSummary>? environments;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListEnvironmentsResponse({
    this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environments: (json['environments'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      if (environments != null) 'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSoftwareSetsResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  /// Describes software sets.
  final List<SoftwareSetSummary>? softwareSets;

  ListSoftwareSetsResponse({
    this.nextToken,
    this.softwareSets,
  });

  factory ListSoftwareSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListSoftwareSetsResponse(
      nextToken: json['nextToken'] as String?,
      softwareSets: (json['softwareSets'] as List?)
          ?.whereNotNull()
          .map((e) => SoftwareSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final softwareSets = this.softwareSets;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (softwareSets != null) 'softwareSets': softwareSets,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
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

/// Describes the maintenance window for a thin client device.
class MaintenanceWindow {
  /// The option to set the maintenance window during the device local time or
  /// Universal Coordinated Time (UTC).
  final ApplyTimeOf? applyTimeOf;

  /// The days of the week during which the maintenance window is open.
  final List<DayOfWeek>? daysOfTheWeek;

  /// The hour for the maintenance window end (<code>00</code>-<code>23</code>).
  final int? endTimeHour;

  /// The minutes for the maintenance window end
  /// (<code>00</code>-<code>59</code>).
  final int? endTimeMinute;

  /// The hour for the maintenance window start (<code>00</code>-<code>23</code>).
  final int? startTimeHour;

  /// The minutes past the hour for the maintenance window start
  /// (<code>00</code>-<code>59</code>).
  final int? startTimeMinute;

  /// An option to select the default or custom maintenance window.
  final MaintenanceWindowType? type;

  MaintenanceWindow({
    this.applyTimeOf,
    this.daysOfTheWeek,
    this.endTimeHour,
    this.endTimeMinute,
    this.startTimeHour,
    this.startTimeMinute,
    this.type,
  });

  factory MaintenanceWindow.fromJson(Map<String, dynamic> json) {
    return MaintenanceWindow(
      applyTimeOf: (json['applyTimeOf'] as String?)?.toApplyTimeOf(),
      daysOfTheWeek: (json['daysOfTheWeek'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDayOfWeek())
          .toList(),
      endTimeHour: json['endTimeHour'] as int?,
      endTimeMinute: json['endTimeMinute'] as int?,
      startTimeHour: json['startTimeHour'] as int?,
      startTimeMinute: json['startTimeMinute'] as int?,
      type: (json['type'] as String?)?.toMaintenanceWindowType(),
    );
  }

  Map<String, dynamic> toJson() {
    final applyTimeOf = this.applyTimeOf;
    final daysOfTheWeek = this.daysOfTheWeek;
    final endTimeHour = this.endTimeHour;
    final endTimeMinute = this.endTimeMinute;
    final startTimeHour = this.startTimeHour;
    final startTimeMinute = this.startTimeMinute;
    final type = this.type;
    return {
      if (applyTimeOf != null) 'applyTimeOf': applyTimeOf.toValue(),
      if (daysOfTheWeek != null)
        'daysOfTheWeek': daysOfTheWeek.map((e) => e.toValue()).toList(),
      if (endTimeHour != null) 'endTimeHour': endTimeHour,
      if (endTimeMinute != null) 'endTimeMinute': endTimeMinute,
      if (startTimeHour != null) 'startTimeHour': startTimeHour,
      if (startTimeMinute != null) 'startTimeMinute': startTimeMinute,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MaintenanceWindowType {
  system,
  custom,
}

extension MaintenanceWindowTypeValueExtension on MaintenanceWindowType {
  String toValue() {
    switch (this) {
      case MaintenanceWindowType.system:
        return 'SYSTEM';
      case MaintenanceWindowType.custom:
        return 'CUSTOM';
    }
  }
}

extension MaintenanceWindowTypeFromString on String {
  MaintenanceWindowType toMaintenanceWindowType() {
    switch (this) {
      case 'SYSTEM':
        return MaintenanceWindowType.system;
      case 'CUSTOM':
        return MaintenanceWindowType.custom;
    }
    throw Exception('$this is not known in enum MaintenanceWindowType');
  }
}

/// Describes software.
class Software {
  /// The name of the software component.
  final String? name;

  /// The version of the software component.
  final String? version;

  Software({
    this.name,
    this.version,
  });

  factory Software.fromJson(Map<String, dynamic> json) {
    return Software(
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// Describes a software set.
class SoftwareSet {
  /// The Amazon Resource Name (ARN) of the software set.
  final String? arn;

  /// The ID of the software set.
  final String? id;

  /// The timestamp of when the software set was released.
  final DateTime? releasedAt;

  /// A list of the software components in the software set.
  final List<Software>? software;

  /// The timestamp of the end of support for the software set.
  final DateTime? supportedUntil;

  /// The tag keys and optional values for the resource.
  final Map<String, String>? tags;

  /// An option to define if the software set has been validated.
  final SoftwareSetValidationStatus? validationStatus;

  /// The version of the software set.
  final String? version;

  SoftwareSet({
    this.arn,
    this.id,
    this.releasedAt,
    this.software,
    this.supportedUntil,
    this.tags,
    this.validationStatus,
    this.version,
  });

  factory SoftwareSet.fromJson(Map<String, dynamic> json) {
    return SoftwareSet(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      releasedAt: timeStampFromJson(json['releasedAt']),
      software: (json['software'] as List?)
          ?.whereNotNull()
          .map((e) => Software.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedUntil: timeStampFromJson(json['supportedUntil']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      validationStatus: (json['validationStatus'] as String?)
          ?.toSoftwareSetValidationStatus(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final releasedAt = this.releasedAt;
    final software = this.software;
    final supportedUntil = this.supportedUntil;
    final tags = this.tags;
    final validationStatus = this.validationStatus;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (releasedAt != null) 'releasedAt': unixTimestampToJson(releasedAt),
      if (software != null) 'software': software,
      if (supportedUntil != null)
        'supportedUntil': unixTimestampToJson(supportedUntil),
      if (tags != null) 'tags': tags,
      if (validationStatus != null)
        'validationStatus': validationStatus.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Describes a software set.
class SoftwareSetSummary {
  /// The Amazon Resource Name (ARN) of the software set.
  final String? arn;

  /// The ID of the software set.
  final String? id;

  /// The timestamp of when the software set was released.
  final DateTime? releasedAt;

  /// The timestamp of the end of support for the software set.
  final DateTime? supportedUntil;

  /// An option to define if the software set has been validated.
  final SoftwareSetValidationStatus? validationStatus;

  /// The version of the software set.
  final String? version;

  SoftwareSetSummary({
    this.arn,
    this.id,
    this.releasedAt,
    this.supportedUntil,
    this.validationStatus,
    this.version,
  });

  factory SoftwareSetSummary.fromJson(Map<String, dynamic> json) {
    return SoftwareSetSummary(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      releasedAt: timeStampFromJson(json['releasedAt']),
      supportedUntil: timeStampFromJson(json['supportedUntil']),
      validationStatus: (json['validationStatus'] as String?)
          ?.toSoftwareSetValidationStatus(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final releasedAt = this.releasedAt;
    final supportedUntil = this.supportedUntil;
    final validationStatus = this.validationStatus;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (releasedAt != null) 'releasedAt': unixTimestampToJson(releasedAt),
      if (supportedUntil != null)
        'supportedUntil': unixTimestampToJson(supportedUntil),
      if (validationStatus != null)
        'validationStatus': validationStatus.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum SoftwareSetUpdateMode {
  useLatest,
  useDesired,
}

extension SoftwareSetUpdateModeValueExtension on SoftwareSetUpdateMode {
  String toValue() {
    switch (this) {
      case SoftwareSetUpdateMode.useLatest:
        return 'USE_LATEST';
      case SoftwareSetUpdateMode.useDesired:
        return 'USE_DESIRED';
    }
  }
}

extension SoftwareSetUpdateModeFromString on String {
  SoftwareSetUpdateMode toSoftwareSetUpdateMode() {
    switch (this) {
      case 'USE_LATEST':
        return SoftwareSetUpdateMode.useLatest;
      case 'USE_DESIRED':
        return SoftwareSetUpdateMode.useDesired;
    }
    throw Exception('$this is not known in enum SoftwareSetUpdateMode');
  }
}

enum SoftwareSetUpdateSchedule {
  useMaintenanceWindow,
  applyImmediately,
}

extension SoftwareSetUpdateScheduleValueExtension on SoftwareSetUpdateSchedule {
  String toValue() {
    switch (this) {
      case SoftwareSetUpdateSchedule.useMaintenanceWindow:
        return 'USE_MAINTENANCE_WINDOW';
      case SoftwareSetUpdateSchedule.applyImmediately:
        return 'APPLY_IMMEDIATELY';
    }
  }
}

extension SoftwareSetUpdateScheduleFromString on String {
  SoftwareSetUpdateSchedule toSoftwareSetUpdateSchedule() {
    switch (this) {
      case 'USE_MAINTENANCE_WINDOW':
        return SoftwareSetUpdateSchedule.useMaintenanceWindow;
      case 'APPLY_IMMEDIATELY':
        return SoftwareSetUpdateSchedule.applyImmediately;
    }
    throw Exception('$this is not known in enum SoftwareSetUpdateSchedule');
  }
}

enum SoftwareSetUpdateStatus {
  available,
  inProgress,
  upToDate,
}

extension SoftwareSetUpdateStatusValueExtension on SoftwareSetUpdateStatus {
  String toValue() {
    switch (this) {
      case SoftwareSetUpdateStatus.available:
        return 'AVAILABLE';
      case SoftwareSetUpdateStatus.inProgress:
        return 'IN_PROGRESS';
      case SoftwareSetUpdateStatus.upToDate:
        return 'UP_TO_DATE';
    }
  }
}

extension SoftwareSetUpdateStatusFromString on String {
  SoftwareSetUpdateStatus toSoftwareSetUpdateStatus() {
    switch (this) {
      case 'AVAILABLE':
        return SoftwareSetUpdateStatus.available;
      case 'IN_PROGRESS':
        return SoftwareSetUpdateStatus.inProgress;
      case 'UP_TO_DATE':
        return SoftwareSetUpdateStatus.upToDate;
    }
    throw Exception('$this is not known in enum SoftwareSetUpdateStatus');
  }
}

enum SoftwareSetValidationStatus {
  validated,
  notValidated,
}

extension SoftwareSetValidationStatusValueExtension
    on SoftwareSetValidationStatus {
  String toValue() {
    switch (this) {
      case SoftwareSetValidationStatus.validated:
        return 'VALIDATED';
      case SoftwareSetValidationStatus.notValidated:
        return 'NOT_VALIDATED';
    }
  }
}

extension SoftwareSetValidationStatusFromString on String {
  SoftwareSetValidationStatus toSoftwareSetValidationStatus() {
    switch (this) {
      case 'VALIDATED':
        return SoftwareSetValidationStatus.validated;
      case 'NOT_VALIDATED':
        return SoftwareSetValidationStatus.notValidated;
    }
    throw Exception('$this is not known in enum SoftwareSetValidationStatus');
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

enum TargetDeviceStatus {
  deregistered,
  archived,
}

extension TargetDeviceStatusValueExtension on TargetDeviceStatus {
  String toValue() {
    switch (this) {
      case TargetDeviceStatus.deregistered:
        return 'DEREGISTERED';
      case TargetDeviceStatus.archived:
        return 'ARCHIVED';
    }
  }
}

extension TargetDeviceStatusFromString on String {
  TargetDeviceStatus toTargetDeviceStatus() {
    switch (this) {
      case 'DEREGISTERED':
        return TargetDeviceStatus.deregistered;
      case 'ARCHIVED':
        return TargetDeviceStatus.archived;
    }
    throw Exception('$this is not known in enum TargetDeviceStatus');
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

class UpdateDeviceResponse {
  /// Describes a device.
  final DeviceSummary? device;

  UpdateDeviceResponse({
    this.device,
  });

  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceResponse(
      device: json['device'] != null
          ? DeviceSummary.fromJson(json['device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'device': device,
    };
  }
}

class UpdateEnvironmentResponse {
  /// Describes an environment.
  final EnvironmentSummary? environment;

  UpdateEnvironmentResponse({
    this.environment,
  });

  factory UpdateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentResponse(
      environment: json['environment'] != null
          ? EnvironmentSummary.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class UpdateSoftwareSetResponse {
  UpdateSoftwareSetResponse();

  factory UpdateSoftwareSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSoftwareSetResponse();
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
