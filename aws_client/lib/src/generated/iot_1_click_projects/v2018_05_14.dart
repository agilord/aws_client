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

/// The AWS IoT 1-Click Projects API Reference
class IoT1ClickProjects {
  final _s.RestJsonProtocol _protocol;
  IoT1ClickProjects({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'projects.iot1click',
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

  /// Associates a physical device with a placement.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the physical device to be associated with the given placement in
  /// the project. Note that a mandatory 4 character prefix is required for all
  /// <code>deviceId</code> values.
  ///
  /// Parameter [deviceTemplateName] :
  /// The device template name to associate with the device ID.
  ///
  /// Parameter [placementName] :
  /// The name of the placement in which to associate the device.
  ///
  /// Parameter [projectName] :
  /// The name of the project containing the placement in which to associate the
  /// device.
  Future<void> associateDeviceWithPlacement({
    required String deviceId,
    required String deviceTemplateName,
    required String placementName,
    required String projectName,
  }) async {
    final $payload = <String, dynamic>{
      'deviceId': deviceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}/devices/${Uri.encodeComponent(deviceTemplateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an empty placement.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [placementName] :
  /// The name of the placement to be created.
  ///
  /// Parameter [projectName] :
  /// The name of the project in which to create the placement.
  ///
  /// Parameter [attributes] :
  /// Optional user-defined key/value pairs providing contextual data (such as
  /// location or function) for the placement.
  Future<void> createPlacement({
    required String placementName,
    required String projectName,
    Map<String, String>? attributes,
  }) async {
    final $payload = <String, dynamic>{
      'placementName': placementName,
      if (attributes != null) 'attributes': attributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}/placements',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an empty project with a placement template. A project contains
  /// zero or more placements that adhere to the placement template defined in
  /// the project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [projectName] :
  /// The name of the project to create.
  ///
  /// Parameter [description] :
  /// An optional description for the project.
  ///
  /// Parameter [placementTemplate] :
  /// The schema defining the placement to be created. A placement template
  /// defines placement default attributes and device templates. You cannot add
  /// or remove device templates after the project has been created. However,
  /// you can update <code>callbackOverrides</code> for the device templates
  /// using the <code>UpdateProject</code> API.
  ///
  /// Parameter [tags] :
  /// Optional tags (metadata key/value pairs) to be associated with the
  /// project. For example, <code>{ {"key1": "value1", "key2": "value2"}
  /// }</code>. For more information, see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  Future<void> createProject({
    required String projectName,
    String? description,
    PlacementTemplate? placementTemplate,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'projectName': projectName,
      if (description != null) 'description': description,
      if (placementTemplate != null) 'placementTemplate': placementTemplate,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a placement. To delete a placement, it must not have any devices
  /// associated with it.
  /// <note>
  /// When you delete a placement, all associated data becomes irretrievable.
  /// </note>
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [placementName] :
  /// The name of the empty placement to delete.
  ///
  /// Parameter [projectName] :
  /// The project containing the empty placement to delete.
  Future<void> deletePlacement({
    required String placementName,
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a project. To delete a project, it must not have any placements
  /// associated with it.
  /// <note>
  /// When you delete a project, all associated data becomes irretrievable.
  /// </note>
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [projectName] :
  /// The name of the empty project to delete.
  Future<void> deleteProject({
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes a placement in a project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [placementName] :
  /// The name of the placement within a project.
  ///
  /// Parameter [projectName] :
  /// The project containing the placement to be described.
  Future<DescribePlacementResponse> describePlacement({
    required String placementName,
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePlacementResponse.fromJson(response);
  }

  /// Returns an object describing a project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the project to be described.
  Future<DescribeProjectResponse> describeProject({
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Removes a physical device from a placement.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deviceTemplateName] :
  /// The device ID that should be removed from the placement.
  ///
  /// Parameter [placementName] :
  /// The name of the placement that the device should be removed from.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the placement.
  Future<void> disassociateDeviceFromPlacement({
    required String deviceTemplateName,
    required String placementName,
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}/devices/${Uri.encodeComponent(deviceTemplateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns an object enumerating the devices in a placement.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [placementName] :
  /// The name of the placement to get the devices from.
  ///
  /// Parameter [projectName] :
  /// The name of the project containing the placement.
  Future<GetDevicesInPlacementResponse> getDevicesInPlacement({
    required String placementName,
    required String projectName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}/devices',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicesInPlacementResponse.fromJson(response);
  }

  /// Lists the placement(s) of a project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The project containing the placements to be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request. If not set, a default
  /// value of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListPlacementsResponse> listPlacements({
    required String projectName,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}/placements',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPlacementsResponse.fromJson(response);
  }

  /// Lists the AWS IoT 1-Click project(s) associated with your AWS account and
  /// region.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request. If not set, a default
  /// value of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListProjectsResponse> listProjects({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Lists the tags (metadata key/value pairs) which you have assigned to the
  /// resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to list.
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

  /// Creates or modifies tags for a resource. Tags are key/value pairs
  /// (metadata) that can be used to manage a resource. For more information,
  /// see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resouce for which tag(s) should be added or modified.
  ///
  /// Parameter [tags] :
  /// The new or modifying tag(s) for the resource. See <a
  /// href="https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits">AWS
  /// IoT 1-Click Service Limits</a> for the maximum number of tags allowed per
  /// resource.
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

  /// Removes one or more tags (metadata key/value pairs) from a resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tag you want to remove.
  ///
  /// Parameter [tagKeys] :
  /// The keys of those tags which you want to remove.
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

  /// Updates a placement with the given attributes. To clear an attribute, pass
  /// an empty value (i.e., "").
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [placementName] :
  /// The name of the placement to update.
  ///
  /// Parameter [projectName] :
  /// The name of the project containing the placement to be updated.
  ///
  /// Parameter [attributes] :
  /// The user-defined object of attributes used to update the placement. The
  /// maximum number of key/value pairs is 50.
  Future<void> updatePlacement({
    required String placementName,
    required String projectName,
    Map<String, String>? attributes,
  }) async {
    final $payload = <String, dynamic>{
      if (attributes != null) 'attributes': attributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a project associated with your AWS account and region. With the
  /// exception of device template names, you can pass just the values that need
  /// to be updated because the update request will change only the values that
  /// are provided. To clear a value, pass the empty string (i.e.,
  /// <code>""</code>).
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [projectName] :
  /// The name of the project to be updated.
  ///
  /// Parameter [description] :
  /// An optional user-defined description for the project.
  ///
  /// Parameter [placementTemplate] :
  /// An object defining the project update. Once a project has been created,
  /// you cannot add device template names to the project. However, for a given
  /// <code>placementTemplate</code>, you can update the associated
  /// <code>callbackOverrides</code> for the device definition using this API.
  Future<void> updateProject({
    required String projectName,
    String? description,
    PlacementTemplate? placementTemplate,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (placementTemplate != null) 'placementTemplate': placementTemplate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AssociateDeviceWithPlacementResponse {
  AssociateDeviceWithPlacementResponse();

  factory AssociateDeviceWithPlacementResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateDeviceWithPlacementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreatePlacementResponse {
  CreatePlacementResponse();

  factory CreatePlacementResponse.fromJson(Map<String, dynamic> _) {
    return CreatePlacementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateProjectResponse {
  CreateProjectResponse();

  factory CreateProjectResponse.fromJson(Map<String, dynamic> _) {
    return CreateProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePlacementResponse {
  DeletePlacementResponse();

  factory DeletePlacementResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlacementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectResponse {
  DeleteProjectResponse();

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribePlacementResponse {
  /// An object describing the placement.
  final PlacementDescription placement;

  DescribePlacementResponse({
    required this.placement,
  });

  factory DescribePlacementResponse.fromJson(Map<String, dynamic> json) {
    return DescribePlacementResponse(
      placement: PlacementDescription.fromJson(
          json['placement'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final placement = this.placement;
    return {
      'placement': placement,
    };
  }
}

class DescribeProjectResponse {
  /// An object describing the project.
  final ProjectDescription project;

  DescribeProjectResponse({
    required this.project,
  });

  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResponse(
      project:
          ProjectDescription.fromJson(json['project'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

/// An object representing a device for a placement template (see
/// <a>PlacementTemplate</a>).
class DeviceTemplate {
  /// An optional Lambda function to invoke instead of the default Lambda function
  /// provided by the placement template.
  final Map<String, String>? callbackOverrides;

  /// The device type, which currently must be <code>"button"</code>.
  final String? deviceType;

  DeviceTemplate({
    this.callbackOverrides,
    this.deviceType,
  });

  factory DeviceTemplate.fromJson(Map<String, dynamic> json) {
    return DeviceTemplate(
      callbackOverrides: (json['callbackOverrides'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      deviceType: json['deviceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackOverrides = this.callbackOverrides;
    final deviceType = this.deviceType;
    return {
      if (callbackOverrides != null) 'callbackOverrides': callbackOverrides,
      if (deviceType != null) 'deviceType': deviceType,
    };
  }
}

class DisassociateDeviceFromPlacementResponse {
  DisassociateDeviceFromPlacementResponse();

  factory DisassociateDeviceFromPlacementResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateDeviceFromPlacementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetDevicesInPlacementResponse {
  /// An object containing the devices (zero or more) within the placement.
  final Map<String, String> devices;

  GetDevicesInPlacementResponse({
    required this.devices,
  });

  factory GetDevicesInPlacementResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicesInPlacementResponse(
      devices: (json['devices'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    return {
      'devices': devices,
    };
  }
}

class ListPlacementsResponse {
  /// An object listing the requested placements.
  final List<PlacementSummary> placements;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  final String? nextToken;

  ListPlacementsResponse({
    required this.placements,
    this.nextToken,
  });

  factory ListPlacementsResponse.fromJson(Map<String, dynamic> json) {
    return ListPlacementsResponse(
      placements: (json['placements'] as List)
          .whereNotNull()
          .map((e) => PlacementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final placements = this.placements;
    final nextToken = this.nextToken;
    return {
      'placements': placements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// An object containing the list of projects.
  final List<ProjectSummary> projects;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  final String? nextToken;

  ListProjectsResponse({
    required this.projects,
    this.nextToken,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      projects: (json['projects'] as List)
          .whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projects = this.projects;
    final nextToken = this.nextToken;
    return {
      'projects': projects,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags (metadata key/value pairs) which you have assigned to the resource.
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

/// An object describing a project's placement.
class PlacementDescription {
  /// The user-defined attributes associated with the placement.
  final Map<String, String> attributes;

  /// The date when the placement was initially created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The name of the placement.
  final String placementName;

  /// The name of the project containing the placement.
  final String projectName;

  /// The date when the placement was last updated, in UNIX epoch time format. If
  /// the placement was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  final DateTime updatedDate;

  PlacementDescription({
    required this.attributes,
    required this.createdDate,
    required this.placementName,
    required this.projectName,
    required this.updatedDate,
  });

  factory PlacementDescription.fromJson(Map<String, dynamic> json) {
    return PlacementDescription(
      attributes: (json['attributes'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      placementName: json['placementName'] as String,
      projectName: json['projectName'] as String,
      updatedDate: nonNullableTimeStampFromJson(json['updatedDate'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final createdDate = this.createdDate;
    final placementName = this.placementName;
    final projectName = this.projectName;
    final updatedDate = this.updatedDate;
    return {
      'attributes': attributes,
      'createdDate': unixTimestampToJson(createdDate),
      'placementName': placementName,
      'projectName': projectName,
      'updatedDate': unixTimestampToJson(updatedDate),
    };
  }
}

/// An object providing summary information for a particular placement.
class PlacementSummary {
  /// The date when the placement was originally created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The name of the placement being summarized.
  final String placementName;

  /// The name of the project containing the placement.
  final String projectName;

  /// The date when the placement was last updated, in UNIX epoch time format. If
  /// the placement was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  final DateTime updatedDate;

  PlacementSummary({
    required this.createdDate,
    required this.placementName,
    required this.projectName,
    required this.updatedDate,
  });

  factory PlacementSummary.fromJson(Map<String, dynamic> json) {
    return PlacementSummary(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      placementName: json['placementName'] as String,
      projectName: json['projectName'] as String,
      updatedDate: nonNullableTimeStampFromJson(json['updatedDate'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final placementName = this.placementName;
    final projectName = this.projectName;
    final updatedDate = this.updatedDate;
    return {
      'createdDate': unixTimestampToJson(createdDate),
      'placementName': placementName,
      'projectName': projectName,
      'updatedDate': unixTimestampToJson(updatedDate),
    };
  }
}

/// An object defining the template for a placement.
class PlacementTemplate {
  /// The default attributes (key/value pairs) to be applied to all placements
  /// using this template.
  final Map<String, String>? defaultAttributes;

  /// An object specifying the <a>DeviceTemplate</a> for all placements using this
  /// (<a>PlacementTemplate</a>) template.
  final Map<String, DeviceTemplate>? deviceTemplates;

  PlacementTemplate({
    this.defaultAttributes,
    this.deviceTemplates,
  });

  factory PlacementTemplate.fromJson(Map<String, dynamic> json) {
    return PlacementTemplate(
      defaultAttributes: (json['defaultAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      deviceTemplates: (json['deviceTemplates'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, DeviceTemplate.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAttributes = this.defaultAttributes;
    final deviceTemplates = this.deviceTemplates;
    return {
      if (defaultAttributes != null) 'defaultAttributes': defaultAttributes,
      if (deviceTemplates != null) 'deviceTemplates': deviceTemplates,
    };
  }
}

/// An object providing detailed information for a particular project associated
/// with an AWS account and region.
class ProjectDescription {
  /// The date when the project was originally created, in UNIX epoch time format.
  final DateTime createdDate;

  /// The name of the project for which to obtain information from.
  final String projectName;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  final DateTime updatedDate;

  /// The ARN of the project.
  final String? arn;

  /// The description of the project.
  final String? description;

  /// An object describing the project's placement specifications.
  final PlacementTemplate? placementTemplate;

  /// The tags (metadata key/value pairs) associated with the project.
  final Map<String, String>? tags;

  ProjectDescription({
    required this.createdDate,
    required this.projectName,
    required this.updatedDate,
    this.arn,
    this.description,
    this.placementTemplate,
    this.tags,
  });

  factory ProjectDescription.fromJson(Map<String, dynamic> json) {
    return ProjectDescription(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      projectName: json['projectName'] as String,
      updatedDate: nonNullableTimeStampFromJson(json['updatedDate'] as Object),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      placementTemplate: json['placementTemplate'] != null
          ? PlacementTemplate.fromJson(
              json['placementTemplate'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final projectName = this.projectName;
    final updatedDate = this.updatedDate;
    final arn = this.arn;
    final description = this.description;
    final placementTemplate = this.placementTemplate;
    final tags = this.tags;
    return {
      'createdDate': unixTimestampToJson(createdDate),
      'projectName': projectName,
      'updatedDate': unixTimestampToJson(updatedDate),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (placementTemplate != null) 'placementTemplate': placementTemplate,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object providing summary information for a particular project for an
/// associated AWS account and region.
class ProjectSummary {
  /// The date when the project was originally created, in UNIX epoch time format.
  final DateTime createdDate;

  /// The name of the project being summarized.
  final String projectName;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  final DateTime updatedDate;

  /// The ARN of the project.
  final String? arn;

  /// The tags (metadata key/value pairs) associated with the project.
  final Map<String, String>? tags;

  ProjectSummary({
    required this.createdDate,
    required this.projectName,
    required this.updatedDate,
    this.arn,
    this.tags,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      createdDate: nonNullableTimeStampFromJson(json['createdDate'] as Object),
      projectName: json['projectName'] as String,
      updatedDate: nonNullableTimeStampFromJson(json['updatedDate'] as Object),
      arn: json['arn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final projectName = this.projectName;
    final updatedDate = this.updatedDate;
    final arn = this.arn;
    final tags = this.tags;
    return {
      'createdDate': unixTimestampToJson(createdDate),
      'projectName': projectName,
      'updatedDate': unixTimestampToJson(updatedDate),
      if (arn != null) 'arn': arn,
      if (tags != null) 'tags': tags,
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

class UpdatePlacementResponse {
  UpdatePlacementResponse();

  factory UpdatePlacementResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePlacementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateProjectResponse {
  UpdateProjectResponse();

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
