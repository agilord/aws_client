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

part '2018-05-14.g.dart';

/// The AWS IoT 1-Click Projects API Reference
class IoT1ClickProjects {
  final _s.RestJsonProtocol _protocol;
  IoT1ClickProjects({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'projects.iot1click',
            signingName: 'iot1click',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String deviceId,
    @_s.required String deviceTemplateName,
    @_s.required String placementName,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceTemplateName, 'deviceTemplateName');
    _s.validateStringLength(
      'deviceTemplateName',
      deviceTemplateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceTemplateName',
      deviceTemplateName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    return AssociateDeviceWithPlacementResponse.fromJson(response);
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
    @_s.required String placementName,
    @_s.required String projectName,
    Map<String, String> attributes,
  }) async {
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    return CreatePlacementResponse.fromJson(response);
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
    @_s.required String projectName,
    String description,
    PlacementTemplate placementTemplate,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
    );
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
    return CreateProjectResponse.fromJson(response);
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
    @_s.required String placementName,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePlacementResponse.fromJson(response);
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
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(projectName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResponse.fromJson(response);
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
    @_s.required String placementName,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    @_s.required String deviceTemplateName,
    @_s.required String placementName,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(deviceTemplateName, 'deviceTemplateName');
    _s.validateStringLength(
      'deviceTemplateName',
      deviceTemplateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceTemplateName',
      deviceTemplateName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(projectName)}/placements/${Uri.encodeComponent(placementName)}/devices/${Uri.encodeComponent(deviceTemplateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateDeviceFromPlacementResponse.fromJson(response);
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
    @_s.required String placementName,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    @_s.required String projectName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:iot1click:[A-Za-z0-9_/.-]{0,63}:\d+:projects/[0-9A-Za-z_-]{1,128}$''',
      isRequired: true,
    );
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:iot1click:[A-Za-z0-9_/.-]{0,63}:\d+:projects/[0-9A-Za-z_-]{1,128}$''',
      isRequired: true,
    );
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:iot1click:[A-Za-z0-9_/.-]{0,63}:\d+:projects/[0-9A-Za-z_-]{1,128}$''',
      isRequired: true,
    );
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
    @_s.required String placementName,
    @_s.required String projectName,
    Map<String, String> attributes,
  }) async {
    ArgumentError.checkNotNull(placementName, 'placementName');
    _s.validateStringLength(
      'placementName',
      placementName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'placementName',
      placementName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
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
    return UpdatePlacementResponse.fromJson(response);
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
    @_s.required String projectName,
    String description,
    PlacementTemplate placementTemplate,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
    );
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
    return UpdateProjectResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDeviceWithPlacementResponse {
  AssociateDeviceWithPlacementResponse();
  factory AssociateDeviceWithPlacementResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateDeviceWithPlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePlacementResponse {
  CreatePlacementResponse();
  factory CreatePlacementResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResponse {
  CreateProjectResponse();
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePlacementResponse {
  DeletePlacementResponse();
  factory DeletePlacementResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResponse {
  DeleteProjectResponse();
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePlacementResponse {
  /// An object describing the placement.
  @_s.JsonKey(name: 'placement')
  final PlacementDescription placement;

  DescribePlacementResponse({
    @_s.required this.placement,
  });
  factory DescribePlacementResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResponse {
  /// An object describing the project.
  @_s.JsonKey(name: 'project')
  final ProjectDescription project;

  DescribeProjectResponse({
    @_s.required this.project,
  });
  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResponseFromJson(json);
}

/// An object representing a device for a placement template (see
/// <a>PlacementTemplate</a>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceTemplate {
  /// An optional Lambda function to invoke instead of the default Lambda function
  /// provided by the placement template.
  @_s.JsonKey(name: 'callbackOverrides')
  final Map<String, String> callbackOverrides;

  /// The device type, which currently must be <code>"button"</code>.
  @_s.JsonKey(name: 'deviceType')
  final String deviceType;

  DeviceTemplate({
    this.callbackOverrides,
    this.deviceType,
  });
  factory DeviceTemplate.fromJson(Map<String, dynamic> json) =>
      _$DeviceTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTemplateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDeviceFromPlacementResponse {
  DisassociateDeviceFromPlacementResponse();
  factory DisassociateDeviceFromPlacementResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateDeviceFromPlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicesInPlacementResponse {
  /// An object containing the devices (zero or more) within the placement.
  @_s.JsonKey(name: 'devices')
  final Map<String, String> devices;

  GetDevicesInPlacementResponse({
    @_s.required this.devices,
  });
  factory GetDevicesInPlacementResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevicesInPlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPlacementsResponse {
  /// An object listing the requested placements.
  @_s.JsonKey(name: 'placements')
  final List<PlacementSummary> placements;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListPlacementsResponse({
    @_s.required this.placements,
    this.nextToken,
  });
  factory ListPlacementsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPlacementsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResponse {
  /// An object containing the list of projects.
  @_s.JsonKey(name: 'projects')
  final List<ProjectSummary> projects;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProjectsResponse({
    @_s.required this.projects,
    this.nextToken,
  });
  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags (metadata key/value pairs) which you have assigned to the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// An object describing a project's placement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlacementDescription {
  /// The user-defined attributes associated with the placement.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The date when the placement was initially created, in UNIX epoch time
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the placement.
  @_s.JsonKey(name: 'placementName')
  final String placementName;

  /// The name of the project containing the placement.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The date when the placement was last updated, in UNIX epoch time format. If
  /// the placement was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedDate')
  final DateTime updatedDate;

  PlacementDescription({
    @_s.required this.attributes,
    @_s.required this.createdDate,
    @_s.required this.placementName,
    @_s.required this.projectName,
    @_s.required this.updatedDate,
  });
  factory PlacementDescription.fromJson(Map<String, dynamic> json) =>
      _$PlacementDescriptionFromJson(json);
}

/// An object providing summary information for a particular placement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlacementSummary {
  /// The date when the placement was originally created, in UNIX epoch time
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the placement being summarized.
  @_s.JsonKey(name: 'placementName')
  final String placementName;

  /// The name of the project containing the placement.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The date when the placement was last updated, in UNIX epoch time format. If
  /// the placement was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedDate')
  final DateTime updatedDate;

  PlacementSummary({
    @_s.required this.createdDate,
    @_s.required this.placementName,
    @_s.required this.projectName,
    @_s.required this.updatedDate,
  });
  factory PlacementSummary.fromJson(Map<String, dynamic> json) =>
      _$PlacementSummaryFromJson(json);
}

/// An object defining the template for a placement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlacementTemplate {
  /// The default attributes (key/value pairs) to be applied to all placements
  /// using this template.
  @_s.JsonKey(name: 'defaultAttributes')
  final Map<String, String> defaultAttributes;

  /// An object specifying the <a>DeviceTemplate</a> for all placements using this
  /// (<a>PlacementTemplate</a>) template.
  @_s.JsonKey(name: 'deviceTemplates')
  final Map<String, DeviceTemplate> deviceTemplates;

  PlacementTemplate({
    this.defaultAttributes,
    this.deviceTemplates,
  });
  factory PlacementTemplate.fromJson(Map<String, dynamic> json) =>
      _$PlacementTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$PlacementTemplateToJson(this);
}

/// An object providing detailed information for a particular project associated
/// with an AWS account and region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectDescription {
  /// The date when the project was originally created, in UNIX epoch time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the project for which to obtain information from.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedDate')
  final DateTime updatedDate;

  /// The ARN of the project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The description of the project.
  @_s.JsonKey(name: 'description')
  final String description;

  /// An object describing the project's placement specifications.
  @_s.JsonKey(name: 'placementTemplate')
  final PlacementTemplate placementTemplate;

  /// The tags (metadata key/value pairs) associated with the project.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ProjectDescription({
    @_s.required this.createdDate,
    @_s.required this.projectName,
    @_s.required this.updatedDate,
    this.arn,
    this.description,
    this.placementTemplate,
    this.tags,
  });
  factory ProjectDescription.fromJson(Map<String, dynamic> json) =>
      _$ProjectDescriptionFromJson(json);
}

/// An object providing summary information for a particular project for an
/// associated AWS account and region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectSummary {
  /// The date when the project was originally created, in UNIX epoch time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the project being summarized.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then <code>createdDate</code> and
  /// <code>updatedDate</code> are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedDate')
  final DateTime updatedDate;

  /// The ARN of the project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The tags (metadata key/value pairs) associated with the project.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ProjectSummary({
    @_s.required this.createdDate,
    @_s.required this.projectName,
    @_s.required this.updatedDate,
    this.arn,
    this.tags,
  });
  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePlacementResponse {
  UpdatePlacementResponse();
  factory UpdatePlacementResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlacementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResponse {
  UpdateProjectResponse();
  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResponseFromJson(json);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String type, String message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
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
