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

/// IoT TwinMaker is a service that enables you to build operational digital
/// twins of physical systems. IoT TwinMaker overlays measurements and analysis
/// from real-world sensors, cameras, and enterprise applications so you can
/// create data visualizations to monitor your physical factory, building, or
/// industrial plant. You can use this real-world data to monitor operations and
/// diagnose and repair errors.
class IoTTwinMaker {
  final _s.RestJsonProtocol _protocol;
  IoTTwinMaker({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iottwinmaker',
            signingName: 'iottwinmaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Sets values for multiple time series properties.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entries] :
  /// An object that maps strings to the property value entries to set. Each
  /// string in the mapping must be unique to this object.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the properties to set.
  Future<BatchPutPropertyValuesResponse> batchPutPropertyValues({
    required List<PropertyValueEntry> entries,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entity-properties',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutPropertyValuesResponse.fromJson(response);
  }

  /// Creates a component type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the component type.
  ///
  /// Parameter [description] :
  /// The description of the component type.
  ///
  /// Parameter [extendsFrom] :
  /// Specifies the parent component type to extend.
  ///
  /// Parameter [functions] :
  /// An object that maps strings to the functions in the component type. Each
  /// string in the mapping must be unique to this object.
  ///
  /// Parameter [isSingleton] :
  /// A Boolean value that specifies whether an entity can have more than one
  /// component of this type.
  ///
  /// Parameter [propertyDefinitions] :
  /// An object that maps strings to the property definitions in the component
  /// type. Each string in the mapping must be unique to this object.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the component type.
  Future<CreateComponentTypeResponse> createComponentType({
    required String componentTypeId,
    required String workspaceId,
    String? description,
    List<String>? extendsFrom,
    Map<String, FunctionRequest>? functions,
    bool? isSingleton,
    Map<String, PropertyDefinitionRequest>? propertyDefinitions,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(componentTypeId, 'componentTypeId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/component-types/${Uri.encodeComponent(componentTypeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComponentTypeResponse.fromJson(response);
  }

  /// Creates an entity.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [entityName] :
  /// The name of the entity.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the entity.
  ///
  /// Parameter [components] :
  /// An object that maps strings to the components in the entity. Each string
  /// in the mapping must be unique to this object.
  ///
  /// Parameter [description] :
  /// The description of the entity.
  ///
  /// Parameter [entityId] :
  /// The ID of the entity.
  ///
  /// Parameter [parentEntityId] :
  /// The ID of the entity's parent entity.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the entity.
  Future<CreateEntityResponse> createEntity({
    required String entityName,
    required String workspaceId,
    Map<String, ComponentRequest>? components,
    String? description,
    String? entityId,
    String? parentEntityId,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(entityName, 'entityName');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      'entityName': entityName,
      if (components != null) 'components': components,
      if (description != null) 'description': description,
      if (entityId != null) 'entityId': entityId,
      if (parentEntityId != null) 'parentEntityId': parentEntityId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/entities',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEntityResponse.fromJson(response);
  }

  /// Creates a scene.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [contentLocation] :
  /// The relative path that specifies the location of the content definition
  /// file.
  ///
  /// Parameter [sceneId] :
  /// The ID of the scene.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the scene.
  ///
  /// Parameter [capabilities] :
  /// A list of capabilities that the scene uses to render itself.
  ///
  /// Parameter [description] :
  /// The description for this scene.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the scene.
  Future<CreateSceneResponse> createScene({
    required String contentLocation,
    required String sceneId,
    required String workspaceId,
    List<String>? capabilities,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(contentLocation, 'contentLocation');
    ArgumentError.checkNotNull(sceneId, 'sceneId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      'contentLocation': contentLocation,
      'sceneId': sceneId,
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSceneResponse.fromJson(response);
  }

  /// Creates a workplace.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [role] :
  /// The ARN of the execution role associated with the workspace.
  ///
  /// Parameter [s3Location] :
  /// The ARN of the S3 bucket where resources associated with the workspace are
  /// stored.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [description] :
  /// The description of the workspace.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the workspace
  Future<CreateWorkspaceResponse> createWorkspace({
    required String role,
    required String s3Location,
    required String workspaceId,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(role, 'role');
    ArgumentError.checkNotNull(s3Location, 's3Location');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      'role': role,
      's3Location': s3Location,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceResponse.fromJson(response);
  }

  /// Deletes a component type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the component type.
  Future<DeleteComponentTypeResponse> deleteComponentType({
    required String componentTypeId,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(componentTypeId, 'componentTypeId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/component-types/${Uri.encodeComponent(componentTypeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteComponentTypeResponse.fromJson(response);
  }

  /// Deletes an entity.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [entityId] :
  /// The ID of the entity to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the entity to delete.
  ///
  /// Parameter [isRecursive] :
  /// A Boolean value that specifies whether the operation deletes child
  /// entities.
  Future<DeleteEntityResponse> deleteEntity({
    required String entityId,
    required String workspaceId,
    bool? isRecursive,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $query = <String, List<String>>{
      if (isRecursive != null) 'isRecursive': [isRecursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities/${Uri.encodeComponent(entityId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEntityResponse.fromJson(response);
  }

  /// Deletes a scene.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sceneId] :
  /// The ID of the scene to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  Future<void> deleteScene({
    required String sceneId,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(sceneId, 'sceneId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes/${Uri.encodeComponent(sceneId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete.
  Future<void> deleteWorkspace({
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about a component type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the component type.
  Future<GetComponentTypeResponse> getComponentType({
    required String componentTypeId,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(componentTypeId, 'componentTypeId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/component-types/${Uri.encodeComponent(componentTypeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentTypeResponse.fromJson(response);
  }

  /// Retrieves information about an entity.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [entityId] :
  /// The ID of the entity.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  Future<GetEntityResponse> getEntity({
    required String entityId,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities/${Uri.encodeComponent(entityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEntityResponse.fromJson(response);
  }

  /// Gets the property values for a component, component type, entity, or
  /// workspace.
  ///
  /// You must specify a value for either <code>componentName</code>,
  /// <code>componentTypeId</code>, <code>entityId</code>, or
  /// <code>workspaceId</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConnectorFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConnectorTimeoutException].
  ///
  /// Parameter [selectedProperties] :
  /// The properties whose values the operation returns.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace whose values the operation returns.
  ///
  /// Parameter [componentName] :
  /// The name of the component whose property values the operation returns.
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type whose property values the operation returns.
  ///
  /// Parameter [entityId] :
  /// The ID of the entity whose property values the operation returns.
  Future<GetPropertyValueResponse> getPropertyValue({
    required List<String> selectedProperties,
    required String workspaceId,
    String? componentName,
    String? componentTypeId,
    String? entityId,
  }) async {
    ArgumentError.checkNotNull(selectedProperties, 'selectedProperties');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      'selectedProperties': selectedProperties,
      if (componentName != null) 'componentName': componentName,
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (entityId != null) 'entityId': entityId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entity-properties/value',
      exceptionFnMap: _exceptionFns,
    );
    return GetPropertyValueResponse.fromJson(response);
  }

  /// Retrieves information about the history of a time series property value
  /// for a component, component type, entity, or workspace.
  ///
  /// You must specify a value for <code>workspaceId</code>. For entity-specific
  /// queries, specify values for <code>componentName</code> and
  /// <code>entityId</code>. For cross-entity quries, specify a value for
  /// <code>componentTypeId</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConnectorFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConnectorTimeoutException].
  ///
  /// Parameter [selectedProperties] :
  /// A list of properties whose value histories the request retrieves.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type.
  ///
  /// Parameter [endDateTime] :
  /// The date and time of the latest property value to return.
  ///
  /// Parameter [endTime] :
  /// The ISO8601 DateTime of the latest property value to return.
  ///
  /// For more information about the ISO8601 DateTime format, see the data type
  /// <a
  /// href="https://docs.aws.amazon.com/roci/latest/roci-api/API_PropertyValue.html">PropertyValue</a>.
  ///
  /// Parameter [entityId] :
  /// The ID of the entity.
  ///
  /// Parameter [interpolation] :
  /// An object that specifies the interpolation type and the interval over
  /// which to interpolate data.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  ///
  /// Parameter [orderByTime] :
  /// The time direction to use in the result order.
  ///
  /// Parameter [propertyFilters] :
  /// A list of objects that filter the property value history request.
  ///
  /// Parameter [startDateTime] :
  /// The date and time of the earliest property value to return.
  ///
  /// Parameter [startTime] :
  /// The ISO8601 DateTime of the earliest property value to return.
  ///
  /// For more information about the ISO8601 DateTime format, see the data type
  /// <a
  /// href="https://docs.aws.amazon.com/roci/latest/roci-api/API_PropertyValue.html">PropertyValue</a>.
  Future<GetPropertyValueHistoryResponse> getPropertyValueHistory({
    required List<String> selectedProperties,
    required String workspaceId,
    String? componentName,
    String? componentTypeId,
    DateTime? endDateTime,
    String? endTime,
    String? entityId,
    InterpolationParameters? interpolation,
    int? maxResults,
    String? nextToken,
    OrderByTime? orderByTime,
    List<PropertyFilter>? propertyFilters,
    DateTime? startDateTime,
    String? startTime,
  }) async {
    ArgumentError.checkNotNull(selectedProperties, 'selectedProperties');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      'selectedProperties': selectedProperties,
      if (componentName != null) 'componentName': componentName,
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (endDateTime != null) 'endDateTime': unixTimestampToJson(endDateTime),
      if (endTime != null) 'endTime': endTime,
      if (entityId != null) 'entityId': entityId,
      if (interpolation != null) 'interpolation': interpolation,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (orderByTime != null) 'orderByTime': orderByTime.toValue(),
      if (propertyFilters != null) 'propertyFilters': propertyFilters,
      if (startDateTime != null)
        'startDateTime': unixTimestampToJson(startDateTime),
      if (startTime != null) 'startTime': startTime,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entity-properties/history',
      exceptionFnMap: _exceptionFns,
    );
    return GetPropertyValueHistoryResponse.fromJson(response);
  }

  /// Retrieves information about a scene.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sceneId] :
  /// The ID of the scene.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the scene.
  Future<GetSceneResponse> getScene({
    required String sceneId,
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(sceneId, 'sceneId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes/${Uri.encodeComponent(sceneId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSceneResponse.fromJson(response);
  }

  /// Retrieves information about a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  Future<GetWorkspaceResponse> getWorkspace({
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkspaceResponse.fromJson(response);
  }

  /// Lists all component types in a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [filters] :
  /// A list of objects that filter the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListComponentTypesResponse> listComponentTypes({
    required String workspaceId,
    List<ListComponentTypesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/component-types-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentTypesResponse.fromJson(response);
  }

  /// Lists all entities in a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [filters] :
  /// A list of objects that filter the request.
  /// <note>
  /// Only one object is accepted as a valid input.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListEntitiesResponse> listEntities({
    required String workspaceId,
    List<ListEntitiesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListEntitiesResponse.fromJson(response);
  }

  /// Lists all scenes in a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the scenes.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListScenesResponse> listScenes({
    required String workspaceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListScenesResponse.fromJson(response);
  }

  /// Lists all tags associated with a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Retrieves information about workspaces in the current account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListWorkspacesResponse> listWorkspaces({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspacesResponse.fromJson(response);
  }

  /// Adds tags to a resource.
  ///
  /// May throw [TooManyTagsException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// Metadata to add to this resource.
  Future<void> tagResource({
    required String resourceARN,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag key names to remove from the resource. You don't specify the
  /// value. Both the key and its associated value are removed.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'resourceARN': [resourceARN],
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates information in a component type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the component type.
  ///
  /// Parameter [description] :
  /// The description of the component type.
  ///
  /// Parameter [extendsFrom] :
  /// Specifies the component type that this component type extends.
  ///
  /// Parameter [functions] :
  /// An object that maps strings to the functions in the component type. Each
  /// string in the mapping must be unique to this object.
  ///
  /// Parameter [isSingleton] :
  /// A Boolean value that specifies whether an entity can have more than one
  /// component of this type.
  ///
  /// Parameter [propertyDefinitions] :
  /// An object that maps strings to the property definitions in the component
  /// type. Each string in the mapping must be unique to this object.
  Future<UpdateComponentTypeResponse> updateComponentType({
    required String componentTypeId,
    required String workspaceId,
    String? description,
    List<String>? extendsFrom,
    Map<String, FunctionRequest>? functions,
    bool? isSingleton,
    Map<String, PropertyDefinitionRequest>? propertyDefinitions,
  }) async {
    ArgumentError.checkNotNull(componentTypeId, 'componentTypeId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/component-types/${Uri.encodeComponent(componentTypeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateComponentTypeResponse.fromJson(response);
  }

  /// Updates an entity.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [entityId] :
  /// The ID of the entity.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the entity.
  ///
  /// Parameter [componentUpdates] :
  /// An object that maps strings to the component updates in the request. Each
  /// string in the mapping must be unique to this object.
  ///
  /// Parameter [description] :
  /// The description of the entity.
  ///
  /// Parameter [entityName] :
  /// The name of the entity.
  ///
  /// Parameter [parentEntityUpdate] :
  /// An object that describes the update request for a parent entity.
  Future<UpdateEntityResponse> updateEntity({
    required String entityId,
    required String workspaceId,
    Map<String, ComponentUpdateRequest>? componentUpdates,
    String? description,
    String? entityName,
    ParentEntityUpdateRequest? parentEntityUpdate,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      if (componentUpdates != null) 'componentUpdates': componentUpdates,
      if (description != null) 'description': description,
      if (entityName != null) 'entityName': entityName,
      if (parentEntityUpdate != null) 'parentEntityUpdate': parentEntityUpdate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities/${Uri.encodeComponent(entityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEntityResponse.fromJson(response);
  }

  /// Updates a scene.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sceneId] :
  /// The ID of the scene.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the scene.
  ///
  /// Parameter [capabilities] :
  /// A list of capabilities that the scene uses to render.
  ///
  /// Parameter [contentLocation] :
  /// The relative path that specifies the location of the content definition
  /// file.
  ///
  /// Parameter [description] :
  /// The description of this scene.
  Future<UpdateSceneResponse> updateScene({
    required String sceneId,
    required String workspaceId,
    List<String>? capabilities,
    String? contentLocation,
    String? description,
  }) async {
    ArgumentError.checkNotNull(sceneId, 'sceneId');
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      if (capabilities != null) 'capabilities': capabilities,
      if (contentLocation != null) 'contentLocation': contentLocation,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes/${Uri.encodeComponent(sceneId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSceneResponse.fromJson(response);
  }

  /// Updates a workspace.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [description] :
  /// The description of the workspace.
  ///
  /// Parameter [role] :
  /// The ARN of the execution role associated with the workspace.
  Future<UpdateWorkspaceResponse> updateWorkspace({
    required String workspaceId,
    String? description,
    String? role,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (role != null) 'role': role,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkspaceResponse.fromJson(response);
  }
}

/// An error returned by the <code>BatchPutProperty</code> action.
class BatchPutPropertyError {
  /// An object that contains information about errors returned by the
  /// <code>BatchPutProperty</code> action.
  final PropertyValueEntry entry;

  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  BatchPutPropertyError({
    required this.entry,
    required this.errorCode,
    required this.errorMessage,
  });

  factory BatchPutPropertyError.fromJson(Map<String, dynamic> json) {
    return BatchPutPropertyError(
      entry: PropertyValueEntry.fromJson(json['entry'] as Map<String, dynamic>),
      errorCode: json['errorCode'] as String,
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entry = this.entry;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'entry': entry,
      'errorCode': errorCode,
      'errorMessage': errorMessage,
    };
  }
}

/// An object that contains information about errors returned by the
/// <code>BatchPutProperty</code> action.
class BatchPutPropertyErrorEntry {
  /// A list of objects that contain information about errors returned by the
  /// <code>BatchPutProperty</code> action.
  final List<BatchPutPropertyError> errors;

  BatchPutPropertyErrorEntry({
    required this.errors,
  });

  factory BatchPutPropertyErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutPropertyErrorEntry(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => BatchPutPropertyError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

class BatchPutPropertyValuesResponse {
  /// Entries that caused errors in the batch put operation.
  final List<BatchPutPropertyErrorEntry> errorEntries;

  BatchPutPropertyValuesResponse({
    required this.errorEntries,
  });

  factory BatchPutPropertyValuesResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutPropertyValuesResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) =>
              BatchPutPropertyErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      'errorEntries': errorEntries,
    };
  }
}

/// An object that sets information about a component type create or update
/// request.
class ComponentRequest {
  /// The ID of the component type.
  final String? componentTypeId;

  /// The description of the component request.
  final String? description;

  /// An object that maps strings to the properties to set in the component type.
  /// Each string in the mapping must be unique to this object.
  final Map<String, PropertyRequest>? properties;

  ComponentRequest({
    this.componentTypeId,
    this.description,
    this.properties,
  });

  factory ComponentRequest.fromJson(Map<String, dynamic> json) {
    return ComponentRequest(
      componentTypeId: json['componentTypeId'] as String?,
      description: json['description'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PropertyRequest.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final description = this.description;
    final properties = this.properties;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
    };
  }
}

/// An object that returns information about a component type create or update
/// request.
class ComponentResponse {
  /// The name of the component.
  final String? componentName;

  /// The ID of the component type.
  final String? componentTypeId;

  /// The name of the property definition set in the request.
  final String? definedIn;

  /// The description of the component type.
  final String? description;

  /// An object that maps strings to the properties to set in the component type.
  /// Each string in the mapping must be unique to this object.
  final Map<String, PropertyResponse>? properties;

  /// The status of the component type.
  final Status? status;

  ComponentResponse({
    this.componentName,
    this.componentTypeId,
    this.definedIn,
    this.description,
    this.properties,
    this.status,
  });

  factory ComponentResponse.fromJson(Map<String, dynamic> json) {
    return ComponentResponse(
      componentName: json['componentName'] as String?,
      componentTypeId: json['componentTypeId'] as String?,
      definedIn: json['definedIn'] as String?,
      description: json['description'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PropertyResponse.fromJson(e as Map<String, dynamic>))),
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentTypeId = this.componentTypeId;
    final definedIn = this.definedIn;
    final description = this.description;
    final properties = this.properties;
    final status = this.status;
    return {
      if (componentName != null) 'componentName': componentName,
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (definedIn != null) 'definedIn': definedIn,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (status != null) 'status': status,
    };
  }
}

/// An object that contains information about a component type.
class ComponentTypeSummary {
  /// The ARN of the component type.
  final String arn;

  /// The ID of the component type.
  final String componentTypeId;

  /// The date and time when the component type was created.
  final DateTime creationDateTime;

  /// The date and time when the component type was last updated.
  final DateTime updateDateTime;

  /// The description of the component type.
  final String? description;

  /// The current status of the component type.
  final Status? status;

  ComponentTypeSummary({
    required this.arn,
    required this.componentTypeId,
    required this.creationDateTime,
    required this.updateDateTime,
    this.description,
    this.status,
  });

  factory ComponentTypeSummary.fromJson(Map<String, dynamic> json) {
    return ComponentTypeSummary(
      arn: json['arn'] as String,
      componentTypeId: json['componentTypeId'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      description: json['description'] as String?,
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentTypeId = this.componentTypeId;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final description = this.description;
    final status = this.status;
    return {
      'arn': arn,
      'componentTypeId': componentTypeId,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (description != null) 'description': description,
      if (status != null) 'status': status,
    };
  }
}

/// The component update request.
class ComponentUpdateRequest {
  /// The ID of the component type.
  final String? componentTypeId;

  /// The description of the component type.
  final String? description;

  /// An object that maps strings to the properties to set in the component type
  /// update. Each string in the mapping must be unique to this object.
  final Map<String, PropertyRequest>? propertyUpdates;

  /// The update type of the component update request.
  final ComponentUpdateType? updateType;

  ComponentUpdateRequest({
    this.componentTypeId,
    this.description,
    this.propertyUpdates,
    this.updateType,
  });

  factory ComponentUpdateRequest.fromJson(Map<String, dynamic> json) {
    return ComponentUpdateRequest(
      componentTypeId: json['componentTypeId'] as String?,
      description: json['description'] as String?,
      propertyUpdates: (json['propertyUpdates'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, PropertyRequest.fromJson(e as Map<String, dynamic>))),
      updateType: (json['updateType'] as String?)?.toComponentUpdateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final description = this.description;
    final propertyUpdates = this.propertyUpdates;
    final updateType = this.updateType;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (description != null) 'description': description,
      if (propertyUpdates != null) 'propertyUpdates': propertyUpdates,
      if (updateType != null) 'updateType': updateType.toValue(),
    };
  }
}

enum ComponentUpdateType {
  create,
  update,
  delete,
}

extension on ComponentUpdateType {
  String toValue() {
    switch (this) {
      case ComponentUpdateType.create:
        return 'CREATE';
      case ComponentUpdateType.update:
        return 'UPDATE';
      case ComponentUpdateType.delete:
        return 'DELETE';
    }
  }
}

extension on String {
  ComponentUpdateType toComponentUpdateType() {
    switch (this) {
      case 'CREATE':
        return ComponentUpdateType.create;
      case 'UPDATE':
        return ComponentUpdateType.update;
      case 'DELETE':
        return ComponentUpdateType.delete;
    }
    throw Exception('$this is not known in enum ComponentUpdateType');
  }
}

class CreateComponentTypeResponse {
  /// The ARN of the component type.
  final String arn;

  /// The date and time when the entity was created.
  final DateTime creationDateTime;

  /// The current state of the component type.
  final State state;

  CreateComponentTypeResponse({
    required this.arn,
    required this.creationDateTime,
    required this.state,
  });

  factory CreateComponentTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateComponentTypeResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      state: (json['state'] as String).toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final state = this.state;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'state': state.toValue(),
    };
  }
}

class CreateEntityResponse {
  /// The ARN of the entity.
  final String arn;

  /// The date and time when the entity was created.
  final DateTime creationDateTime;

  /// The ID of the entity.
  final String entityId;

  /// The current state of the entity.
  final State state;

  CreateEntityResponse({
    required this.arn,
    required this.creationDateTime,
    required this.entityId,
    required this.state,
  });

  factory CreateEntityResponse.fromJson(Map<String, dynamic> json) {
    return CreateEntityResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      entityId: json['entityId'] as String,
      state: (json['state'] as String).toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final entityId = this.entityId;
    final state = this.state;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'entityId': entityId,
      'state': state.toValue(),
    };
  }
}

class CreateSceneResponse {
  /// The ARN of the scene.
  final String arn;

  /// The date and time when the scene was created.
  final DateTime creationDateTime;

  CreateSceneResponse({
    required this.arn,
    required this.creationDateTime,
  });

  factory CreateSceneResponse.fromJson(Map<String, dynamic> json) {
    return CreateSceneResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
    };
  }
}

class CreateWorkspaceResponse {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time when the workspace was created.
  final DateTime creationDateTime;

  CreateWorkspaceResponse({
    required this.arn,
    required this.creationDateTime,
  });

  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
    };
  }
}

/// The data connector.
class DataConnector {
  /// A Boolean value that specifies whether the data connector is native to IoT
  /// TwinMaker.
  final bool? isNative;

  /// The Lambda function associated with this data connector.
  final LambdaFunction? lambda;

  DataConnector({
    this.isNative,
    this.lambda,
  });

  factory DataConnector.fromJson(Map<String, dynamic> json) {
    return DataConnector(
      isNative: json['isNative'] as bool?,
      lambda: json['lambda'] != null
          ? LambdaFunction.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final isNative = this.isNative;
    final lambda = this.lambda;
    return {
      if (isNative != null) 'isNative': isNative,
      if (lambda != null) 'lambda': lambda,
    };
  }
}

/// An object that specifies the data type of a property.
class DataType {
  /// The underlying type of the data type.
  final Type type;

  /// The allowed values for this data type.
  final List<DataValue>? allowedValues;

  /// The nested type in the data type.
  final DataType? nestedType;

  /// A relationship that associates a component with another component.
  final Relationship? relationship;

  /// The unit of measure used in this data type.
  final String? unitOfMeasure;

  DataType({
    required this.type,
    this.allowedValues,
    this.nestedType,
    this.relationship,
    this.unitOfMeasure,
  });

  factory DataType.fromJson(Map<String, dynamic> json) {
    return DataType(
      type: (json['type'] as String).toType(),
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => DataValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nestedType: json['nestedType'] != null
          ? DataType.fromJson(json['nestedType'] as Map<String, dynamic>)
          : null,
      relationship: json['relationship'] != null
          ? Relationship.fromJson(json['relationship'] as Map<String, dynamic>)
          : null,
      unitOfMeasure: json['unitOfMeasure'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final allowedValues = this.allowedValues;
    final nestedType = this.nestedType;
    final relationship = this.relationship;
    final unitOfMeasure = this.unitOfMeasure;
    return {
      'type': type.toValue(),
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (nestedType != null) 'nestedType': nestedType,
      if (relationship != null) 'relationship': relationship,
      if (unitOfMeasure != null) 'unitOfMeasure': unitOfMeasure,
    };
  }
}

/// An object that specifies a value for a property.
class DataValue {
  /// A Boolean value.
  final bool? booleanValue;

  /// A double value.
  final double? doubleValue;

  /// An expression that produces the value.
  final String? expression;

  /// An integer value.
  final int? integerValue;

  /// A list of multiple values.
  final List<DataValue>? listValue;

  /// A long value.
  final int? longValue;

  /// An object that maps strings to multiple <code>DataValue</code> objects.
  final Map<String, DataValue>? mapValue;

  /// A value that relates a component to another component.
  final RelationshipValue? relationshipValue;

  /// A string value.
  final String? stringValue;

  DataValue({
    this.booleanValue,
    this.doubleValue,
    this.expression,
    this.integerValue,
    this.listValue,
    this.longValue,
    this.mapValue,
    this.relationshipValue,
    this.stringValue,
  });

  factory DataValue.fromJson(Map<String, dynamic> json) {
    return DataValue(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      expression: json['expression'] as String?,
      integerValue: json['integerValue'] as int?,
      listValue: (json['listValue'] as List?)
          ?.whereNotNull()
          .map((e) => DataValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      longValue: json['longValue'] as int?,
      mapValue: (json['mapValue'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, DataValue.fromJson(e as Map<String, dynamic>))),
      relationshipValue: json['relationshipValue'] != null
          ? RelationshipValue.fromJson(
              json['relationshipValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final expression = this.expression;
    final integerValue = this.integerValue;
    final listValue = this.listValue;
    final longValue = this.longValue;
    final mapValue = this.mapValue;
    final relationshipValue = this.relationshipValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (expression != null) 'expression': expression,
      if (integerValue != null) 'integerValue': integerValue,
      if (listValue != null) 'listValue': listValue,
      if (longValue != null) 'longValue': longValue,
      if (mapValue != null) 'mapValue': mapValue,
      if (relationshipValue != null) 'relationshipValue': relationshipValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class DeleteComponentTypeResponse {
  /// The current state of the component type to be deleted.
  final State state;

  DeleteComponentTypeResponse({
    required this.state,
  });

  factory DeleteComponentTypeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteComponentTypeResponse(
      state: (json['state'] as String).toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.toValue(),
    };
  }
}

class DeleteEntityResponse {
  /// The current state of the deleted entity.
  final State state;

  DeleteEntityResponse({
    required this.state,
  });

  factory DeleteEntityResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEntityResponse(
      state: (json['state'] as String).toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.toValue(),
    };
  }
}

class DeleteSceneResponse {
  DeleteSceneResponse();

  factory DeleteSceneResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSceneResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkspaceResponse {
  DeleteWorkspaceResponse();

  factory DeleteWorkspaceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkspaceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that uniquely identifies an entity property.
class EntityPropertyReference {
  /// The name of the property.
  final String propertyName;

  /// The name of the component.
  final String? componentName;

  /// The ID of the entity.
  final String? entityId;

  /// A mapping of external IDs to property names. External IDs uniquely identify
  /// properties from external data stores.
  final Map<String, String>? externalIdProperty;

  EntityPropertyReference({
    required this.propertyName,
    this.componentName,
    this.entityId,
    this.externalIdProperty,
  });

  factory EntityPropertyReference.fromJson(Map<String, dynamic> json) {
    return EntityPropertyReference(
      propertyName: json['propertyName'] as String,
      componentName: json['componentName'] as String?,
      entityId: json['entityId'] as String?,
      externalIdProperty: (json['externalIdProperty'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyName = this.propertyName;
    final componentName = this.componentName;
    final entityId = this.entityId;
    final externalIdProperty = this.externalIdProperty;
    return {
      'propertyName': propertyName,
      if (componentName != null) 'componentName': componentName,
      if (entityId != null) 'entityId': entityId,
      if (externalIdProperty != null) 'externalIdProperty': externalIdProperty,
    };
  }
}

/// An object that contains information about an entity.
class EntitySummary {
  /// The ARN of the entity.
  final String arn;

  /// The date and time when the entity was created.
  final DateTime creationDateTime;

  /// The ID of the entity.
  final String entityId;

  /// The name of the entity.
  final String entityName;

  /// The current status of the entity.
  final Status status;

  /// The last date and time when the entity was updated.
  final DateTime updateDateTime;

  /// The description of the entity.
  final String? description;

  /// A Boolean value that specifies whether the entity has child entities or not.
  final bool? hasChildEntities;

  /// The ID of the parent entity.
  final String? parentEntityId;

  EntitySummary({
    required this.arn,
    required this.creationDateTime,
    required this.entityId,
    required this.entityName,
    required this.status,
    required this.updateDateTime,
    this.description,
    this.hasChildEntities,
    this.parentEntityId,
  });

  factory EntitySummary.fromJson(Map<String, dynamic> json) {
    return EntitySummary(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      entityId: json['entityId'] as String,
      entityName: json['entityName'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      description: json['description'] as String?,
      hasChildEntities: json['hasChildEntities'] as bool?,
      parentEntityId: json['parentEntityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final entityId = this.entityId;
    final entityName = this.entityName;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    final description = this.description;
    final hasChildEntities = this.hasChildEntities;
    final parentEntityId = this.parentEntityId;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'entityId': entityId,
      'entityName': entityName,
      'status': status,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (description != null) 'description': description,
      if (hasChildEntities != null) 'hasChildEntities': hasChildEntities,
      if (parentEntityId != null) 'parentEntityId': parentEntityId,
    };
  }
}

enum ErrorCode {
  validationError,
  internalFailure,
}

extension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case ErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'VALIDATION_ERROR':
        return ErrorCode.validationError;
      case 'INTERNAL_FAILURE':
        return ErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// The error details.
class ErrorDetails {
  /// The error code.
  final ErrorCode? code;

  /// The error message.
  final String? message;

  ErrorDetails({
    this.code,
    this.message,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      code: (json['code'] as String?)?.toErrorCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

/// The function request body.
class FunctionRequest {
  /// The data connector.
  final DataConnector? implementedBy;

  /// The required properties of the function.
  final List<String>? requiredProperties;

  /// The scope of the function.
  final Scope? scope;

  FunctionRequest({
    this.implementedBy,
    this.requiredProperties,
    this.scope,
  });

  factory FunctionRequest.fromJson(Map<String, dynamic> json) {
    return FunctionRequest(
      implementedBy: json['implementedBy'] != null
          ? DataConnector.fromJson(
              json['implementedBy'] as Map<String, dynamic>)
          : null,
      requiredProperties: (json['requiredProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      scope: (json['scope'] as String?)?.toScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final implementedBy = this.implementedBy;
    final requiredProperties = this.requiredProperties;
    final scope = this.scope;
    return {
      if (implementedBy != null) 'implementedBy': implementedBy,
      if (requiredProperties != null) 'requiredProperties': requiredProperties,
      if (scope != null) 'scope': scope.toValue(),
    };
  }
}

/// The function response.
class FunctionResponse {
  /// The data connector.
  final DataConnector? implementedBy;

  /// Indicates whether this function is inherited.
  final bool? isInherited;

  /// The required properties of the function.
  final List<String>? requiredProperties;

  /// The scope of the function.
  final Scope? scope;

  FunctionResponse({
    this.implementedBy,
    this.isInherited,
    this.requiredProperties,
    this.scope,
  });

  factory FunctionResponse.fromJson(Map<String, dynamic> json) {
    return FunctionResponse(
      implementedBy: json['implementedBy'] != null
          ? DataConnector.fromJson(
              json['implementedBy'] as Map<String, dynamic>)
          : null,
      isInherited: json['isInherited'] as bool?,
      requiredProperties: (json['requiredProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      scope: (json['scope'] as String?)?.toScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final implementedBy = this.implementedBy;
    final isInherited = this.isInherited;
    final requiredProperties = this.requiredProperties;
    final scope = this.scope;
    return {
      if (implementedBy != null) 'implementedBy': implementedBy,
      if (isInherited != null) 'isInherited': isInherited,
      if (requiredProperties != null) 'requiredProperties': requiredProperties,
      if (scope != null) 'scope': scope.toValue(),
    };
  }
}

class GetComponentTypeResponse {
  /// The ARN of the component type.
  final String arn;

  /// The ID of the component type.
  final String componentTypeId;

  /// The date and time when the component type was created.
  final DateTime creationDateTime;

  /// The date and time when the component was last updated.
  final DateTime updateDateTime;

  /// The ID of the workspace that contains the component type.
  final String workspaceId;

  /// The description of the component type.
  final String? description;

  /// The name of the parent component type that this component type extends.
  final List<String>? extendsFrom;

  /// An object that maps strings to the functions in the component type. Each
  /// string in the mapping must be unique to this object.
  final Map<String, FunctionResponse>? functions;

  /// A Boolean value that specifies whether the component type is abstract.
  final bool? isAbstract;

  /// A Boolean value that specifies whether the component type has a schema
  /// initializer and that the schema initializer has run.
  final bool? isSchemaInitialized;

  /// A Boolean value that specifies whether an entity can have more than one
  /// component of this type.
  final bool? isSingleton;

  /// An object that maps strings to the property definitions in the component
  /// type. Each string in the mapping must be unique to this object.
  final Map<String, PropertyDefinitionResponse>? propertyDefinitions;

  /// The current status of the component type.
  final Status? status;

  GetComponentTypeResponse({
    required this.arn,
    required this.componentTypeId,
    required this.creationDateTime,
    required this.updateDateTime,
    required this.workspaceId,
    this.description,
    this.extendsFrom,
    this.functions,
    this.isAbstract,
    this.isSchemaInitialized,
    this.isSingleton,
    this.propertyDefinitions,
    this.status,
  });

  factory GetComponentTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetComponentTypeResponse(
      arn: json['arn'] as String,
      componentTypeId: json['componentTypeId'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      description: json['description'] as String?,
      extendsFrom: (json['extendsFrom'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      functions: (json['functions'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, FunctionResponse.fromJson(e as Map<String, dynamic>))),
      isAbstract: json['isAbstract'] as bool?,
      isSchemaInitialized: json['isSchemaInitialized'] as bool?,
      isSingleton: json['isSingleton'] as bool?,
      propertyDefinitions: (json['propertyDefinitions']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k,
              PropertyDefinitionResponse.fromJson(e as Map<String, dynamic>))),
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentTypeId = this.componentTypeId;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final description = this.description;
    final extendsFrom = this.extendsFrom;
    final functions = this.functions;
    final isAbstract = this.isAbstract;
    final isSchemaInitialized = this.isSchemaInitialized;
    final isSingleton = this.isSingleton;
    final propertyDefinitions = this.propertyDefinitions;
    final status = this.status;
    return {
      'arn': arn,
      'componentTypeId': componentTypeId,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isAbstract != null) 'isAbstract': isAbstract,
      if (isSchemaInitialized != null)
        'isSchemaInitialized': isSchemaInitialized,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
      if (status != null) 'status': status,
    };
  }
}

class GetEntityResponse {
  /// The ARN of the entity.
  final String arn;

  /// The date and time when the entity was created.
  final DateTime creationDateTime;

  /// The ID of the entity.
  final String entityId;

  /// The name of the entity.
  final String entityName;

  /// A Boolean value that specifies whether the entity has associated child
  /// entities.
  final bool hasChildEntities;

  /// The ID of the parent entity for this entity.
  final String parentEntityId;

  /// The current status of the entity.
  final Status status;

  /// The date and time when the entity was last updated.
  final DateTime updateDateTime;

  /// The ID of the workspace.
  final String workspaceId;

  /// An object that maps strings to the components in the entity. Each string in
  /// the mapping must be unique to this object.
  final Map<String, ComponentResponse>? components;

  /// The description of the entity.
  final String? description;

  GetEntityResponse({
    required this.arn,
    required this.creationDateTime,
    required this.entityId,
    required this.entityName,
    required this.hasChildEntities,
    required this.parentEntityId,
    required this.status,
    required this.updateDateTime,
    required this.workspaceId,
    this.components,
    this.description,
  });

  factory GetEntityResponse.fromJson(Map<String, dynamic> json) {
    return GetEntityResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      entityId: json['entityId'] as String,
      entityName: json['entityName'] as String,
      hasChildEntities: json['hasChildEntities'] as bool,
      parentEntityId: json['parentEntityId'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      components: (json['components'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentResponse.fromJson(e as Map<String, dynamic>))),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final entityId = this.entityId;
    final entityName = this.entityName;
    final hasChildEntities = this.hasChildEntities;
    final parentEntityId = this.parentEntityId;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final components = this.components;
    final description = this.description;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'entityId': entityId,
      'entityName': entityName,
      'hasChildEntities': hasChildEntities,
      'parentEntityId': parentEntityId,
      'status': status,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (components != null) 'components': components,
      if (description != null) 'description': description,
    };
  }
}

class GetPropertyValueHistoryResponse {
  /// An object that maps strings to the property definitions in the component
  /// type. Each string in the mapping must be unique to this object.
  final List<PropertyValueHistory> propertyValues;

  /// The string that specifies the next page of results.
  final String? nextToken;

  GetPropertyValueHistoryResponse({
    required this.propertyValues,
    this.nextToken,
  });

  factory GetPropertyValueHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetPropertyValueHistoryResponse(
      propertyValues: (json['propertyValues'] as List)
          .whereNotNull()
          .map((e) => PropertyValueHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyValues = this.propertyValues;
    final nextToken = this.nextToken;
    return {
      'propertyValues': propertyValues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetPropertyValueResponse {
  /// An object that maps strings to the properties and latest property values in
  /// the response. Each string in the mapping must be unique to this object.
  final Map<String, PropertyLatestValue> propertyValues;

  GetPropertyValueResponse({
    required this.propertyValues,
  });

  factory GetPropertyValueResponse.fromJson(Map<String, dynamic> json) {
    return GetPropertyValueResponse(
      propertyValues: (json['propertyValues'] as Map<String, dynamic>).map((k,
              e) =>
          MapEntry(k, PropertyLatestValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyValues = this.propertyValues;
    return {
      'propertyValues': propertyValues,
    };
  }
}

class GetSceneResponse {
  /// The ARN of the scene.
  final String arn;

  /// The relative path that specifies the location of the content definition
  /// file.
  final String contentLocation;

  /// The date and time when the scene was created.
  final DateTime creationDateTime;

  /// The ID of the scene.
  final String sceneId;

  /// The date and time when the scene was last updated.
  final DateTime updateDateTime;

  /// The ID of the workspace that contains the scene.
  final String workspaceId;

  /// A list of capabilities that the scene uses to render.
  final List<String>? capabilities;

  /// The description of the scene.
  final String? description;

  GetSceneResponse({
    required this.arn,
    required this.contentLocation,
    required this.creationDateTime,
    required this.sceneId,
    required this.updateDateTime,
    required this.workspaceId,
    this.capabilities,
    this.description,
  });

  factory GetSceneResponse.fromJson(Map<String, dynamic> json) {
    return GetSceneResponse(
      arn: json['arn'] as String,
      contentLocation: json['contentLocation'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      sceneId: json['sceneId'] as String,
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contentLocation = this.contentLocation;
    final creationDateTime = this.creationDateTime;
    final sceneId = this.sceneId;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final capabilities = this.capabilities;
    final description = this.description;
    return {
      'arn': arn,
      'contentLocation': contentLocation,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'sceneId': sceneId,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
    };
  }
}

class GetWorkspaceResponse {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time when the workspace was created.
  final DateTime creationDateTime;

  /// The ARN of the execution role associated with the workspace.
  final String role;

  /// The ARN of the S3 bucket where resources associated with the workspace are
  /// stored.
  final String s3Location;

  /// The date and time when the workspace was last updated.
  final DateTime updateDateTime;

  /// The ID of the workspace.
  final String workspaceId;

  /// The description of the workspace.
  final String? description;

  GetWorkspaceResponse({
    required this.arn,
    required this.creationDateTime,
    required this.role,
    required this.s3Location,
    required this.updateDateTime,
    required this.workspaceId,
    this.description,
  });

  factory GetWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkspaceResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      role: json['role'] as String,
      s3Location: json['s3Location'] as String,
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final role = this.role;
    final s3Location = this.s3Location;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final description = this.description;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'role': role,
      's3Location': s3Location,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (description != null) 'description': description,
    };
  }
}

/// An object that specifies how to interpolate data in a list.
class InterpolationParameters {
  /// The interpolation type.
  final InterpolationType? interpolationType;

  /// The interpolation time interval in seconds.
  final int? intervalInSeconds;

  InterpolationParameters({
    this.interpolationType,
    this.intervalInSeconds,
  });

  factory InterpolationParameters.fromJson(Map<String, dynamic> json) {
    return InterpolationParameters(
      interpolationType:
          (json['interpolationType'] as String?)?.toInterpolationType(),
      intervalInSeconds: json['intervalInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final interpolationType = this.interpolationType;
    final intervalInSeconds = this.intervalInSeconds;
    return {
      if (interpolationType != null)
        'interpolationType': interpolationType.toValue(),
      if (intervalInSeconds != null) 'intervalInSeconds': intervalInSeconds,
    };
  }
}

enum InterpolationType {
  linear,
}

extension on InterpolationType {
  String toValue() {
    switch (this) {
      case InterpolationType.linear:
        return 'LINEAR';
    }
  }
}

extension on String {
  InterpolationType toInterpolationType() {
    switch (this) {
      case 'LINEAR':
        return InterpolationType.linear;
    }
    throw Exception('$this is not known in enum InterpolationType');
  }
}

/// The Lambda function.
class LambdaFunction {
  /// The ARN of the Lambda function.
  final String arn;

  LambdaFunction({
    required this.arn,
  });

  factory LambdaFunction.fromJson(Map<String, dynamic> json) {
    return LambdaFunction(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// An object that filters items in a list of component types.
/// <note>
/// Only one object is accepted as a valid input.
/// </note>
class ListComponentTypesFilter {
  /// The component type that the component types in the list extend.
  final String? extendsFrom;

  /// A Boolean value that specifies whether the component types in the list are
  /// abstract.
  final bool? isAbstract;

  /// The namespace to which the component types in the list belong.
  final String? namespace;

  ListComponentTypesFilter({
    this.extendsFrom,
    this.isAbstract,
    this.namespace,
  });

  factory ListComponentTypesFilter.fromJson(Map<String, dynamic> json) {
    return ListComponentTypesFilter(
      extendsFrom: json['extendsFrom'] as String?,
      isAbstract: json['isAbstract'] as bool?,
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final extendsFrom = this.extendsFrom;
    final isAbstract = this.isAbstract;
    final namespace = this.namespace;
    return {
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (isAbstract != null) 'isAbstract': isAbstract,
      if (namespace != null) 'namespace': namespace,
    };
  }
}

class ListComponentTypesResponse {
  /// A list of objects that contain information about the component types.
  final List<ComponentTypeSummary> componentTypeSummaries;

  /// The ID of the workspace.
  final String workspaceId;

  /// Specifies the maximum number of results to display.
  final int? maxResults;

  /// The string that specifies the next page of results.
  final String? nextToken;

  ListComponentTypesResponse({
    required this.componentTypeSummaries,
    required this.workspaceId,
    this.maxResults,
    this.nextToken,
  });

  factory ListComponentTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentTypesResponse(
      componentTypeSummaries: (json['componentTypeSummaries'] as List)
          .whereNotNull()
          .map((e) => ComponentTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      workspaceId: json['workspaceId'] as String,
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeSummaries = this.componentTypeSummaries;
    final workspaceId = this.workspaceId;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      'componentTypeSummaries': componentTypeSummaries,
      'workspaceId': workspaceId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// An object that filters items in a list of entities.
class ListEntitiesFilter {
  /// The ID of the component type in the entities in the list.
  final String? componentTypeId;

  /// The external-Id property of a component. The external-Id property is the
  /// primary key of an external storage system.
  final String? externalId;

  /// The parent of the entities in the list.
  final String? parentEntityId;

  ListEntitiesFilter({
    this.componentTypeId,
    this.externalId,
    this.parentEntityId,
  });

  factory ListEntitiesFilter.fromJson(Map<String, dynamic> json) {
    return ListEntitiesFilter(
      componentTypeId: json['componentTypeId'] as String?,
      externalId: json['externalId'] as String?,
      parentEntityId: json['parentEntityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final externalId = this.externalId;
    final parentEntityId = this.parentEntityId;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (externalId != null) 'externalId': externalId,
      if (parentEntityId != null) 'parentEntityId': parentEntityId,
    };
  }
}

class ListEntitiesResponse {
  /// A list of objects that contain information about the entities.
  final List<EntitySummary>? entitySummaries;

  /// The string that specifies the next page of results.
  final String? nextToken;

  ListEntitiesResponse({
    this.entitySummaries,
    this.nextToken,
  });

  factory ListEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListEntitiesResponse(
      entitySummaries: (json['entitySummaries'] as List?)
          ?.whereNotNull()
          .map((e) => EntitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitySummaries = this.entitySummaries;
    final nextToken = this.nextToken;
    return {
      if (entitySummaries != null) 'entitySummaries': entitySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListScenesResponse {
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// A list of objects that contain information about the scenes.
  final List<SceneSummary>? sceneSummaries;

  ListScenesResponse({
    this.nextToken,
    this.sceneSummaries,
  });

  factory ListScenesResponse.fromJson(Map<String, dynamic> json) {
    return ListScenesResponse(
      nextToken: json['nextToken'] as String?,
      sceneSummaries: (json['sceneSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SceneSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sceneSummaries = this.sceneSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sceneSummaries != null) 'sceneSummaries': sceneSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// Metadata that you can use to manage a resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

class ListWorkspacesResponse {
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// A list of objects that contain information about the workspaces.
  final List<WorkspaceSummary>? workspaceSummaries;

  ListWorkspacesResponse({
    this.nextToken,
    this.workspaceSummaries,
  });

  factory ListWorkspacesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkspacesResponse(
      nextToken: json['nextToken'] as String?,
      workspaceSummaries: (json['workspaceSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorkspaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workspaceSummaries = this.workspaceSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workspaceSummaries != null) 'workspaceSummaries': workspaceSummaries,
    };
  }
}

enum OrderByTime {
  ascending,
  descending,
}

extension on OrderByTime {
  String toValue() {
    switch (this) {
      case OrderByTime.ascending:
        return 'ASCENDING';
      case OrderByTime.descending:
        return 'DESCENDING';
    }
  }
}

extension on String {
  OrderByTime toOrderByTime() {
    switch (this) {
      case 'ASCENDING':
        return OrderByTime.ascending;
      case 'DESCENDING':
        return OrderByTime.descending;
    }
    throw Exception('$this is not known in enum OrderByTime');
  }
}

/// The parent entity update request.
class ParentEntityUpdateRequest {
  /// The type of the update.
  final ParentEntityUpdateType updateType;

  /// The ID of the parent entity.
  final String? parentEntityId;

  ParentEntityUpdateRequest({
    required this.updateType,
    this.parentEntityId,
  });

  factory ParentEntityUpdateRequest.fromJson(Map<String, dynamic> json) {
    return ParentEntityUpdateRequest(
      updateType: (json['updateType'] as String).toParentEntityUpdateType(),
      parentEntityId: json['parentEntityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final updateType = this.updateType;
    final parentEntityId = this.parentEntityId;
    return {
      'updateType': updateType.toValue(),
      if (parentEntityId != null) 'parentEntityId': parentEntityId,
    };
  }
}

enum ParentEntityUpdateType {
  update,
  delete,
}

extension on ParentEntityUpdateType {
  String toValue() {
    switch (this) {
      case ParentEntityUpdateType.update:
        return 'UPDATE';
      case ParentEntityUpdateType.delete:
        return 'DELETE';
    }
  }
}

extension on String {
  ParentEntityUpdateType toParentEntityUpdateType() {
    switch (this) {
      case 'UPDATE':
        return ParentEntityUpdateType.update;
      case 'DELETE':
        return ParentEntityUpdateType.delete;
    }
    throw Exception('$this is not known in enum ParentEntityUpdateType');
  }
}

/// An object that sets information about a property.
class PropertyDefinitionRequest {
  /// A mapping that specifies configuration information about the property. Use
  /// this field to specify information that you read from and write to an
  /// external source.
  final Map<String, String>? configuration;

  /// An object that contains information about the data type.
  final DataType? dataType;

  /// An object that contains the default value.
  final DataValue? defaultValue;

  /// A Boolean value that specifies whether the property ID comes from an
  /// external data store.
  final bool? isExternalId;

  /// A Boolean value that specifies whether the property is required.
  final bool? isRequiredInEntity;

  /// A Boolean value that specifies whether the property is stored externally.
  final bool? isStoredExternally;

  /// A Boolean value that specifies whether the property consists of time series
  /// data.
  final bool? isTimeSeries;

  PropertyDefinitionRequest({
    this.configuration,
    this.dataType,
    this.defaultValue,
    this.isExternalId,
    this.isRequiredInEntity,
    this.isStoredExternally,
    this.isTimeSeries,
  });

  factory PropertyDefinitionRequest.fromJson(Map<String, dynamic> json) {
    return PropertyDefinitionRequest(
      configuration: (json['configuration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      dataType: json['dataType'] != null
          ? DataType.fromJson(json['dataType'] as Map<String, dynamic>)
          : null,
      defaultValue: json['defaultValue'] != null
          ? DataValue.fromJson(json['defaultValue'] as Map<String, dynamic>)
          : null,
      isExternalId: json['isExternalId'] as bool?,
      isRequiredInEntity: json['isRequiredInEntity'] as bool?,
      isStoredExternally: json['isStoredExternally'] as bool?,
      isTimeSeries: json['isTimeSeries'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final isExternalId = this.isExternalId;
    final isRequiredInEntity = this.isRequiredInEntity;
    final isStoredExternally = this.isStoredExternally;
    final isTimeSeries = this.isTimeSeries;
    return {
      if (configuration != null) 'configuration': configuration,
      if (dataType != null) 'dataType': dataType,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (isExternalId != null) 'isExternalId': isExternalId,
      if (isRequiredInEntity != null) 'isRequiredInEntity': isRequiredInEntity,
      if (isStoredExternally != null) 'isStoredExternally': isStoredExternally,
      if (isTimeSeries != null) 'isTimeSeries': isTimeSeries,
    };
  }
}

/// An object that contains response data from a property definition request.
class PropertyDefinitionResponse {
  /// An object that contains information about the data type.
  final DataType dataType;

  /// A Boolean value that specifies whether the property ID comes from an
  /// external data store.
  final bool isExternalId;

  /// A Boolean value that specifies whether the property definition can be
  /// updated.
  final bool isFinal;

  /// A Boolean value that specifies whether the property definition is imported
  /// from an external data store.
  final bool isImported;

  /// A Boolean value that specifies whether the property definition is inherited
  /// from a parent entity.
  final bool isInherited;

  /// A Boolean value that specifies whether the property is required in an
  /// entity.
  final bool isRequiredInEntity;

  /// A Boolean value that specifies whether the property is stored externally.
  final bool isStoredExternally;

  /// A Boolean value that specifies whether the property consists of time series
  /// data.
  final bool isTimeSeries;

  /// A mapping that specifies configuration information about the property.
  final Map<String, String>? configuration;

  /// An object that contains the default value.
  final DataValue? defaultValue;

  PropertyDefinitionResponse({
    required this.dataType,
    required this.isExternalId,
    required this.isFinal,
    required this.isImported,
    required this.isInherited,
    required this.isRequiredInEntity,
    required this.isStoredExternally,
    required this.isTimeSeries,
    this.configuration,
    this.defaultValue,
  });

  factory PropertyDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return PropertyDefinitionResponse(
      dataType: DataType.fromJson(json['dataType'] as Map<String, dynamic>),
      isExternalId: json['isExternalId'] as bool,
      isFinal: json['isFinal'] as bool,
      isImported: json['isImported'] as bool,
      isInherited: json['isInherited'] as bool,
      isRequiredInEntity: json['isRequiredInEntity'] as bool,
      isStoredExternally: json['isStoredExternally'] as bool,
      isTimeSeries: json['isTimeSeries'] as bool,
      configuration: (json['configuration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      defaultValue: json['defaultValue'] != null
          ? DataValue.fromJson(json['defaultValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final isExternalId = this.isExternalId;
    final isFinal = this.isFinal;
    final isImported = this.isImported;
    final isInherited = this.isInherited;
    final isRequiredInEntity = this.isRequiredInEntity;
    final isStoredExternally = this.isStoredExternally;
    final isTimeSeries = this.isTimeSeries;
    final configuration = this.configuration;
    final defaultValue = this.defaultValue;
    return {
      'dataType': dataType,
      'isExternalId': isExternalId,
      'isFinal': isFinal,
      'isImported': isImported,
      'isInherited': isInherited,
      'isRequiredInEntity': isRequiredInEntity,
      'isStoredExternally': isStoredExternally,
      'isTimeSeries': isTimeSeries,
      if (configuration != null) 'configuration': configuration,
      if (defaultValue != null) 'defaultValue': defaultValue,
    };
  }
}

/// An object that filters items returned by a property request.
class PropertyFilter {
  /// The operator associated with this property filter.
  final String? operator;

  /// The property name associated with this property filter.
  final String? propertyName;

  /// The value associated with this property filter.
  final DataValue? value;

  PropertyFilter({
    this.operator,
    this.propertyName,
    this.value,
  });

  factory PropertyFilter.fromJson(Map<String, dynamic> json) {
    return PropertyFilter(
      operator: json['operator'] as String?,
      propertyName: json['propertyName'] as String?,
      value: json['value'] != null
          ? DataValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final propertyName = this.propertyName;
    final value = this.value;
    return {
      if (operator != null) 'operator': operator,
      if (propertyName != null) 'propertyName': propertyName,
      if (value != null) 'value': value,
    };
  }
}

/// The latest value of the property.
class PropertyLatestValue {
  /// An object that specifies information about a property.&gt;
  final EntityPropertyReference propertyReference;

  /// The value of the property.
  final DataValue? propertyValue;

  PropertyLatestValue({
    required this.propertyReference,
    this.propertyValue,
  });

  factory PropertyLatestValue.fromJson(Map<String, dynamic> json) {
    return PropertyLatestValue(
      propertyReference: EntityPropertyReference.fromJson(
          json['propertyReference'] as Map<String, dynamic>),
      propertyValue: json['propertyValue'] != null
          ? DataValue.fromJson(json['propertyValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyReference = this.propertyReference;
    final propertyValue = this.propertyValue;
    return {
      'propertyReference': propertyReference,
      if (propertyValue != null) 'propertyValue': propertyValue,
    };
  }
}

/// An object that sets information about a property.
class PropertyRequest {
  /// An object that specifies information about a property.
  final PropertyDefinitionRequest? definition;

  /// The update type of the update property request.
  final PropertyUpdateType? updateType;

  /// The value of the property.
  final DataValue? value;

  PropertyRequest({
    this.definition,
    this.updateType,
    this.value,
  });

  factory PropertyRequest.fromJson(Map<String, dynamic> json) {
    return PropertyRequest(
      definition: json['definition'] != null
          ? PropertyDefinitionRequest.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      updateType: (json['updateType'] as String?)?.toPropertyUpdateType(),
      value: json['value'] != null
          ? DataValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final updateType = this.updateType;
    final value = this.value;
    return {
      if (definition != null) 'definition': definition,
      if (updateType != null) 'updateType': updateType.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object that contains information about a property response.
class PropertyResponse {
  /// An object that specifies information about a property.
  final PropertyDefinitionResponse? definition;

  /// The value of the property.
  final DataValue? value;

  PropertyResponse({
    this.definition,
    this.value,
  });

  factory PropertyResponse.fromJson(Map<String, dynamic> json) {
    return PropertyResponse(
      definition: json['definition'] != null
          ? PropertyDefinitionResponse.fromJson(
              json['definition'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? DataValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final value = this.value;
    return {
      if (definition != null) 'definition': definition,
      if (value != null) 'value': value,
    };
  }
}

enum PropertyUpdateType {
  update,
  delete,
  create,
}

extension on PropertyUpdateType {
  String toValue() {
    switch (this) {
      case PropertyUpdateType.update:
        return 'UPDATE';
      case PropertyUpdateType.delete:
        return 'DELETE';
      case PropertyUpdateType.create:
        return 'CREATE';
    }
  }
}

extension on String {
  PropertyUpdateType toPropertyUpdateType() {
    switch (this) {
      case 'UPDATE':
        return PropertyUpdateType.update;
      case 'DELETE':
        return PropertyUpdateType.delete;
      case 'CREATE':
        return PropertyUpdateType.create;
    }
    throw Exception('$this is not known in enum PropertyUpdateType');
  }
}

/// An object that contains information about a value for a time series
/// property.
class PropertyValue {
  /// An object that specifies a value for a time series property.
  final DataValue value;

  /// ISO8601 DateTime of a value for a time series property.
  ///
  /// The time for when the property value was recorded in ISO 8601 format:
  /// <i>YYYY-MM-DDThh:mm:ss[.SSSSSSSSS][Z/±HH:mm]</i>.
  ///
  /// <ul>
  /// <li>
  /// <i>[YYYY]</i>: year
  /// </li>
  /// <li>
  /// <i>[MM]</i>: month
  /// </li>
  /// <li>
  /// <i>[DD]</i>: day
  /// </li>
  /// <li>
  /// <i>[hh]</i>: hour
  /// </li>
  /// <li>
  /// <i>[mm]</i>: minute
  /// </li>
  /// <li>
  /// <i>[ss]</i>: seconds
  /// </li>
  /// <li>
  /// <i>[.SSSSSSSSS]</i>: additional precision, where precedence is maintained.
  /// For example: [.573123] is equal to 573123000 nanoseconds.
  /// </li>
  /// <li>
  /// <i>Z</i>: default timezone UTC
  /// </li>
  /// <li>
  /// <i>± HH:mm</i>: time zone offset in Hours and Minutes.
  /// </li>
  /// </ul>
  /// <i>Required sub-fields</i>: YYYY-MM-DDThh:mm:ss and [Z/±HH:mm]
  final String? time;

  /// The timestamp of a value for a time series property.
  final DateTime? timestamp;

  PropertyValue({
    required this.value,
    this.time,
    this.timestamp,
  });

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return PropertyValue(
      value: DataValue.fromJson(json['value'] as Map<String, dynamic>),
      time: json['time'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final time = this.time;
    final timestamp = this.timestamp;
    return {
      'value': value,
      if (time != null) 'time': time,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// An object that specifies information about time series property values. This
/// object is used and consumed by the <a
/// href="https://docs.aws.amazon.com/iot-twinmaker/latest/apireference/API_BatchPutPropertyValues.html">BatchPutPropertyValues</a>
/// action.
class PropertyValueEntry {
  /// An object that contains information about the entity that has the property.
  final EntityPropertyReference entityPropertyReference;

  /// A list of objects that specify time series property values.
  final List<PropertyValue>? propertyValues;

  PropertyValueEntry({
    required this.entityPropertyReference,
    this.propertyValues,
  });

  factory PropertyValueEntry.fromJson(Map<String, dynamic> json) {
    return PropertyValueEntry(
      entityPropertyReference: EntityPropertyReference.fromJson(
          json['entityPropertyReference'] as Map<String, dynamic>),
      propertyValues: (json['propertyValues'] as List?)
          ?.whereNotNull()
          .map((e) => PropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityPropertyReference = this.entityPropertyReference;
    final propertyValues = this.propertyValues;
    return {
      'entityPropertyReference': entityPropertyReference,
      if (propertyValues != null) 'propertyValues': propertyValues,
    };
  }
}

/// The history of values for a time series property.
class PropertyValueHistory {
  /// An object that uniquely identifies an entity property.
  final EntityPropertyReference entityPropertyReference;

  /// A list of objects that contain information about the values in the history
  /// of a time series property.
  final List<PropertyValue>? values;

  PropertyValueHistory({
    required this.entityPropertyReference,
    this.values,
  });

  factory PropertyValueHistory.fromJson(Map<String, dynamic> json) {
    return PropertyValueHistory(
      entityPropertyReference: EntityPropertyReference.fromJson(
          json['entityPropertyReference'] as Map<String, dynamic>),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => PropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityPropertyReference = this.entityPropertyReference;
    final values = this.values;
    return {
      'entityPropertyReference': entityPropertyReference,
      if (values != null) 'values': values,
    };
  }
}

/// An object that specifies a relationship with another component type.
class Relationship {
  /// The type of the relationship.
  final String? relationshipType;

  /// The ID of the target component type associated with this relationship.
  final String? targetComponentTypeId;

  Relationship({
    this.relationshipType,
    this.targetComponentTypeId,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      relationshipType: json['relationshipType'] as String?,
      targetComponentTypeId: json['targetComponentTypeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipType = this.relationshipType;
    final targetComponentTypeId = this.targetComponentTypeId;
    return {
      if (relationshipType != null) 'relationshipType': relationshipType,
      if (targetComponentTypeId != null)
        'targetComponentTypeId': targetComponentTypeId,
    };
  }
}

/// A value that associates a component and an entity.
class RelationshipValue {
  /// The name of the target component associated with the relationship value.
  final String? targetComponentName;

  /// The ID of the target entity associated with this relationship value.
  final String? targetEntityId;

  RelationshipValue({
    this.targetComponentName,
    this.targetEntityId,
  });

  factory RelationshipValue.fromJson(Map<String, dynamic> json) {
    return RelationshipValue(
      targetComponentName: json['targetComponentName'] as String?,
      targetEntityId: json['targetEntityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetComponentName = this.targetComponentName;
    final targetEntityId = this.targetEntityId;
    return {
      if (targetComponentName != null)
        'targetComponentName': targetComponentName,
      if (targetEntityId != null) 'targetEntityId': targetEntityId,
    };
  }
}

/// An object that contains information about a scene.
class SceneSummary {
  /// The ARN of the scene.
  final String arn;

  /// The relative path that specifies the location of the content definition
  /// file.
  final String contentLocation;

  /// The date and time when the scene was created.
  final DateTime creationDateTime;

  /// The ID of the scene.
  final String sceneId;

  /// The date and time when the scene was last updated.
  final DateTime updateDateTime;

  /// The scene description.
  final String? description;

  SceneSummary({
    required this.arn,
    required this.contentLocation,
    required this.creationDateTime,
    required this.sceneId,
    required this.updateDateTime,
    this.description,
  });

  factory SceneSummary.fromJson(Map<String, dynamic> json) {
    return SceneSummary(
      arn: json['arn'] as String,
      contentLocation: json['contentLocation'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      sceneId: json['sceneId'] as String,
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contentLocation = this.contentLocation;
    final creationDateTime = this.creationDateTime;
    final sceneId = this.sceneId;
    final updateDateTime = this.updateDateTime;
    final description = this.description;
    return {
      'arn': arn,
      'contentLocation': contentLocation,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'sceneId': sceneId,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (description != null) 'description': description,
    };
  }
}

enum Scope {
  entity,
  workspace,
}

extension on Scope {
  String toValue() {
    switch (this) {
      case Scope.entity:
        return 'ENTITY';
      case Scope.workspace:
        return 'WORKSPACE';
    }
  }
}

extension on String {
  Scope toScope() {
    switch (this) {
      case 'ENTITY':
        return Scope.entity;
      case 'WORKSPACE':
        return Scope.workspace;
    }
    throw Exception('$this is not known in enum Scope');
  }
}

enum State {
  creating,
  updating,
  deleting,
  active,
  error,
}

extension on State {
  String toValue() {
    switch (this) {
      case State.creating:
        return 'CREATING';
      case State.updating:
        return 'UPDATING';
      case State.deleting:
        return 'DELETING';
      case State.active:
        return 'ACTIVE';
      case State.error:
        return 'ERROR';
    }
  }
}

extension on String {
  State toState() {
    switch (this) {
      case 'CREATING':
        return State.creating;
      case 'UPDATING':
        return State.updating;
      case 'DELETING':
        return State.deleting;
      case 'ACTIVE':
        return State.active;
      case 'ERROR':
        return State.error;
    }
    throw Exception('$this is not known in enum State');
  }
}

/// An object that represents the status of an entity, component, component
/// type, or workspace.
class Status {
  /// The error message.
  final ErrorDetails? error;

  /// The current state of the entity, component, component type, or workspace.
  final State? state;

  Status({
    this.error,
    this.state,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final state = this.state;
    return {
      if (error != null) 'error': error,
      if (state != null) 'state': state.toValue(),
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

enum Type {
  relationship,
  string,
  long,
  boolean,
  integer,
  double,
  list,
  map,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.relationship:
        return 'RELATIONSHIP';
      case Type.string:
        return 'STRING';
      case Type.long:
        return 'LONG';
      case Type.boolean:
        return 'BOOLEAN';
      case Type.integer:
        return 'INTEGER';
      case Type.double:
        return 'DOUBLE';
      case Type.list:
        return 'LIST';
      case Type.map:
        return 'MAP';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'RELATIONSHIP':
        return Type.relationship;
      case 'STRING':
        return Type.string;
      case 'LONG':
        return Type.long;
      case 'BOOLEAN':
        return Type.boolean;
      case 'INTEGER':
        return Type.integer;
      case 'DOUBLE':
        return Type.double;
      case 'LIST':
        return Type.list;
      case 'MAP':
        return Type.map;
    }
    throw Exception('$this is not known in enum Type');
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

class UpdateComponentTypeResponse {
  /// The ARN of the component type.
  final String arn;

  /// The ID of the component type.
  final String componentTypeId;

  /// The current state of the component type.
  final State state;

  /// The ID of the workspace that contains the component type.
  final String workspaceId;

  UpdateComponentTypeResponse({
    required this.arn,
    required this.componentTypeId,
    required this.state,
    required this.workspaceId,
  });

  factory UpdateComponentTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateComponentTypeResponse(
      arn: json['arn'] as String,
      componentTypeId: json['componentTypeId'] as String,
      state: (json['state'] as String).toState(),
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentTypeId = this.componentTypeId;
    final state = this.state;
    final workspaceId = this.workspaceId;
    return {
      'arn': arn,
      'componentTypeId': componentTypeId,
      'state': state.toValue(),
      'workspaceId': workspaceId,
    };
  }
}

class UpdateEntityResponse {
  /// The current state of the entity update.
  final State state;

  /// The date and time when the entity was last updated.
  final DateTime updateDateTime;

  UpdateEntityResponse({
    required this.state,
    required this.updateDateTime,
  });

  factory UpdateEntityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEntityResponse(
      state: (json['state'] as String).toState(),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final updateDateTime = this.updateDateTime;
    return {
      'state': state.toValue(),
      'updateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

class UpdateSceneResponse {
  /// The date and time when the scene was last updated.
  final DateTime updateDateTime;

  UpdateSceneResponse({
    required this.updateDateTime,
  });

  factory UpdateSceneResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSceneResponse(
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final updateDateTime = this.updateDateTime;
    return {
      'updateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

class UpdateWorkspaceResponse {
  /// The date and time of the current update.
  final DateTime updateDateTime;

  UpdateWorkspaceResponse({
    required this.updateDateTime,
  });

  factory UpdateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkspaceResponse(
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final updateDateTime = this.updateDateTime;
    return {
      'updateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

/// An object that contains information about a workspace.
class WorkspaceSummary {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time when the workspace was created.
  final DateTime creationDateTime;

  /// The date and time when the workspace was last updated.
  final DateTime updateDateTime;

  /// The ID of the workspace.
  final String workspaceId;

  /// The description of the workspace.
  final String? description;

  WorkspaceSummary({
    required this.arn,
    required this.creationDateTime,
    required this.updateDateTime,
    required this.workspaceId,
    this.description,
  });

  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) {
    return WorkspaceSummary(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final description = this.description;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (description != null) 'description': description,
    };
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

class ConnectorFailureException extends _s.GenericAwsException {
  ConnectorFailureException({String? type, String? message})
      : super(type: type, code: 'ConnectorFailureException', message: message);
}

class ConnectorTimeoutException extends _s.GenericAwsException {
  ConnectorTimeoutException({String? type, String? message})
      : super(type: type, code: 'ConnectorTimeoutException', message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'ConnectorFailureException': (type, message) =>
      ConnectorFailureException(type: type, message: message),
  'ConnectorTimeoutException': (type, message) =>
      ConnectorTimeoutException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
