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

/// IoT TwinMaker is a service with which you can build operational digital
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Cancels the metadata transfer job.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [metadataTransferJobId] :
  /// The metadata transfer job Id.
  Future<CancelMetadataTransferJobResponse> cancelMetadataTransferJob({
    required String metadataTransferJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/metadata-transfer-jobs/${Uri.encodeComponent(metadataTransferJobId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelMetadataTransferJobResponse.fromJson(response);
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
  /// Parameter [componentTypeName] :
  /// A friendly name for the component type.
  ///
  /// Parameter [compositeComponentTypes] :
  /// This is an object that maps strings to
  /// <code>compositeComponentTypes</code> of the <code>componentType</code>.
  /// <code>CompositeComponentType</code> is referenced by
  /// <code>componentTypeId</code>.
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
  /// Parameter [propertyGroups] :
  /// <p/>
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the component type.
  Future<CreateComponentTypeResponse> createComponentType({
    required String componentTypeId,
    required String workspaceId,
    String? componentTypeName,
    Map<String, CompositeComponentTypeRequest>? compositeComponentTypes,
    String? description,
    List<String>? extendsFrom,
    Map<String, FunctionRequest>? functions,
    bool? isSingleton,
    Map<String, PropertyDefinitionRequest>? propertyDefinitions,
    Map<String, PropertyGroupRequest>? propertyGroups,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (componentTypeName != null) 'componentTypeName': componentTypeName,
      if (compositeComponentTypes != null)
        'compositeComponentTypes': compositeComponentTypes,
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
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
  /// Parameter [compositeComponents] :
  /// This is an object that maps strings to <code>compositeComponent</code>
  /// updates in the request. Each key of the map represents the
  /// <code>componentPath</code> of the <code>compositeComponent</code>.
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
    Map<String, CompositeComponentRequest>? compositeComponents,
    String? description,
    String? entityId,
    String? parentEntityId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'entityName': entityName,
      if (components != null) 'components': components,
      if (compositeComponents != null)
        'compositeComponents': compositeComponents,
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

  /// Creates a new metadata transfer job.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [destination] :
  /// The metadata transfer job destination.
  ///
  /// Parameter [sources] :
  /// The metadata transfer job sources.
  ///
  /// Parameter [description] :
  /// The metadata transfer job description.
  ///
  /// Parameter [metadataTransferJobId] :
  /// The metadata transfer job Id.
  Future<CreateMetadataTransferJobResponse> createMetadataTransferJob({
    required DestinationConfiguration destination,
    required List<SourceConfiguration> sources,
    String? description,
    String? metadataTransferJobId,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'sources': sources,
      if (description != null) 'description': description,
      if (metadataTransferJobId != null)
        'metadataTransferJobId': metadataTransferJobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata-transfer-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMetadataTransferJobResponse.fromJson(response);
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
  /// Parameter [sceneMetadata] :
  /// The request metadata.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the scene.
  Future<CreateSceneResponse> createScene({
    required String contentLocation,
    required String sceneId,
    required String workspaceId,
    List<String>? capabilities,
    String? description,
    Map<String, String>? sceneMetadata,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'contentLocation': contentLocation,
      'sceneId': sceneId,
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
      if (sceneMetadata != null) 'sceneMetadata': sceneMetadata,
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

  /// This action creates a SyncJob.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [syncRole] :
  /// The SyncJob IAM role. This IAM role is used by the SyncJob to read from
  /// the syncSource, and create, update, or delete the corresponding resources.
  ///
  /// Parameter [syncSource] :
  /// The sync source.
  /// <note>
  /// Currently the only supported syncSoource is <code>SITEWISE </code>.
  /// </note>
  ///
  /// Parameter [workspaceId] :
  /// The workspace ID.
  ///
  /// Parameter [tags] :
  /// The SyncJob tags.
  Future<CreateSyncJobResponse> createSyncJob({
    required String syncRole,
    required String syncSource,
    required String workspaceId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'syncRole': syncRole,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/sync-jobs/${Uri.encodeComponent(syncSource)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSyncJobResponse.fromJson(response);
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
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [description] :
  /// The description of the workspace.
  ///
  /// Parameter [role] :
  /// The ARN of the execution role associated with the workspace.
  ///
  /// Parameter [s3Location] :
  /// The ARN of the S3 bucket where resources associated with the workspace are
  /// stored.
  ///
  /// Parameter [tags] :
  /// Metadata that you can use to manage the workspace
  Future<CreateWorkspaceResponse> createWorkspace({
    required String workspaceId,
    String? description,
    String? role,
    String? s3Location,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (role != null) 'role': role,
      if (s3Location != null) 's3Location': s3Location,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes/${Uri.encodeComponent(sceneId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the SyncJob.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [syncSource] :
  /// The sync source.
  /// <note>
  /// Currently the only supported syncSource is <code>SITEWISE </code>.
  /// </note>
  ///
  /// Parameter [workspaceId] :
  /// The workspace ID.
  Future<DeleteSyncJobResponse> deleteSyncJob({
    required String syncSource,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/sync-jobs/${Uri.encodeComponent(syncSource)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSyncJobResponse.fromJson(response);
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
  Future<DeleteWorkspaceResponse> deleteWorkspace({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkspaceResponse.fromJson(response);
  }

  /// Run queries to access information from your knowledge graph of entities
  /// within individual workspaces.
  /// <note>
  /// The ExecuteQuery action only works with <a
  /// href="https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/home.html">Amazon
  /// Web Services Java SDK2</a>. ExecuteQuery will not work with any Amazon Web
  /// Services Java SDK version &lt; 2.x.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [QueryTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [queryStatement] :
  /// The query statement.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 50.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ExecuteQueryResponse> executeQuery({
    required String queryStatement,
    required String workspaceId,
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
      'queryStatement': queryStatement,
      'workspaceId': workspaceId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/queries/execution',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteQueryResponse.fromJson(response);
  }

  /// Retrieves information about a component type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities/${Uri.encodeComponent(entityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEntityResponse.fromJson(response);
  }

  /// Gets a nmetadata transfer job.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [metadataTransferJobId] :
  /// The metadata transfer job Id.
  Future<GetMetadataTransferJobResponse> getMetadataTransferJob({
    required String metadataTransferJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/metadata-transfer-jobs/${Uri.encodeComponent(metadataTransferJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetadataTransferJobResponse.fromJson(response);
  }

  /// Gets the pricing plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetPricingPlanResponse> getPricingPlan() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pricingplan',
      exceptionFnMap: _exceptionFns,
    );
    return GetPricingPlanResponse.fromJson(response);
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
  /// Parameter [componentPath] :
  /// This string specifies the path to the composite component, starting from
  /// the top-level component.
  ///
  /// Parameter [componentTypeId] :
  /// The ID of the component type whose property values the operation returns.
  ///
  /// Parameter [entityId] :
  /// The ID of the entity whose property values the operation returns.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  ///
  /// Parameter [propertyGroupName] :
  /// The property group name.
  ///
  /// Parameter [tabularConditions] :
  /// The tabular conditions.
  Future<GetPropertyValueResponse> getPropertyValue({
    required List<String> selectedProperties,
    required String workspaceId,
    String? componentName,
    String? componentPath,
    String? componentTypeId,
    String? entityId,
    int? maxResults,
    String? nextToken,
    String? propertyGroupName,
    TabularConditions? tabularConditions,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      'selectedProperties': selectedProperties,
      if (componentName != null) 'componentName': componentName,
      if (componentPath != null) 'componentPath': componentPath,
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (entityId != null) 'entityId': entityId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (propertyGroupName != null) 'propertyGroupName': propertyGroupName,
      if (tabularConditions != null) 'tabularConditions': tabularConditions,
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
  /// Parameter [componentPath] :
  /// This string specifies the path to the composite component, starting from
  /// the top-level component.
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
  /// href="https://docs.aws.amazon.com/iot-twinmaker/latest/apireference/API_PropertyValue.html">PropertyValue</a>.
  ///
  /// Parameter [entityId] :
  /// The ID of the entity.
  ///
  /// Parameter [interpolation] :
  /// An object that specifies the interpolation type and the interval over
  /// which to interpolate data.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
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
  /// href="https://docs.aws.amazon.com/iot-twinmaker/latest/apireference/API_PropertyValue.html">PropertyValue</a>.
  Future<GetPropertyValueHistoryResponse> getPropertyValueHistory({
    required List<String> selectedProperties,
    required String workspaceId,
    String? componentName,
    String? componentPath,
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      'selectedProperties': selectedProperties,
      if (componentName != null) 'componentName': componentName,
      if (componentPath != null) 'componentPath': componentPath,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/scenes/${Uri.encodeComponent(sceneId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSceneResponse.fromJson(response);
  }

  /// Gets the SyncJob.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [syncSource] :
  /// The sync source.
  /// <note>
  /// Currently the only supported syncSource is <code>SITEWISE </code>.
  /// </note>
  ///
  /// Parameter [workspaceId] :
  /// The workspace ID.
  Future<GetSyncJobResponse> getSyncJob({
    required String syncSource,
    String? workspaceId,
  }) async {
    final $query = <String, List<String>>{
      if (workspaceId != null) 'workspace': [workspaceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sync-jobs/${Uri.encodeComponent(syncSource)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSyncJobResponse.fromJson(response);
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
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListComponentTypesResponse> listComponentTypes({
    required String workspaceId,
    List<ListComponentTypesFilter>? filters,
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

  /// This API lists the components of an entity.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityId] :
  /// The ID for the entity whose metadata (component/properties) is returned by
  /// the operation.
  ///
  /// Parameter [workspaceId] :
  /// The workspace ID.
  ///
  /// Parameter [componentPath] :
  /// This string specifies the path to the composite component, starting from
  /// the top-level component.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListComponentsResponse> listComponents({
    required String entityId,
    required String workspaceId,
    String? componentPath,
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
      if (componentPath != null) 'componentPath': componentPath,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/entities/${Uri.encodeComponent(entityId)}/components-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentsResponse.fromJson(response);
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
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListEntitiesResponse> listEntities({
    required String workspaceId,
    List<ListEntitiesFilter>? filters,
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

  /// Lists the metadata transfer jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationType] :
  /// The metadata transfer job's destination type.
  ///
  /// Parameter [sourceType] :
  /// The metadata transfer job's source type.
  ///
  /// Parameter [filters] :
  /// An object that filters metadata transfer jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListMetadataTransferJobsResponse> listMetadataTransferJobs({
    required DestinationType destinationType,
    required SourceType sourceType,
    List<ListMetadataTransferJobsFilter>? filters,
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
      'destinationType': destinationType.toValue(),
      'sourceType': sourceType.toValue(),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata-transfer-jobs-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListMetadataTransferJobsResponse.fromJson(response);
  }

  /// This API lists the properties of a component.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityId] :
  /// The ID for the entity whose metadata (component/properties) is returned by
  /// the operation.
  ///
  /// Parameter [workspaceId] :
  /// The workspace ID.
  ///
  /// Parameter [componentName] :
  /// The name of the component whose properties are returned by the operation.
  ///
  /// Parameter [componentPath] :
  /// This string specifies the path to the composite component, starting from
  /// the top-level component.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListPropertiesResponse> listProperties({
    required String entityId,
    required String workspaceId,
    String? componentName,
    String? componentPath,
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
      'entityId': entityId,
      if (componentName != null) 'componentName': componentName,
      if (componentPath != null) 'componentPath': componentPath,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/properties-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListPropertiesResponse.fromJson(response);
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

  /// List all SyncJobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the sync job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 50.
  ///
  /// Valid Range: Minimum value of 0. Maximum value of 200.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListSyncJobsResponse> listSyncJobs({
    required String workspaceId,
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
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/sync-jobs-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListSyncJobsResponse.fromJson(response);
  }

  /// Lists the sync resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [syncSource] :
  /// The sync source.
  /// <note>
  /// Currently the only supported syncSource is <code>SITEWISE </code>.
  /// </note>
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that contains the sync job.
  ///
  /// Parameter [filters] :
  /// A list of objects that filter the request.
  ///
  /// The following filter combinations are supported:
  ///
  /// <ul>
  /// <li>
  /// Filter with state
  /// </li>
  /// <li>
  /// Filter with ResourceType and ResourceId
  /// </li>
  /// <li>
  /// Filter with ResourceType and ExternalId
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 50.
  ///
  /// Valid Range: Minimum value of 0. Maximum value of 200.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListSyncResourcesResponse> listSyncResources({
    required String syncSource,
    required String workspaceId,
    List<SyncResourceFilter>? filters,
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
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/sync-jobs/${Uri.encodeComponent(syncSource)}/resources-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListSyncResourcesResponse.fromJson(response);
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
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
  ///
  /// Parameter [nextToken] :
  /// The string that specifies the next page of results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
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
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
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
  /// The ID of the workspace.
  ///
  /// Parameter [componentTypeName] :
  /// The component type name.
  ///
  /// Parameter [compositeComponentTypes] :
  /// This is an object that maps strings to
  /// <code>compositeComponentTypes</code> of the <code>componentType</code>.
  /// <code>CompositeComponentType</code> is referenced by
  /// <code>componentTypeId</code>.
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
  ///
  /// Parameter [propertyGroups] :
  /// The property groups.
  Future<UpdateComponentTypeResponse> updateComponentType({
    required String componentTypeId,
    required String workspaceId,
    String? componentTypeName,
    Map<String, CompositeComponentTypeRequest>? compositeComponentTypes,
    String? description,
    List<String>? extendsFrom,
    Map<String, FunctionRequest>? functions,
    bool? isSingleton,
    Map<String, PropertyDefinitionRequest>? propertyDefinitions,
    Map<String, PropertyGroupRequest>? propertyGroups,
  }) async {
    final $payload = <String, dynamic>{
      if (componentTypeName != null) 'componentTypeName': componentTypeName,
      if (compositeComponentTypes != null)
        'compositeComponentTypes': compositeComponentTypes,
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
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
  /// Parameter [compositeComponentUpdates] :
  /// This is an object that maps strings to <code>compositeComponent</code>
  /// updates in the request. Each key of the map represents the
  /// <code>componentPath</code> of the <code>compositeComponent</code>.
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
    Map<String, CompositeComponentUpdateRequest>? compositeComponentUpdates,
    String? description,
    String? entityName,
    ParentEntityUpdateRequest? parentEntityUpdate,
  }) async {
    final $payload = <String, dynamic>{
      if (componentUpdates != null) 'componentUpdates': componentUpdates,
      if (compositeComponentUpdates != null)
        'compositeComponentUpdates': compositeComponentUpdates,
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

  /// Update the pricing plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pricingMode] :
  /// The pricing mode.
  ///
  /// Parameter [bundleNames] :
  /// The bundle names.
  Future<UpdatePricingPlanResponse> updatePricingPlan({
    required PricingMode pricingMode,
    List<String>? bundleNames,
  }) async {
    final $payload = <String, dynamic>{
      'pricingMode': pricingMode.toValue(),
      if (bundleNames != null) 'bundleNames': bundleNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pricingplan',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePricingPlanResponse.fromJson(response);
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
  ///
  /// Parameter [sceneMetadata] :
  /// The scene metadata.
  Future<UpdateSceneResponse> updateScene({
    required String sceneId,
    required String workspaceId,
    List<String>? capabilities,
    String? contentLocation,
    String? description,
    Map<String, String>? sceneMetadata,
  }) async {
    final $payload = <String, dynamic>{
      if (capabilities != null) 'capabilities': capabilities,
      if (contentLocation != null) 'contentLocation': contentLocation,
      if (description != null) 'description': description,
      if (sceneMetadata != null) 'sceneMetadata': sceneMetadata,
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
  ///
  /// Parameter [s3Location] :
  /// The ARN of the S3 bucket where resources associated with the workspace are
  /// stored.
  Future<UpdateWorkspaceResponse> updateWorkspace({
    required String workspaceId,
    String? description,
    String? role,
    String? s3Location,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (role != null) 'role': role,
      if (s3Location != null) 's3Location': s3Location,
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

/// Information about the pricing bundle.
class BundleInformation {
  /// The bundle names.
  final List<String> bundleNames;

  /// The pricing tier.
  final PricingTier? pricingTier;

  BundleInformation({
    required this.bundleNames,
    this.pricingTier,
  });

  factory BundleInformation.fromJson(Map<String, dynamic> json) {
    return BundleInformation(
      bundleNames: (json['bundleNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      pricingTier: (json['pricingTier'] as String?)?.toPricingTier(),
    );
  }

  Map<String, dynamic> toJson() {
    final bundleNames = this.bundleNames;
    final pricingTier = this.pricingTier;
    return {
      'bundleNames': bundleNames,
      if (pricingTier != null) 'pricingTier': pricingTier.toValue(),
    };
  }
}

class CancelMetadataTransferJobResponse {
  /// The metadata transfer job ARN.
  final String arn;

  /// The metadata transfer job Id.
  final String metadataTransferJobId;

  /// The metadata transfer job's status.
  final MetadataTransferJobStatus status;

  /// Used to update the DateTime property.
  final DateTime updateDateTime;

  /// The metadata transfer job's progress.
  final MetadataTransferJobProgress? progress;

  CancelMetadataTransferJobResponse({
    required this.arn,
    required this.metadataTransferJobId,
    required this.status,
    required this.updateDateTime,
    this.progress,
  });

  factory CancelMetadataTransferJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelMetadataTransferJobResponse(
      arn: json['arn'] as String,
      metadataTransferJobId: json['metadataTransferJobId'] as String,
      status: MetadataTransferJobStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      progress: json['progress'] != null
          ? MetadataTransferJobProgress.fromJson(
              json['progress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final metadataTransferJobId = this.metadataTransferJobId;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    final progress = this.progress;
    return {
      'arn': arn,
      'metadataTransferJobId': metadataTransferJobId,
      'status': status,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (progress != null) 'progress': progress,
    };
  }
}

/// A description of the column in the query results.
class ColumnDescription {
  /// The name of the column description.
  final String? name;

  /// The type of the column description.
  final ColumnType? type;

  ColumnDescription({
    this.name,
    this.type,
  });

  factory ColumnDescription.fromJson(Map<String, dynamic> json) {
    return ColumnDescription(
      name: json['name'] as String?,
      type: (json['type'] as String?)?.toColumnType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ColumnType {
  node,
  edge,
  value,
}

extension ColumnTypeValueExtension on ColumnType {
  String toValue() {
    switch (this) {
      case ColumnType.node:
        return 'NODE';
      case ColumnType.edge:
        return 'EDGE';
      case ColumnType.value:
        return 'VALUE';
    }
  }
}

extension ColumnTypeFromString on String {
  ColumnType toColumnType() {
    switch (this) {
      case 'NODE':
        return ColumnType.node;
      case 'EDGE':
        return ColumnType.edge;
      case 'VALUE':
        return ColumnType.value;
    }
    throw Exception('$this is not known in enum ColumnType');
  }
}

/// The component property group request.
class ComponentPropertyGroupRequest {
  /// The group type.
  final GroupType? groupType;

  /// The property names.
  final List<String>? propertyNames;

  /// The update type.
  final PropertyGroupUpdateType? updateType;

  ComponentPropertyGroupRequest({
    this.groupType,
    this.propertyNames,
    this.updateType,
  });

  Map<String, dynamic> toJson() {
    final groupType = this.groupType;
    final propertyNames = this.propertyNames;
    final updateType = this.updateType;
    return {
      if (groupType != null) 'groupType': groupType.toValue(),
      if (propertyNames != null) 'propertyNames': propertyNames,
      if (updateType != null) 'updateType': updateType.toValue(),
    };
  }
}

/// The component property group response.
class ComponentPropertyGroupResponse {
  /// The group type.
  final GroupType groupType;

  /// A Boolean value that specifies whether the property group is inherited from
  /// a parent entity
  final bool isInherited;

  /// The names of properties
  final List<String> propertyNames;

  ComponentPropertyGroupResponse({
    required this.groupType,
    required this.isInherited,
    required this.propertyNames,
  });

  factory ComponentPropertyGroupResponse.fromJson(Map<String, dynamic> json) {
    return ComponentPropertyGroupResponse(
      groupType: (json['groupType'] as String).toGroupType(),
      isInherited: json['isInherited'] as bool,
      propertyNames: (json['propertyNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupType = this.groupType;
    final isInherited = this.isInherited;
    final propertyNames = this.propertyNames;
    return {
      'groupType': groupType.toValue(),
      'isInherited': isInherited,
      'propertyNames': propertyNames,
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

  /// The property groups.
  final Map<String, ComponentPropertyGroupRequest>? propertyGroups;

  ComponentRequest({
    this.componentTypeId,
    this.description,
    this.properties,
    this.propertyGroups,
  });

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final description = this.description;
    final properties = this.properties;
    final propertyGroups = this.propertyGroups;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
    };
  }
}

/// An object that returns information about a component type create or update
/// request.
class ComponentResponse {
  /// This flag notes whether all <code>compositeComponents</code> are returned in
  /// the API response.
  final bool? areAllCompositeComponentsReturned;

  /// This flag notes whether all properties of the component are returned in the
  /// API response. The maximum number of properties returned is 800.
  final bool? areAllPropertiesReturned;

  /// The name of the component.
  final String? componentName;

  /// The ID of the component type.
  final String? componentTypeId;

  /// This lists objects that contain information about the
  /// <code>compositeComponents</code>.
  final Map<String, ComponentSummary>? compositeComponents;

  /// The name of the property definition set in the request.
  final String? definedIn;

  /// The description of the component type.
  final String? description;

  /// An object that maps strings to the properties to set in the component type.
  /// Each string in the mapping must be unique to this object.
  final Map<String, PropertyResponse>? properties;

  /// The property groups.
  final Map<String, ComponentPropertyGroupResponse>? propertyGroups;

  /// The status of the component type.
  final Status? status;

  /// The syncSource of the sync job, if this entity was created by a sync job.
  final String? syncSource;

  ComponentResponse({
    this.areAllCompositeComponentsReturned,
    this.areAllPropertiesReturned,
    this.componentName,
    this.componentTypeId,
    this.compositeComponents,
    this.definedIn,
    this.description,
    this.properties,
    this.propertyGroups,
    this.status,
    this.syncSource,
  });

  factory ComponentResponse.fromJson(Map<String, dynamic> json) {
    return ComponentResponse(
      areAllCompositeComponentsReturned:
          json['areAllCompositeComponentsReturned'] as bool?,
      areAllPropertiesReturned: json['areAllPropertiesReturned'] as bool?,
      componentName: json['componentName'] as String?,
      componentTypeId: json['componentTypeId'] as String?,
      compositeComponents:
          (json['compositeComponents'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, ComponentSummary.fromJson(e as Map<String, dynamic>))),
      definedIn: json['definedIn'] as String?,
      description: json['description'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PropertyResponse.fromJson(e as Map<String, dynamic>))),
      propertyGroups: (json['propertyGroups'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k,
              ComponentPropertyGroupResponse.fromJson(
                  e as Map<String, dynamic>))),
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      syncSource: json['syncSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final areAllCompositeComponentsReturned =
        this.areAllCompositeComponentsReturned;
    final areAllPropertiesReturned = this.areAllPropertiesReturned;
    final componentName = this.componentName;
    final componentTypeId = this.componentTypeId;
    final compositeComponents = this.compositeComponents;
    final definedIn = this.definedIn;
    final description = this.description;
    final properties = this.properties;
    final propertyGroups = this.propertyGroups;
    final status = this.status;
    final syncSource = this.syncSource;
    return {
      if (areAllCompositeComponentsReturned != null)
        'areAllCompositeComponentsReturned': areAllCompositeComponentsReturned,
      if (areAllPropertiesReturned != null)
        'areAllPropertiesReturned': areAllPropertiesReturned,
      if (componentName != null) 'componentName': componentName,
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (compositeComponents != null)
        'compositeComponents': compositeComponents,
      if (definedIn != null) 'definedIn': definedIn,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
      if (status != null) 'status': status,
      if (syncSource != null) 'syncSource': syncSource,
    };
  }
}

/// An object that returns information about a component summary.
class ComponentSummary {
  /// The name of the component.
  final String componentName;

  /// The ID of the component type.
  final String componentTypeId;

  /// The status of the component type.
  final Status status;

  /// This string specifies the path to the composite component, starting from the
  /// top-level component.
  final String? componentPath;

  /// The name of the property definition set in the request.
  final String? definedIn;

  /// The description of the component request.
  final String? description;

  /// The property groups.
  final Map<String, ComponentPropertyGroupResponse>? propertyGroups;

  /// The <code>syncSource</code> of the sync job, if this entity was created by a
  /// sync job.
  final String? syncSource;

  ComponentSummary({
    required this.componentName,
    required this.componentTypeId,
    required this.status,
    this.componentPath,
    this.definedIn,
    this.description,
    this.propertyGroups,
    this.syncSource,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      componentName: json['componentName'] as String,
      componentTypeId: json['componentTypeId'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      componentPath: json['componentPath'] as String?,
      definedIn: json['definedIn'] as String?,
      description: json['description'] as String?,
      propertyGroups: (json['propertyGroups'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k,
              ComponentPropertyGroupResponse.fromJson(
                  e as Map<String, dynamic>))),
      syncSource: json['syncSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentTypeId = this.componentTypeId;
    final status = this.status;
    final componentPath = this.componentPath;
    final definedIn = this.definedIn;
    final description = this.description;
    final propertyGroups = this.propertyGroups;
    final syncSource = this.syncSource;
    return {
      'componentName': componentName,
      'componentTypeId': componentTypeId,
      'status': status,
      if (componentPath != null) 'componentPath': componentPath,
      if (definedIn != null) 'definedIn': definedIn,
      if (description != null) 'description': description,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
      if (syncSource != null) 'syncSource': syncSource,
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

  /// The component type name.
  final String? componentTypeName;

  /// The description of the component type.
  final String? description;

  /// The current status of the component type.
  final Status? status;

  ComponentTypeSummary({
    required this.arn,
    required this.componentTypeId,
    required this.creationDateTime,
    required this.updateDateTime,
    this.componentTypeName,
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
      componentTypeName: json['componentTypeName'] as String?,
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
    final componentTypeName = this.componentTypeName;
    final description = this.description;
    final status = this.status;
    return {
      'arn': arn,
      'componentTypeId': componentTypeId,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (componentTypeName != null) 'componentTypeName': componentTypeName,
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

  /// The property group updates.
  final Map<String, ComponentPropertyGroupRequest>? propertyGroupUpdates;

  /// An object that maps strings to the properties to set in the component type
  /// update. Each string in the mapping must be unique to this object.
  final Map<String, PropertyRequest>? propertyUpdates;

  /// The update type of the component update request.
  final ComponentUpdateType? updateType;

  ComponentUpdateRequest({
    this.componentTypeId,
    this.description,
    this.propertyGroupUpdates,
    this.propertyUpdates,
    this.updateType,
  });

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final description = this.description;
    final propertyGroupUpdates = this.propertyGroupUpdates;
    final propertyUpdates = this.propertyUpdates;
    final updateType = this.updateType;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (description != null) 'description': description,
      if (propertyGroupUpdates != null)
        'propertyGroupUpdates': propertyGroupUpdates,
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

extension ComponentUpdateTypeValueExtension on ComponentUpdateType {
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

extension ComponentUpdateTypeFromString on String {
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

/// An object that sets information about the composite component update
/// request.
class CompositeComponentRequest {
  /// The description of the component type.
  final String? description;

  /// This is an object that maps strings to the properties to set in the
  /// component type. Each string in the mapping must be unique to this object.
  final Map<String, PropertyRequest>? properties;

  /// The property groups.
  final Map<String, ComponentPropertyGroupRequest>? propertyGroups;

  CompositeComponentRequest({
    this.description,
    this.properties,
    this.propertyGroups,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final properties = this.properties;
    final propertyGroups = this.propertyGroups;
    return {
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
    };
  }
}

/// An object that sets information about the composite component types of a
/// component type.
class CompositeComponentTypeRequest {
  /// This is the <code>componentTypeId</code> that the
  /// <code>compositeComponentType</code> refers to.
  final String? componentTypeId;

  CompositeComponentTypeRequest({
    this.componentTypeId,
  });

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
    };
  }
}

/// An object that returns information about the composite component types of a
/// component type.
class CompositeComponentTypeResponse {
  /// This is the <code>componentTypeId</code> that this
  /// <code>compositeComponentType</code> refers to.
  final String? componentTypeId;

  /// This boolean indicates whether this <code>compositeComponentType</code> is
  /// inherited from its parent.
  final bool? isInherited;

  CompositeComponentTypeResponse({
    this.componentTypeId,
    this.isInherited,
  });

  factory CompositeComponentTypeResponse.fromJson(Map<String, dynamic> json) {
    return CompositeComponentTypeResponse(
      componentTypeId: json['componentTypeId'] as String?,
      isInherited: json['isInherited'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    final isInherited = this.isInherited;
    return {
      if (componentTypeId != null) 'componentTypeId': componentTypeId,
      if (isInherited != null) 'isInherited': isInherited,
    };
  }
}

/// An object that sets information about the composite component update
/// request.
class CompositeComponentUpdateRequest {
  /// The description of the component type.
  final String? description;

  /// The property group updates.
  final Map<String, ComponentPropertyGroupRequest>? propertyGroupUpdates;

  /// An object that maps strings to the properties to set in the component type
  /// update. Each string in the mapping must be unique to this object.
  final Map<String, PropertyRequest>? propertyUpdates;

  /// The update type of the component update request.
  final ComponentUpdateType? updateType;

  CompositeComponentUpdateRequest({
    this.description,
    this.propertyGroupUpdates,
    this.propertyUpdates,
    this.updateType,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final propertyGroupUpdates = this.propertyGroupUpdates;
    final propertyUpdates = this.propertyUpdates;
    final updateType = this.updateType;
    return {
      if (description != null) 'description': description,
      if (propertyGroupUpdates != null)
        'propertyGroupUpdates': propertyGroupUpdates,
      if (propertyUpdates != null) 'propertyUpdates': propertyUpdates,
      if (updateType != null) 'updateType': updateType.toValue(),
    };
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

class CreateMetadataTransferJobResponse {
  /// The metadata transfer job ARN.
  final String arn;

  /// The The metadata transfer job creation DateTime property.
  final DateTime creationDateTime;

  /// The metadata transfer job Id.
  final String metadataTransferJobId;

  /// The metadata transfer job response status.
  final MetadataTransferJobStatus status;

  CreateMetadataTransferJobResponse({
    required this.arn,
    required this.creationDateTime,
    required this.metadataTransferJobId,
    required this.status,
  });

  factory CreateMetadataTransferJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMetadataTransferJobResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      metadataTransferJobId: json['metadataTransferJobId'] as String,
      status: MetadataTransferJobStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final metadataTransferJobId = this.metadataTransferJobId;
    final status = this.status;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'metadataTransferJobId': metadataTransferJobId,
      'status': status,
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

class CreateSyncJobResponse {
  /// The SyncJob ARN.
  final String arn;

  /// The date and time for the SyncJob creation.
  final DateTime creationDateTime;

  /// The SyncJob response state.
  final SyncJobState state;

  CreateSyncJobResponse({
    required this.arn,
    required this.creationDateTime,
    required this.state,
  });

  factory CreateSyncJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateSyncJobResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      state: (json['state'] as String).toSyncJobState(),
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

class DeleteSyncJobResponse {
  /// The SyncJob response state.
  final SyncJobState state;

  DeleteSyncJobResponse({
    required this.state,
  });

  factory DeleteSyncJobResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSyncJobResponse(
      state: (json['state'] as String).toSyncJobState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.toValue(),
    };
  }
}

class DeleteWorkspaceResponse {
  /// The string that specifies the delete result for the workspace.
  final String? message;

  DeleteWorkspaceResponse({
    this.message,
  });

  factory DeleteWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkspaceResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The [link to action] metadata transfer job destination configuration.
class DestinationConfiguration {
  /// The destination type.
  final DestinationType type;

  /// The metadata transfer job Amazon Web Services IoT TwinMaker configuration.
  final IotTwinMakerDestinationConfiguration? iotTwinMakerConfiguration;

  /// The metadata transfer job S3 configuration. [need to add S3 entity]
  final S3DestinationConfiguration? s3Configuration;

  DestinationConfiguration({
    required this.type,
    this.iotTwinMakerConfiguration,
    this.s3Configuration,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      type: (json['type'] as String).toDestinationType(),
      iotTwinMakerConfiguration: json['iotTwinMakerConfiguration'] != null
          ? IotTwinMakerDestinationConfiguration.fromJson(
              json['iotTwinMakerConfiguration'] as Map<String, dynamic>)
          : null,
      s3Configuration: json['s3Configuration'] != null
          ? S3DestinationConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final iotTwinMakerConfiguration = this.iotTwinMakerConfiguration;
    final s3Configuration = this.s3Configuration;
    return {
      'type': type.toValue(),
      if (iotTwinMakerConfiguration != null)
        'iotTwinMakerConfiguration': iotTwinMakerConfiguration,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

enum DestinationType {
  s3,
  iotsitewise,
  iottwinmaker,
}

extension DestinationTypeValueExtension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.s3:
        return 's3';
      case DestinationType.iotsitewise:
        return 'iotsitewise';
      case DestinationType.iottwinmaker:
        return 'iottwinmaker';
    }
  }
}

extension DestinationTypeFromString on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 's3':
        return DestinationType.s3;
      case 'iotsitewise':
        return DestinationType.iotsitewise;
      case 'iottwinmaker':
        return DestinationType.iottwinmaker;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
}

/// An object that uniquely identifies an entity property.
class EntityPropertyReference {
  /// The name of the property.
  final String propertyName;

  /// The name of the component.
  final String? componentName;

  /// This string specifies the path to the composite component, starting from the
  /// top-level component.
  final String? componentPath;

  /// The ID of the entity.
  final String? entityId;

  /// A mapping of external IDs to property names. External IDs uniquely identify
  /// properties from external data stores.
  final Map<String, String>? externalIdProperty;

  EntityPropertyReference({
    required this.propertyName,
    this.componentName,
    this.componentPath,
    this.entityId,
    this.externalIdProperty,
  });

  factory EntityPropertyReference.fromJson(Map<String, dynamic> json) {
    return EntityPropertyReference(
      propertyName: json['propertyName'] as String,
      componentName: json['componentName'] as String?,
      componentPath: json['componentPath'] as String?,
      entityId: json['entityId'] as String?,
      externalIdProperty: (json['externalIdProperty'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyName = this.propertyName;
    final componentName = this.componentName;
    final componentPath = this.componentPath;
    final entityId = this.entityId;
    final externalIdProperty = this.externalIdProperty;
    return {
      'propertyName': propertyName,
      if (componentName != null) 'componentName': componentName,
      if (componentPath != null) 'componentPath': componentPath,
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

  /// An <b>eventual</b> Boolean value that specifies whether the entity has child
  /// entities or not.
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
  syncInitializingError,
  syncCreatingError,
  syncProcessingError,
  syncDeletingError,
  processingError,
  compositeComponentFailure,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case ErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
      case ErrorCode.syncInitializingError:
        return 'SYNC_INITIALIZING_ERROR';
      case ErrorCode.syncCreatingError:
        return 'SYNC_CREATING_ERROR';
      case ErrorCode.syncProcessingError:
        return 'SYNC_PROCESSING_ERROR';
      case ErrorCode.syncDeletingError:
        return 'SYNC_DELETING_ERROR';
      case ErrorCode.processingError:
        return 'PROCESSING_ERROR';
      case ErrorCode.compositeComponentFailure:
        return 'COMPOSITE_COMPONENT_FAILURE';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'VALIDATION_ERROR':
        return ErrorCode.validationError;
      case 'INTERNAL_FAILURE':
        return ErrorCode.internalFailure;
      case 'SYNC_INITIALIZING_ERROR':
        return ErrorCode.syncInitializingError;
      case 'SYNC_CREATING_ERROR':
        return ErrorCode.syncCreatingError;
      case 'SYNC_PROCESSING_ERROR':
        return ErrorCode.syncProcessingError;
      case 'SYNC_DELETING_ERROR':
        return ErrorCode.syncDeletingError;
      case 'PROCESSING_ERROR':
        return ErrorCode.processingError;
      case 'COMPOSITE_COMPONENT_FAILURE':
        return ErrorCode.compositeComponentFailure;
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

class ExecuteQueryResponse {
  /// A list of ColumnDescription objects.
  final List<ColumnDescription>? columnDescriptions;

  /// The string that specifies the next page of results.
  final String? nextToken;

  /// Represents a single row in the query results.
  final List<Row>? rows;

  ExecuteQueryResponse({
    this.columnDescriptions,
    this.nextToken,
    this.rows,
  });

  factory ExecuteQueryResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteQueryResponse(
      columnDescriptions: (json['columnDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      rows: (json['rows'] as List?)
          ?.whereNotNull()
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnDescriptions = this.columnDescriptions;
    final nextToken = this.nextToken;
    final rows = this.rows;
    return {
      if (columnDescriptions != null) 'columnDescriptions': columnDescriptions,
      if (nextToken != null) 'nextToken': nextToken,
      if (rows != null) 'rows': rows,
    };
  }
}

/// Filter by asset. [TwinMaker asset]
class FilterByAsset {
  /// The external-Id property of an asset.
  final String? assetExternalId;

  /// Filter by asset Id.
  final String? assetId;

  /// Boolean to include the asset model.
  final bool? includeAssetModel;

  /// Includes sub-assets.[need description hekp for this]
  final bool? includeOffspring;

  FilterByAsset({
    this.assetExternalId,
    this.assetId,
    this.includeAssetModel,
    this.includeOffspring,
  });

  factory FilterByAsset.fromJson(Map<String, dynamic> json) {
    return FilterByAsset(
      assetExternalId: json['assetExternalId'] as String?,
      assetId: json['assetId'] as String?,
      includeAssetModel: json['includeAssetModel'] as bool?,
      includeOffspring: json['includeOffspring'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetExternalId = this.assetExternalId;
    final assetId = this.assetId;
    final includeAssetModel = this.includeAssetModel;
    final includeOffspring = this.includeOffspring;
    return {
      if (assetExternalId != null) 'assetExternalId': assetExternalId,
      if (assetId != null) 'assetId': assetId,
      if (includeAssetModel != null) 'includeAssetModel': includeAssetModel,
      if (includeOffspring != null) 'includeOffspring': includeOffspring,
    };
  }
}

/// Filter by asset model.
class FilterByAssetModel {
  /// The external-Id property of an asset model.
  final String? assetModelExternalId;

  /// The asset model Id.
  final String? assetModelId;

  /// Bolean to include assets.
  final bool? includeAssets;

  /// Include asset offspring. [need desc.]
  final bool? includeOffspring;

  FilterByAssetModel({
    this.assetModelExternalId,
    this.assetModelId,
    this.includeAssets,
    this.includeOffspring,
  });

  factory FilterByAssetModel.fromJson(Map<String, dynamic> json) {
    return FilterByAssetModel(
      assetModelExternalId: json['assetModelExternalId'] as String?,
      assetModelId: json['assetModelId'] as String?,
      includeAssets: json['includeAssets'] as bool?,
      includeOffspring: json['includeOffspring'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelExternalId = this.assetModelExternalId;
    final assetModelId = this.assetModelId;
    final includeAssets = this.includeAssets;
    final includeOffspring = this.includeOffspring;
    return {
      if (assetModelExternalId != null)
        'assetModelExternalId': assetModelExternalId,
      if (assetModelId != null) 'assetModelId': assetModelId,
      if (includeAssets != null) 'includeAssets': includeAssets,
      if (includeOffspring != null) 'includeOffspring': includeOffspring,
    };
  }
}

/// Filter by component type.
class FilterByComponentType {
  /// The component type Id.
  final String componentTypeId;

  FilterByComponentType({
    required this.componentTypeId,
  });

  factory FilterByComponentType.fromJson(Map<String, dynamic> json) {
    return FilterByComponentType(
      componentTypeId: json['componentTypeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final componentTypeId = this.componentTypeId;
    return {
      'componentTypeId': componentTypeId,
    };
  }
}

/// Vilter by entity.
class FilterByEntity {
  /// The entity Id.
  final String entityId;

  FilterByEntity({
    required this.entityId,
  });

  factory FilterByEntity.fromJson(Map<String, dynamic> json) {
    return FilterByEntity(
      entityId: json['entityId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    return {
      'entityId': entityId,
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

  /// The component type name.
  final String? componentTypeName;

  /// This is an object that maps strings to <code>compositeComponentTypes</code>
  /// of the <code>componentType</code>. <code>CompositeComponentType</code> is
  /// referenced by <code>componentTypeId</code>.
  final Map<String, CompositeComponentTypeResponse>? compositeComponentTypes;

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

  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 250.
  final Map<String, PropertyGroupResponse>? propertyGroups;

  /// The current status of the component type.
  final Status? status;

  /// The syncSource of the SyncJob, if this entity was created by a SyncJob.
  final String? syncSource;

  GetComponentTypeResponse({
    required this.arn,
    required this.componentTypeId,
    required this.creationDateTime,
    required this.updateDateTime,
    required this.workspaceId,
    this.componentTypeName,
    this.compositeComponentTypes,
    this.description,
    this.extendsFrom,
    this.functions,
    this.isAbstract,
    this.isSchemaInitialized,
    this.isSingleton,
    this.propertyDefinitions,
    this.propertyGroups,
    this.status,
    this.syncSource,
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
      componentTypeName: json['componentTypeName'] as String?,
      compositeComponentTypes:
          (json['compositeComponentTypes'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k,
                  CompositeComponentTypeResponse.fromJson(
                      e as Map<String, dynamic>))),
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
      propertyGroups: (json['propertyGroups'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, PropertyGroupResponse.fromJson(e as Map<String, dynamic>))),
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      syncSource: json['syncSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final componentTypeId = this.componentTypeId;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final componentTypeName = this.componentTypeName;
    final compositeComponentTypes = this.compositeComponentTypes;
    final description = this.description;
    final extendsFrom = this.extendsFrom;
    final functions = this.functions;
    final isAbstract = this.isAbstract;
    final isSchemaInitialized = this.isSchemaInitialized;
    final isSingleton = this.isSingleton;
    final propertyDefinitions = this.propertyDefinitions;
    final propertyGroups = this.propertyGroups;
    final status = this.status;
    final syncSource = this.syncSource;
    return {
      'arn': arn,
      'componentTypeId': componentTypeId,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (componentTypeName != null) 'componentTypeName': componentTypeName,
      if (compositeComponentTypes != null)
        'compositeComponentTypes': compositeComponentTypes,
      if (description != null) 'description': description,
      if (extendsFrom != null) 'extendsFrom': extendsFrom,
      if (functions != null) 'functions': functions,
      if (isAbstract != null) 'isAbstract': isAbstract,
      if (isSchemaInitialized != null)
        'isSchemaInitialized': isSchemaInitialized,
      if (isSingleton != null) 'isSingleton': isSingleton,
      if (propertyDefinitions != null)
        'propertyDefinitions': propertyDefinitions,
      if (propertyGroups != null) 'propertyGroups': propertyGroups,
      if (status != null) 'status': status,
      if (syncSource != null) 'syncSource': syncSource,
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

  /// This flag notes whether all components are returned in the API response. The
  /// maximum number of components returned is 30.
  final bool? areAllComponentsReturned;

  /// An object that maps strings to the components in the entity. Each string in
  /// the mapping must be unique to this object.
  final Map<String, ComponentResponse>? components;

  /// The description of the entity.
  final String? description;

  /// The syncSource of the sync job, if this entity was created by a sync job.
  final String? syncSource;

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
    this.areAllComponentsReturned,
    this.components,
    this.description,
    this.syncSource,
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
      areAllComponentsReturned: json['areAllComponentsReturned'] as bool?,
      components: (json['components'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentResponse.fromJson(e as Map<String, dynamic>))),
      description: json['description'] as String?,
      syncSource: json['syncSource'] as String?,
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
    final areAllComponentsReturned = this.areAllComponentsReturned;
    final components = this.components;
    final description = this.description;
    final syncSource = this.syncSource;
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
      if (areAllComponentsReturned != null)
        'areAllComponentsReturned': areAllComponentsReturned,
      if (components != null) 'components': components,
      if (description != null) 'description': description,
      if (syncSource != null) 'syncSource': syncSource,
    };
  }
}

class GetMetadataTransferJobResponse {
  /// The metadata transfer job ARN.
  final String arn;

  /// The metadata transfer job's creation DateTime property.
  final DateTime creationDateTime;

  /// The metadata transfer job's destination.
  final DestinationConfiguration destination;

  /// The metadata transfer job Id.
  final String metadataTransferJobId;

  /// The metadata transfer job's role.
  final String metadataTransferJobRole;

  /// The metadata transfer job's sources.
  final List<SourceConfiguration> sources;

  /// The metadata transfer job's status.
  final MetadataTransferJobStatus status;

  /// The metadata transfer job's update DateTime property.
  final DateTime updateDateTime;

  /// The metadata transfer job description.
  final String? description;

  /// The metadata transfer job's progress.
  final MetadataTransferJobProgress? progress;

  /// The metadata transfer job's report URL.
  final String? reportUrl;

  GetMetadataTransferJobResponse({
    required this.arn,
    required this.creationDateTime,
    required this.destination,
    required this.metadataTransferJobId,
    required this.metadataTransferJobRole,
    required this.sources,
    required this.status,
    required this.updateDateTime,
    this.description,
    this.progress,
    this.reportUrl,
  });

  factory GetMetadataTransferJobResponse.fromJson(Map<String, dynamic> json) {
    return GetMetadataTransferJobResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      destination: DestinationConfiguration.fromJson(
          json['destination'] as Map<String, dynamic>),
      metadataTransferJobId: json['metadataTransferJobId'] as String,
      metadataTransferJobRole: json['metadataTransferJobRole'] as String,
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) => SourceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: MetadataTransferJobStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      description: json['description'] as String?,
      progress: json['progress'] != null
          ? MetadataTransferJobProgress.fromJson(
              json['progress'] as Map<String, dynamic>)
          : null,
      reportUrl: json['reportUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final destination = this.destination;
    final metadataTransferJobId = this.metadataTransferJobId;
    final metadataTransferJobRole = this.metadataTransferJobRole;
    final sources = this.sources;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    final description = this.description;
    final progress = this.progress;
    final reportUrl = this.reportUrl;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'destination': destination,
      'metadataTransferJobId': metadataTransferJobId,
      'metadataTransferJobRole': metadataTransferJobRole,
      'sources': sources,
      'status': status,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (description != null) 'description': description,
      if (progress != null) 'progress': progress,
      if (reportUrl != null) 'reportUrl': reportUrl,
    };
  }
}

class GetPricingPlanResponse {
  /// The chosen pricing plan for the current billing cycle.
  final PricingPlan currentPricingPlan;

  /// The pending pricing plan.
  final PricingPlan? pendingPricingPlan;

  GetPricingPlanResponse({
    required this.currentPricingPlan,
    this.pendingPricingPlan,
  });

  factory GetPricingPlanResponse.fromJson(Map<String, dynamic> json) {
    return GetPricingPlanResponse(
      currentPricingPlan: PricingPlan.fromJson(
          json['currentPricingPlan'] as Map<String, dynamic>),
      pendingPricingPlan: json['pendingPricingPlan'] != null
          ? PricingPlan.fromJson(
              json['pendingPricingPlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currentPricingPlan = this.currentPricingPlan;
    final pendingPricingPlan = this.pendingPricingPlan;
    return {
      'currentPricingPlan': currentPricingPlan,
      if (pendingPricingPlan != null) 'pendingPricingPlan': pendingPricingPlan,
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
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// An object that maps strings to the properties and latest property values in
  /// the response. Each string in the mapping must be unique to this object.
  final Map<String, PropertyLatestValue>? propertyValues;

  /// A table of property values.
  final List<List<Map<String, DataValue>>>? tabularPropertyValues;

  GetPropertyValueResponse({
    this.nextToken,
    this.propertyValues,
    this.tabularPropertyValues,
  });

  factory GetPropertyValueResponse.fromJson(Map<String, dynamic> json) {
    return GetPropertyValueResponse(
      nextToken: json['nextToken'] as String?,
      propertyValues: (json['propertyValues'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PropertyLatestValue.fromJson(e as Map<String, dynamic>))),
      tabularPropertyValues: (json['tabularPropertyValues'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => (e as Map<String, dynamic>).map((k, e) =>
                  MapEntry(k, DataValue.fromJson(e as Map<String, dynamic>))))
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final propertyValues = this.propertyValues;
    final tabularPropertyValues = this.tabularPropertyValues;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (propertyValues != null) 'propertyValues': propertyValues,
      if (tabularPropertyValues != null)
        'tabularPropertyValues': tabularPropertyValues,
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

  /// The SceneResponse error.
  final SceneError? error;

  /// The generated scene metadata.
  final Map<String, String>? generatedSceneMetadata;

  /// The response metadata.
  final Map<String, String>? sceneMetadata;

  GetSceneResponse({
    required this.arn,
    required this.contentLocation,
    required this.creationDateTime,
    required this.sceneId,
    required this.updateDateTime,
    required this.workspaceId,
    this.capabilities,
    this.description,
    this.error,
    this.generatedSceneMetadata,
    this.sceneMetadata,
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
      error: json['error'] != null
          ? SceneError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      generatedSceneMetadata:
          (json['generatedSceneMetadata'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      sceneMetadata: (json['sceneMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final error = this.error;
    final generatedSceneMetadata = this.generatedSceneMetadata;
    final sceneMetadata = this.sceneMetadata;
    return {
      'arn': arn,
      'contentLocation': contentLocation,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'sceneId': sceneId,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
      if (error != null) 'error': error,
      if (generatedSceneMetadata != null)
        'generatedSceneMetadata': generatedSceneMetadata,
      if (sceneMetadata != null) 'sceneMetadata': sceneMetadata,
    };
  }
}

class GetSyncJobResponse {
  /// The sync job ARN.
  final String arn;

  /// The creation date and time.
  final DateTime creationDateTime;

  /// The SyncJob response status.
  final SyncJobStatus status;

  /// The sync IAM role.
  final String syncRole;

  /// The sync soucre.
  /// <note>
  /// Currently the only supported syncSource is <code>SITEWISE </code>.
  /// </note>
  final String syncSource;

  /// The update date and time.
  final DateTime updateDateTime;

  /// The ID of the workspace that contains the sync job.
  final String workspaceId;

  GetSyncJobResponse({
    required this.arn,
    required this.creationDateTime,
    required this.status,
    required this.syncRole,
    required this.syncSource,
    required this.updateDateTime,
    required this.workspaceId,
  });

  factory GetSyncJobResponse.fromJson(Map<String, dynamic> json) {
    return GetSyncJobResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      status: SyncJobStatus.fromJson(json['status'] as Map<String, dynamic>),
      syncRole: json['syncRole'] as String,
      syncSource: json['syncSource'] as String,
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final status = this.status;
    final syncRole = this.syncRole;
    final syncSource = this.syncSource;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'status': status,
      'syncRole': syncRole,
      'syncSource': syncSource,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
    };
  }
}

class GetWorkspaceResponse {
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

  /// A list of services that are linked to the workspace.
  final List<String>? linkedServices;

  /// The ARN of the execution role associated with the workspace.
  final String? role;

  /// The ARN of the S3 bucket where resources associated with the workspace are
  /// stored.
  final String? s3Location;

  GetWorkspaceResponse({
    required this.arn,
    required this.creationDateTime,
    required this.updateDateTime,
    required this.workspaceId,
    this.description,
    this.linkedServices,
    this.role,
    this.s3Location,
  });

  factory GetWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkspaceResponse(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      workspaceId: json['workspaceId'] as String,
      description: json['description'] as String?,
      linkedServices: (json['linkedServices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      role: json['role'] as String?,
      s3Location: json['s3Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final description = this.description;
    final linkedServices = this.linkedServices;
    final role = this.role;
    final s3Location = this.s3Location;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (description != null) 'description': description,
      if (linkedServices != null) 'linkedServices': linkedServices,
      if (role != null) 'role': role,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

enum GroupType {
  tabular,
}

extension GroupTypeValueExtension on GroupType {
  String toValue() {
    switch (this) {
      case GroupType.tabular:
        return 'TABULAR';
    }
  }
}

extension GroupTypeFromString on String {
  GroupType toGroupType() {
    switch (this) {
      case 'TABULAR':
        return GroupType.tabular;
    }
    throw Exception('$this is not known in enum GroupType');
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

extension InterpolationTypeValueExtension on InterpolationType {
  String toValue() {
    switch (this) {
      case InterpolationType.linear:
        return 'LINEAR';
    }
  }
}

extension InterpolationTypeFromString on String {
  InterpolationType toInterpolationType() {
    switch (this) {
      case 'LINEAR':
        return InterpolationType.linear;
    }
    throw Exception('$this is not known in enum InterpolationType');
  }
}

/// The metadata transfer job AWS IoT SiteWise source configuration.
class IotSiteWiseSourceConfiguration {
  /// The AWS IoT SiteWise soucre configuration filters.
  final List<IotSiteWiseSourceConfigurationFilter>? filters;

  IotSiteWiseSourceConfiguration({
    this.filters,
  });

  factory IotSiteWiseSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return IotSiteWiseSourceConfiguration(
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map((e) => IotSiteWiseSourceConfigurationFilter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'filters': filters,
    };
  }
}

/// The AWS IoT SiteWise soucre configuration filter.[need held with desc here]
class IotSiteWiseSourceConfigurationFilter {
  /// Filter by asset.
  final FilterByAsset? filterByAsset;

  /// Filter by asset model.
  final FilterByAssetModel? filterByAssetModel;

  IotSiteWiseSourceConfigurationFilter({
    this.filterByAsset,
    this.filterByAssetModel,
  });

  factory IotSiteWiseSourceConfigurationFilter.fromJson(
      Map<String, dynamic> json) {
    return IotSiteWiseSourceConfigurationFilter(
      filterByAsset: json['filterByAsset'] != null
          ? FilterByAsset.fromJson(
              json['filterByAsset'] as Map<String, dynamic>)
          : null,
      filterByAssetModel: json['filterByAssetModel'] != null
          ? FilterByAssetModel.fromJson(
              json['filterByAssetModel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterByAsset = this.filterByAsset;
    final filterByAssetModel = this.filterByAssetModel;
    return {
      if (filterByAsset != null) 'filterByAsset': filterByAsset,
      if (filterByAssetModel != null) 'filterByAssetModel': filterByAssetModel,
    };
  }
}

/// The metadata transfer job AWS IoT TwinMaker destination configuration.
class IotTwinMakerDestinationConfiguration {
  /// The IoT TwinMaker workspace.
  final String workspace;

  IotTwinMakerDestinationConfiguration({
    required this.workspace,
  });

  factory IotTwinMakerDestinationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return IotTwinMakerDestinationConfiguration(
      workspace: json['workspace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// The metadata transfer job AWS IoT TwinMaker source configuration.
class IotTwinMakerSourceConfiguration {
  /// The IoT TwinMaker workspace.
  final String workspace;

  /// The metadata transfer job AWS IoT TwinMaker source configuration filters.
  final List<IotTwinMakerSourceConfigurationFilter>? filters;

  IotTwinMakerSourceConfiguration({
    required this.workspace,
    this.filters,
  });

  factory IotTwinMakerSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return IotTwinMakerSourceConfiguration(
      workspace: json['workspace'] as String,
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map((e) => IotTwinMakerSourceConfigurationFilter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    final filters = this.filters;
    return {
      'workspace': workspace,
      if (filters != null) 'filters': filters,
    };
  }
}

/// The metadata transfer job AWS IoT TwinMaker source configuration filter.
class IotTwinMakerSourceConfigurationFilter {
  /// Filter by component type.
  final FilterByComponentType? filterByComponentType;

  /// Filter by entity.
  final FilterByEntity? filterByEntity;

  IotTwinMakerSourceConfigurationFilter({
    this.filterByComponentType,
    this.filterByEntity,
  });

  factory IotTwinMakerSourceConfigurationFilter.fromJson(
      Map<String, dynamic> json) {
    return IotTwinMakerSourceConfigurationFilter(
      filterByComponentType: json['filterByComponentType'] != null
          ? FilterByComponentType.fromJson(
              json['filterByComponentType'] as Map<String, dynamic>)
          : null,
      filterByEntity: json['filterByEntity'] != null
          ? FilterByEntity.fromJson(
              json['filterByEntity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterByComponentType = this.filterByComponentType;
    final filterByEntity = this.filterByEntity;
    return {
      if (filterByComponentType != null)
        'filterByComponentType': filterByComponentType,
      if (filterByEntity != null) 'filterByEntity': filterByEntity,
    };
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

class ListComponentsResponse {
  /// A list of objects that contain information about the components.
  final List<ComponentSummary> componentSummaries;

  /// The string that specifies the next page of component results.
  final String? nextToken;

  ListComponentsResponse({
    required this.componentSummaries,
    this.nextToken,
  });

  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentsResponse(
      componentSummaries: (json['componentSummaries'] as List)
          .whereNotNull()
          .map((e) => ComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentSummaries = this.componentSummaries;
    final nextToken = this.nextToken;
    return {
      'componentSummaries': componentSummaries,
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

/// The ListMetadataTransferJobs filter.
class ListMetadataTransferJobsFilter {
  /// The filter state.
  final MetadataTransferJobState? state;

  /// The workspace Id.
  final String? workspaceId;

  ListMetadataTransferJobsFilter({
    this.state,
    this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final state = this.state;
    final workspaceId = this.workspaceId;
    return {
      if (state != null) 'state': state.toValue(),
      if (workspaceId != null) 'workspaceId': workspaceId,
    };
  }
}

class ListMetadataTransferJobsResponse {
  /// The metadata transfer job summaries.
  final List<MetadataTransferJobSummary> metadataTransferJobSummaries;

  /// The string that specifies the next page of results.
  final String? nextToken;

  ListMetadataTransferJobsResponse({
    required this.metadataTransferJobSummaries,
    this.nextToken,
  });

  factory ListMetadataTransferJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListMetadataTransferJobsResponse(
      metadataTransferJobSummaries: (json['metadataTransferJobSummaries']
              as List)
          .whereNotNull()
          .map((e) =>
              MetadataTransferJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataTransferJobSummaries = this.metadataTransferJobSummaries;
    final nextToken = this.nextToken;
    return {
      'metadataTransferJobSummaries': metadataTransferJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPropertiesResponse {
  /// A list of objects that contain information about the properties.
  final List<PropertySummary> propertySummaries;

  /// The string that specifies the next page of property results.
  final String? nextToken;

  ListPropertiesResponse({
    required this.propertySummaries,
    this.nextToken,
  });

  factory ListPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return ListPropertiesResponse(
      propertySummaries: (json['propertySummaries'] as List)
          .whereNotNull()
          .map((e) => PropertySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final propertySummaries = this.propertySummaries;
    final nextToken = this.nextToken;
    return {
      'propertySummaries': propertySummaries,
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

class ListSyncJobsResponse {
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// The listed SyncJob summaries.
  final List<SyncJobSummary>? syncJobSummaries;

  ListSyncJobsResponse({
    this.nextToken,
    this.syncJobSummaries,
  });

  factory ListSyncJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListSyncJobsResponse(
      nextToken: json['nextToken'] as String?,
      syncJobSummaries: (json['syncJobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SyncJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final syncJobSummaries = this.syncJobSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (syncJobSummaries != null) 'syncJobSummaries': syncJobSummaries,
    };
  }
}

class ListSyncResourcesResponse {
  /// The string that specifies the next page of results.
  final String? nextToken;

  /// The sync resources.
  final List<SyncResourceSummary>? syncResources;

  ListSyncResourcesResponse({
    this.nextToken,
    this.syncResources,
  });

  factory ListSyncResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListSyncResourcesResponse(
      nextToken: json['nextToken'] as String?,
      syncResources: (json['syncResources'] as List?)
          ?.whereNotNull()
          .map((e) => SyncResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final syncResources = this.syncResources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (syncResources != null) 'syncResources': syncResources,
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

/// The metadata transfer job's progress.
class MetadataTransferJobProgress {
  /// The failed count.
  final int? failedCount;

  /// The skipped count.
  final int? skippedCount;

  /// The succeeded count.
  final int? succeededCount;

  /// The total count. [of what]
  final int? totalCount;

  MetadataTransferJobProgress({
    this.failedCount,
    this.skippedCount,
    this.succeededCount,
    this.totalCount,
  });

  factory MetadataTransferJobProgress.fromJson(Map<String, dynamic> json) {
    return MetadataTransferJobProgress(
      failedCount: json['failedCount'] as int?,
      skippedCount: json['skippedCount'] as int?,
      succeededCount: json['succeededCount'] as int?,
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedCount = this.failedCount;
    final skippedCount = this.skippedCount;
    final succeededCount = this.succeededCount;
    final totalCount = this.totalCount;
    return {
      if (failedCount != null) 'failedCount': failedCount,
      if (skippedCount != null) 'skippedCount': skippedCount,
      if (succeededCount != null) 'succeededCount': succeededCount,
      if (totalCount != null) 'totalCount': totalCount,
    };
  }
}

enum MetadataTransferJobState {
  validating,
  pending,
  running,
  cancelling,
  error,
  completed,
  cancelled,
}

extension MetadataTransferJobStateValueExtension on MetadataTransferJobState {
  String toValue() {
    switch (this) {
      case MetadataTransferJobState.validating:
        return 'VALIDATING';
      case MetadataTransferJobState.pending:
        return 'PENDING';
      case MetadataTransferJobState.running:
        return 'RUNNING';
      case MetadataTransferJobState.cancelling:
        return 'CANCELLING';
      case MetadataTransferJobState.error:
        return 'ERROR';
      case MetadataTransferJobState.completed:
        return 'COMPLETED';
      case MetadataTransferJobState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension MetadataTransferJobStateFromString on String {
  MetadataTransferJobState toMetadataTransferJobState() {
    switch (this) {
      case 'VALIDATING':
        return MetadataTransferJobState.validating;
      case 'PENDING':
        return MetadataTransferJobState.pending;
      case 'RUNNING':
        return MetadataTransferJobState.running;
      case 'CANCELLING':
        return MetadataTransferJobState.cancelling;
      case 'ERROR':
        return MetadataTransferJobState.error;
      case 'COMPLETED':
        return MetadataTransferJobState.completed;
      case 'CANCELLED':
        return MetadataTransferJobState.cancelled;
    }
    throw Exception('$this is not known in enum MetadataTransferJobState');
  }
}

/// The metadata transfer job status.
class MetadataTransferJobStatus {
  /// The metadata transfer job error.
  final ErrorDetails? error;

  /// The queued position.
  final int? queuedPosition;

  /// The metadata transfer job state.
  final MetadataTransferJobState? state;

  MetadataTransferJobStatus({
    this.error,
    this.queuedPosition,
    this.state,
  });

  factory MetadataTransferJobStatus.fromJson(Map<String, dynamic> json) {
    return MetadataTransferJobStatus(
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      queuedPosition: json['queuedPosition'] as int?,
      state: (json['state'] as String?)?.toMetadataTransferJobState(),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final queuedPosition = this.queuedPosition;
    final state = this.state;
    return {
      if (error != null) 'error': error,
      if (queuedPosition != null) 'queuedPosition': queuedPosition,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// The metadata transfer job summary.
class MetadataTransferJobSummary {
  /// The metadata transfer job summary ARN.
  final String arn;

  /// The metadata transfer job summary creation DateTime object.
  final DateTime creationDateTime;

  /// The metadata transfer job summary Id.
  final String metadataTransferJobId;

  /// The metadata transfer job summary status.
  final MetadataTransferJobStatus status;

  /// The metadata transfer job summary update DateTime object
  final DateTime updateDateTime;

  /// The metadata transfer job summary progess.
  final MetadataTransferJobProgress? progress;

  MetadataTransferJobSummary({
    required this.arn,
    required this.creationDateTime,
    required this.metadataTransferJobId,
    required this.status,
    required this.updateDateTime,
    this.progress,
  });

  factory MetadataTransferJobSummary.fromJson(Map<String, dynamic> json) {
    return MetadataTransferJobSummary(
      arn: json['arn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['creationDateTime'] as Object),
      metadataTransferJobId: json['metadataTransferJobId'] as String,
      status: MetadataTransferJobStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      progress: json['progress'] != null
          ? MetadataTransferJobProgress.fromJson(
              json['progress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final metadataTransferJobId = this.metadataTransferJobId;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    final progress = this.progress;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'metadataTransferJobId': metadataTransferJobId,
      'status': status,
      'updateDateTime': unixTimestampToJson(updateDateTime),
      if (progress != null) 'progress': progress,
    };
  }
}

enum Order {
  ascending,
  descending,
}

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.ascending:
        return 'ASCENDING';
      case Order.descending:
        return 'DESCENDING';
    }
  }
}

extension OrderFromString on String {
  Order toOrder() {
    switch (this) {
      case 'ASCENDING':
        return Order.ascending;
      case 'DESCENDING':
        return Order.descending;
    }
    throw Exception('$this is not known in enum Order');
  }
}

/// Filter criteria that orders the return output. It can be sorted in ascending
/// or descending order.
class OrderBy {
  /// The property name.
  final String propertyName;

  /// The set order that filters results.
  final Order? order;

  OrderBy({
    required this.propertyName,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final propertyName = this.propertyName;
    final order = this.order;
    return {
      'propertyName': propertyName,
      if (order != null) 'order': order.toValue(),
    };
  }
}

enum OrderByTime {
  ascending,
  descending,
}

extension OrderByTimeValueExtension on OrderByTime {
  String toValue() {
    switch (this) {
      case OrderByTime.ascending:
        return 'ASCENDING';
      case OrderByTime.descending:
        return 'DESCENDING';
    }
  }
}

extension OrderByTimeFromString on String {
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

extension ParentEntityUpdateTypeValueExtension on ParentEntityUpdateType {
  String toValue() {
    switch (this) {
      case ParentEntityUpdateType.update:
        return 'UPDATE';
      case ParentEntityUpdateType.delete:
        return 'DELETE';
    }
  }
}

extension ParentEntityUpdateTypeFromString on String {
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

enum PricingMode {
  basic,
  standard,
  tieredBundle,
}

extension PricingModeValueExtension on PricingMode {
  String toValue() {
    switch (this) {
      case PricingMode.basic:
        return 'BASIC';
      case PricingMode.standard:
        return 'STANDARD';
      case PricingMode.tieredBundle:
        return 'TIERED_BUNDLE';
    }
  }
}

extension PricingModeFromString on String {
  PricingMode toPricingMode() {
    switch (this) {
      case 'BASIC':
        return PricingMode.basic;
      case 'STANDARD':
        return PricingMode.standard;
      case 'TIERED_BUNDLE':
        return PricingMode.tieredBundle;
    }
    throw Exception('$this is not known in enum PricingMode');
  }
}

/// The pricing plan.
class PricingPlan {
  /// The effective date and time of the pricing plan.
  final DateTime effectiveDateTime;

  /// The pricing mode.
  final PricingMode pricingMode;

  /// The set date and time for updating a pricing plan.
  final DateTime updateDateTime;

  /// The update reason for changing a pricing plan.
  final UpdateReason updateReason;

  /// The billable entity count.
  final int? billableEntityCount;

  /// The pricing plan's bundle information.
  final BundleInformation? bundleInformation;

  PricingPlan({
    required this.effectiveDateTime,
    required this.pricingMode,
    required this.updateDateTime,
    required this.updateReason,
    this.billableEntityCount,
    this.bundleInformation,
  });

  factory PricingPlan.fromJson(Map<String, dynamic> json) {
    return PricingPlan(
      effectiveDateTime:
          nonNullableTimeStampFromJson(json['effectiveDateTime'] as Object),
      pricingMode: (json['pricingMode'] as String).toPricingMode(),
      updateDateTime:
          nonNullableTimeStampFromJson(json['updateDateTime'] as Object),
      updateReason: (json['updateReason'] as String).toUpdateReason(),
      billableEntityCount: json['billableEntityCount'] as int?,
      bundleInformation: json['bundleInformation'] != null
          ? BundleInformation.fromJson(
              json['bundleInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveDateTime = this.effectiveDateTime;
    final pricingMode = this.pricingMode;
    final updateDateTime = this.updateDateTime;
    final updateReason = this.updateReason;
    final billableEntityCount = this.billableEntityCount;
    final bundleInformation = this.bundleInformation;
    return {
      'effectiveDateTime': unixTimestampToJson(effectiveDateTime),
      'pricingMode': pricingMode.toValue(),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'updateReason': updateReason.toValue(),
      if (billableEntityCount != null)
        'billableEntityCount': billableEntityCount,
      if (bundleInformation != null) 'bundleInformation': bundleInformation,
    };
  }
}

enum PricingTier {
  tier_1,
  tier_2,
  tier_3,
  tier_4,
}

extension PricingTierValueExtension on PricingTier {
  String toValue() {
    switch (this) {
      case PricingTier.tier_1:
        return 'TIER_1';
      case PricingTier.tier_2:
        return 'TIER_2';
      case PricingTier.tier_3:
        return 'TIER_3';
      case PricingTier.tier_4:
        return 'TIER_4';
    }
  }
}

extension PricingTierFromString on String {
  PricingTier toPricingTier() {
    switch (this) {
      case 'TIER_1':
        return PricingTier.tier_1;
      case 'TIER_2':
        return PricingTier.tier_2;
      case 'TIER_3':
        return PricingTier.tier_3;
      case 'TIER_4':
        return PricingTier.tier_4;
    }
    throw Exception('$this is not known in enum PricingTier');
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

  /// A friendly name for the property.
  final String? displayName;

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
    this.displayName,
    this.isExternalId,
    this.isRequiredInEntity,
    this.isStoredExternally,
    this.isTimeSeries,
  });

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final displayName = this.displayName;
    final isExternalId = this.isExternalId;
    final isRequiredInEntity = this.isRequiredInEntity;
    final isStoredExternally = this.isStoredExternally;
    final isTimeSeries = this.isTimeSeries;
    return {
      if (configuration != null) 'configuration': configuration,
      if (dataType != null) 'dataType': dataType,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (displayName != null) 'displayName': displayName,
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

  /// A friendly name for the property.
  final String? displayName;

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
    this.displayName,
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
      displayName: json['displayName'] as String?,
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
    final displayName = this.displayName;
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
      if (displayName != null) 'displayName': displayName,
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

/// <p/>
class PropertyGroupRequest {
  /// The group type.
  final GroupType? groupType;

  /// The names of properties.
  final List<String>? propertyNames;

  PropertyGroupRequest({
    this.groupType,
    this.propertyNames,
  });

  Map<String, dynamic> toJson() {
    final groupType = this.groupType;
    final propertyNames = this.propertyNames;
    return {
      if (groupType != null) 'groupType': groupType.toValue(),
      if (propertyNames != null) 'propertyNames': propertyNames,
    };
  }
}

/// The property group response
class PropertyGroupResponse {
  /// The group types.
  final GroupType groupType;

  /// A Boolean value that specifies whether the property group is inherited from
  /// a parent entity
  final bool isInherited;

  /// The names of properties.
  final List<String> propertyNames;

  PropertyGroupResponse({
    required this.groupType,
    required this.isInherited,
    required this.propertyNames,
  });

  factory PropertyGroupResponse.fromJson(Map<String, dynamic> json) {
    return PropertyGroupResponse(
      groupType: (json['groupType'] as String).toGroupType(),
      isInherited: json['isInherited'] as bool,
      propertyNames: (json['propertyNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupType = this.groupType;
    final isInherited = this.isInherited;
    final propertyNames = this.propertyNames;
    return {
      'groupType': groupType.toValue(),
      'isInherited': isInherited,
      'propertyNames': propertyNames,
    };
  }
}

enum PropertyGroupUpdateType {
  update,
  delete,
  create,
}

extension PropertyGroupUpdateTypeValueExtension on PropertyGroupUpdateType {
  String toValue() {
    switch (this) {
      case PropertyGroupUpdateType.update:
        return 'UPDATE';
      case PropertyGroupUpdateType.delete:
        return 'DELETE';
      case PropertyGroupUpdateType.create:
        return 'CREATE';
    }
  }
}

extension PropertyGroupUpdateTypeFromString on String {
  PropertyGroupUpdateType toPropertyGroupUpdateType() {
    switch (this) {
      case 'UPDATE':
        return PropertyGroupUpdateType.update;
      case 'DELETE':
        return PropertyGroupUpdateType.delete;
      case 'CREATE':
        return PropertyGroupUpdateType.create;
    }
    throw Exception('$this is not known in enum PropertyGroupUpdateType');
  }
}

/// The latest value of the property.
class PropertyLatestValue {
  /// An object that specifies information about a property.
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
  /// This flag notes whether all values of a list or map type property are
  /// returned in the API response. The maximum number of values per property
  /// returned is 50.
  final bool? areAllPropertyValuesReturned;

  /// An object that specifies information about a property.
  final PropertyDefinitionResponse? definition;

  /// The value of the property.
  final DataValue? value;

  PropertyResponse({
    this.areAllPropertyValuesReturned,
    this.definition,
    this.value,
  });

  factory PropertyResponse.fromJson(Map<String, dynamic> json) {
    return PropertyResponse(
      areAllPropertyValuesReturned:
          json['areAllPropertyValuesReturned'] as bool?,
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
    final areAllPropertyValuesReturned = this.areAllPropertyValuesReturned;
    final definition = this.definition;
    final value = this.value;
    return {
      if (areAllPropertyValuesReturned != null)
        'areAllPropertyValuesReturned': areAllPropertyValuesReturned,
      if (definition != null) 'definition': definition,
      if (value != null) 'value': value,
    };
  }
}

/// This is an object that contains the information of a property.
class PropertySummary {
  /// This is the name of the property.
  final String propertyName;

  /// This flag notes whether all values of a list or map type property are
  /// returned in the API response. The maximum number of values per property
  /// returned is 50.
  final bool? areAllPropertyValuesReturned;

  /// This is the schema for the property.
  final PropertyDefinitionResponse? definition;

  /// This is the value for the property.
  final DataValue? value;

  PropertySummary({
    required this.propertyName,
    this.areAllPropertyValuesReturned,
    this.definition,
    this.value,
  });

  factory PropertySummary.fromJson(Map<String, dynamic> json) {
    return PropertySummary(
      propertyName: json['propertyName'] as String,
      areAllPropertyValuesReturned:
          json['areAllPropertyValuesReturned'] as bool?,
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
    final propertyName = this.propertyName;
    final areAllPropertyValuesReturned = this.areAllPropertyValuesReturned;
    final definition = this.definition;
    final value = this.value;
    return {
      'propertyName': propertyName,
      if (areAllPropertyValuesReturned != null)
        'areAllPropertyValuesReturned': areAllPropertyValuesReturned,
      if (definition != null) 'definition': definition,
      if (value != null) 'value': value,
    };
  }
}

enum PropertyUpdateType {
  update,
  delete,
  create,
  resetValue,
}

extension PropertyUpdateTypeValueExtension on PropertyUpdateType {
  String toValue() {
    switch (this) {
      case PropertyUpdateType.update:
        return 'UPDATE';
      case PropertyUpdateType.delete:
        return 'DELETE';
      case PropertyUpdateType.create:
        return 'CREATE';
      case PropertyUpdateType.resetValue:
        return 'RESET_VALUE';
    }
  }
}

extension PropertyUpdateTypeFromString on String {
  PropertyUpdateType toPropertyUpdateType() {
    switch (this) {
      case 'UPDATE':
        return PropertyUpdateType.update;
      case 'DELETE':
        return PropertyUpdateType.delete;
      case 'CREATE':
        return PropertyUpdateType.create;
      case 'RESET_VALUE':
        return PropertyUpdateType.resetValue;
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

class QueryResultValue {
  QueryResultValue();

  factory QueryResultValue.fromJson(Map<String, dynamic> _) {
    return QueryResultValue();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// Represents a single row in the query results.
class Row {
  /// The data in a row of query results.
  final List<QueryResultValue>? rowData;

  Row({
    this.rowData,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      rowData: (json['rowData'] as List?)
          ?.whereNotNull()
          .map((e) => QueryResultValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rowData = this.rowData;
    return {
      if (rowData != null) 'rowData': rowData,
    };
  }
}

/// The S3 destination configuration.
class S3DestinationConfiguration {
  /// The S3 destination configuration location.
  final String location;

  S3DestinationConfiguration({
    required this.location,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// The S3 destination source configuration.
class S3SourceConfiguration {
  /// The S3 destination source configuration location.
  final String location;

  S3SourceConfiguration({
    required this.location,
  });

  factory S3SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return S3SourceConfiguration(
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// The scene error.
class SceneError {
  /// The SceneError code.
  final SceneErrorCode? code;

  /// The SceneError message.
  final String? message;

  SceneError({
    this.code,
    this.message,
  });

  factory SceneError.fromJson(Map<String, dynamic> json) {
    return SceneError(
      code: (json['code'] as String?)?.toSceneErrorCode(),
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

enum SceneErrorCode {
  matterportError,
}

extension SceneErrorCodeValueExtension on SceneErrorCode {
  String toValue() {
    switch (this) {
      case SceneErrorCode.matterportError:
        return 'MATTERPORT_ERROR';
    }
  }
}

extension SceneErrorCodeFromString on String {
  SceneErrorCode toSceneErrorCode() {
    switch (this) {
      case 'MATTERPORT_ERROR':
        return SceneErrorCode.matterportError;
    }
    throw Exception('$this is not known in enum SceneErrorCode');
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

extension ScopeValueExtension on Scope {
  String toValue() {
    switch (this) {
      case Scope.entity:
        return 'ENTITY';
      case Scope.workspace:
        return 'WORKSPACE';
    }
  }
}

extension ScopeFromString on String {
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

/// The source configuration.
class SourceConfiguration {
  /// The source configuration type.
  final SourceType type;

  /// The source configuration IoT SiteWise configuration.
  final IotSiteWiseSourceConfiguration? iotSiteWiseConfiguration;

  /// The source configuration IoT TwinMaker configuration.
  final IotTwinMakerSourceConfiguration? iotTwinMakerConfiguration;

  /// The source configuration S3 configuration.
  final S3SourceConfiguration? s3Configuration;

  SourceConfiguration({
    required this.type,
    this.iotSiteWiseConfiguration,
    this.iotTwinMakerConfiguration,
    this.s3Configuration,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      type: (json['type'] as String).toSourceType(),
      iotSiteWiseConfiguration: json['iotSiteWiseConfiguration'] != null
          ? IotSiteWiseSourceConfiguration.fromJson(
              json['iotSiteWiseConfiguration'] as Map<String, dynamic>)
          : null,
      iotTwinMakerConfiguration: json['iotTwinMakerConfiguration'] != null
          ? IotTwinMakerSourceConfiguration.fromJson(
              json['iotTwinMakerConfiguration'] as Map<String, dynamic>)
          : null,
      s3Configuration: json['s3Configuration'] != null
          ? S3SourceConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final iotSiteWiseConfiguration = this.iotSiteWiseConfiguration;
    final iotTwinMakerConfiguration = this.iotTwinMakerConfiguration;
    final s3Configuration = this.s3Configuration;
    return {
      'type': type.toValue(),
      if (iotSiteWiseConfiguration != null)
        'iotSiteWiseConfiguration': iotSiteWiseConfiguration,
      if (iotTwinMakerConfiguration != null)
        'iotTwinMakerConfiguration': iotTwinMakerConfiguration,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

enum SourceType {
  s3,
  iotsitewise,
  iottwinmaker,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.s3:
        return 's3';
      case SourceType.iotsitewise:
        return 'iotsitewise';
      case SourceType.iottwinmaker:
        return 'iottwinmaker';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 's3':
        return SourceType.s3;
      case 'iotsitewise':
        return SourceType.iotsitewise;
      case 'iottwinmaker':
        return SourceType.iottwinmaker;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

enum State {
  creating,
  updating,
  deleting,
  active,
  error,
}

extension StateValueExtension on State {
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

extension StateFromString on String {
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

enum SyncJobState {
  creating,
  initializing,
  active,
  deleting,
  error,
}

extension SyncJobStateValueExtension on SyncJobState {
  String toValue() {
    switch (this) {
      case SyncJobState.creating:
        return 'CREATING';
      case SyncJobState.initializing:
        return 'INITIALIZING';
      case SyncJobState.active:
        return 'ACTIVE';
      case SyncJobState.deleting:
        return 'DELETING';
      case SyncJobState.error:
        return 'ERROR';
    }
  }
}

extension SyncJobStateFromString on String {
  SyncJobState toSyncJobState() {
    switch (this) {
      case 'CREATING':
        return SyncJobState.creating;
      case 'INITIALIZING':
        return SyncJobState.initializing;
      case 'ACTIVE':
        return SyncJobState.active;
      case 'DELETING':
        return SyncJobState.deleting;
      case 'ERROR':
        return SyncJobState.error;
    }
    throw Exception('$this is not known in enum SyncJobState');
  }
}

/// The SyncJob status.
class SyncJobStatus {
  /// The SyncJob error.
  final ErrorDetails? error;

  /// The SyncJob status state.
  final SyncJobState? state;

  SyncJobStatus({
    this.error,
    this.state,
  });

  factory SyncJobStatus.fromJson(Map<String, dynamic> json) {
    return SyncJobStatus(
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toSyncJobState(),
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

/// The SyncJob summary.
class SyncJobSummary {
  /// The SyncJob summary ARN.
  final String? arn;

  /// The creation date and time.
  final DateTime? creationDateTime;

  /// The SyncJob summaries status.
  final SyncJobStatus? status;

  /// The sync source.
  final String? syncSource;

  /// The update date and time.
  final DateTime? updateDateTime;

  /// The ID of the workspace that contains the sync job.
  final String? workspaceId;

  SyncJobSummary({
    this.arn,
    this.creationDateTime,
    this.status,
    this.syncSource,
    this.updateDateTime,
    this.workspaceId,
  });

  factory SyncJobSummary.fromJson(Map<String, dynamic> json) {
    return SyncJobSummary(
      arn: json['arn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      status: json['status'] != null
          ? SyncJobStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      syncSource: json['syncSource'] as String?,
      updateDateTime: timeStampFromJson(json['updateDateTime']),
      workspaceId: json['workspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final status = this.status;
    final syncSource = this.syncSource;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    return {
      if (arn != null) 'arn': arn,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (status != null) 'status': status,
      if (syncSource != null) 'syncSource': syncSource,
      if (updateDateTime != null)
        'updateDateTime': unixTimestampToJson(updateDateTime),
      if (workspaceId != null) 'workspaceId': workspaceId,
    };
  }
}

/// The sync resource filter.
class SyncResourceFilter {
  /// The external ID.
  final String? externalId;

  /// The sync resource filter resource ID.
  final String? resourceId;

  /// The sync resource filter resource type
  final SyncResourceType? resourceType;

  /// The sync resource filter's state.
  final SyncResourceState? state;

  SyncResourceFilter({
    this.externalId,
    this.resourceId,
    this.resourceType,
    this.state,
  });

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final state = this.state;
    return {
      if (externalId != null) 'externalId': externalId,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (state != null) 'state': state.toValue(),
    };
  }
}

enum SyncResourceState {
  initializing,
  processing,
  deleted,
  inSync,
  error,
}

extension SyncResourceStateValueExtension on SyncResourceState {
  String toValue() {
    switch (this) {
      case SyncResourceState.initializing:
        return 'INITIALIZING';
      case SyncResourceState.processing:
        return 'PROCESSING';
      case SyncResourceState.deleted:
        return 'DELETED';
      case SyncResourceState.inSync:
        return 'IN_SYNC';
      case SyncResourceState.error:
        return 'ERROR';
    }
  }
}

extension SyncResourceStateFromString on String {
  SyncResourceState toSyncResourceState() {
    switch (this) {
      case 'INITIALIZING':
        return SyncResourceState.initializing;
      case 'PROCESSING':
        return SyncResourceState.processing;
      case 'DELETED':
        return SyncResourceState.deleted;
      case 'IN_SYNC':
        return SyncResourceState.inSync;
      case 'ERROR':
        return SyncResourceState.error;
    }
    throw Exception('$this is not known in enum SyncResourceState');
  }
}

/// The sync resource status.
class SyncResourceStatus {
  /// The status error.
  final ErrorDetails? error;

  /// The sync resource status state.
  final SyncResourceState? state;

  SyncResourceStatus({
    this.error,
    this.state,
  });

  factory SyncResourceStatus.fromJson(Map<String, dynamic> json) {
    return SyncResourceStatus(
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toSyncResourceState(),
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

/// The sync resource summary.
class SyncResourceSummary {
  /// The external ID.
  final String? externalId;

  /// The resource ID.
  final String? resourceId;

  /// The resource type.
  final SyncResourceType? resourceType;

  /// The sync resource summary status.
  final SyncResourceStatus? status;

  /// The update date and time.
  final DateTime? updateDateTime;

  SyncResourceSummary({
    this.externalId,
    this.resourceId,
    this.resourceType,
    this.status,
    this.updateDateTime,
  });

  factory SyncResourceSummary.fromJson(Map<String, dynamic> json) {
    return SyncResourceSummary(
      externalId: json['externalId'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceType: (json['resourceType'] as String?)?.toSyncResourceType(),
      status: json['status'] != null
          ? SyncResourceStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      updateDateTime: timeStampFromJson(json['updateDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final status = this.status;
    final updateDateTime = this.updateDateTime;
    return {
      if (externalId != null) 'externalId': externalId,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status,
      if (updateDateTime != null)
        'updateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

enum SyncResourceType {
  entity,
  componentType,
}

extension SyncResourceTypeValueExtension on SyncResourceType {
  String toValue() {
    switch (this) {
      case SyncResourceType.entity:
        return 'ENTITY';
      case SyncResourceType.componentType:
        return 'COMPONENT_TYPE';
    }
  }
}

extension SyncResourceTypeFromString on String {
  SyncResourceType toSyncResourceType() {
    switch (this) {
      case 'ENTITY':
        return SyncResourceType.entity;
      case 'COMPONENT_TYPE':
        return SyncResourceType.componentType;
    }
    throw Exception('$this is not known in enum SyncResourceType');
  }
}

/// The tabular conditions.
class TabularConditions {
  /// Filter criteria that orders the output. It can be sorted in ascending or
  /// descending order.
  final List<OrderBy>? orderBy;

  /// You can filter the request using various logical operators and a key-value
  /// format. For example:
  ///
  /// <code>{"key": "serverType", "value": "webServer"}</code>
  final List<PropertyFilter>? propertyFilters;

  TabularConditions({
    this.orderBy,
    this.propertyFilters,
  });

  Map<String, dynamic> toJson() {
    final orderBy = this.orderBy;
    final propertyFilters = this.propertyFilters;
    return {
      if (orderBy != null) 'orderBy': orderBy,
      if (propertyFilters != null) 'propertyFilters': propertyFilters,
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

extension TypeValueExtension on Type {
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

extension TypeFromString on String {
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

class UpdatePricingPlanResponse {
  /// Update the current pricing plan.
  final PricingPlan currentPricingPlan;

  /// Update the pending pricing plan.
  final PricingPlan? pendingPricingPlan;

  UpdatePricingPlanResponse({
    required this.currentPricingPlan,
    this.pendingPricingPlan,
  });

  factory UpdatePricingPlanResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePricingPlanResponse(
      currentPricingPlan: PricingPlan.fromJson(
          json['currentPricingPlan'] as Map<String, dynamic>),
      pendingPricingPlan: json['pendingPricingPlan'] != null
          ? PricingPlan.fromJson(
              json['pendingPricingPlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currentPricingPlan = this.currentPricingPlan;
    final pendingPricingPlan = this.pendingPricingPlan;
    return {
      'currentPricingPlan': currentPricingPlan,
      if (pendingPricingPlan != null) 'pendingPricingPlan': pendingPricingPlan,
    };
  }
}

enum UpdateReason {
  $default,
  pricingTierUpdate,
  entityCountUpdate,
  pricingModeUpdate,
  overwritten,
}

extension UpdateReasonValueExtension on UpdateReason {
  String toValue() {
    switch (this) {
      case UpdateReason.$default:
        return 'DEFAULT';
      case UpdateReason.pricingTierUpdate:
        return 'PRICING_TIER_UPDATE';
      case UpdateReason.entityCountUpdate:
        return 'ENTITY_COUNT_UPDATE';
      case UpdateReason.pricingModeUpdate:
        return 'PRICING_MODE_UPDATE';
      case UpdateReason.overwritten:
        return 'OVERWRITTEN';
    }
  }
}

extension UpdateReasonFromString on String {
  UpdateReason toUpdateReason() {
    switch (this) {
      case 'DEFAULT':
        return UpdateReason.$default;
      case 'PRICING_TIER_UPDATE':
        return UpdateReason.pricingTierUpdate;
      case 'ENTITY_COUNT_UPDATE':
        return UpdateReason.entityCountUpdate;
      case 'PRICING_MODE_UPDATE':
        return UpdateReason.pricingModeUpdate;
      case 'OVERWRITTEN':
        return UpdateReason.overwritten;
    }
    throw Exception('$this is not known in enum UpdateReason');
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

  /// A list of services that are linked to the workspace.
  final List<String>? linkedServices;

  WorkspaceSummary({
    required this.arn,
    required this.creationDateTime,
    required this.updateDateTime,
    required this.workspaceId,
    this.description,
    this.linkedServices,
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
      linkedServices: (json['linkedServices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final updateDateTime = this.updateDateTime;
    final workspaceId = this.workspaceId;
    final description = this.description;
    final linkedServices = this.linkedServices;
    return {
      'arn': arn,
      'creationDateTime': unixTimestampToJson(creationDateTime),
      'updateDateTime': unixTimestampToJson(updateDateTime),
      'workspaceId': workspaceId,
      if (description != null) 'description': description,
      if (linkedServices != null) 'linkedServices': linkedServices,
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

class QueryTimeoutException extends _s.GenericAwsException {
  QueryTimeoutException({String? type, String? message})
      : super(type: type, code: 'QueryTimeoutException', message: message);
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
  'QueryTimeoutException': (type, message) =>
      QueryTimeoutException(type: type, message: message),
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
